
-- CREATE SCHEMA ClubeVideo;

CREATE TABLE ClubeVideo.Endereco(

	nEndereco		INT, 

	morada			VARCHAR(30)		NOT NULL,
	codigoPostal	VARCHAR(8)		NOT NULL,
	localidade		VARCHAR(20)		NOT NULL,
	distrito		VARCHAR(20)		NOT NULL,
	concelho	    VARCHAR(20)		NOT NULL,
	freguesia	    VARCHAR(20)		NOT NULL,
	pais			VARCHAR(20)		NOT NULL,

	PRIMARY KEY (nEndereco),
);


CREATE TABLE ClubeVideo.Empresa(

	nEmpresa		INT, 
	sigla			VARCHAR(10)		NOT NULL,
	descricao		VARCHAR(90)		NOT NULL,
	capialSocial	DECIMAL			NOT NULL,
	NIF				INT				NOT NULL	UNIQUE,
	telefone		INT				NOT NULL	UNIQUE,
	endEletronico	VARCHAR(256)	NOT NULL	UNIQUE,
	ano				INT				NOT NULL,
	CAE				INT				NOT NULL,
	Cod_endereco	INT				NOT NULL,

	PRIMARY KEY (nEmpresa),
	CONSTRAINT FKENDERECOEMP FOREIGN KEY (Cod_endereco) 
		REFERENCES ClubeVideo.Endereco(nEndereco) ON DELETE SET NULL,
	CONSTRAINT CHECKNIF CHECK(LEN(NIF) = 9), 
	CONSTRAINT CHECKTELE CHECK(LEN(telefone) = 9), 
	CONSTRAINT CHECKANO CHECK(LEN(ano) = 4),
	CONSTRAINT CHECKCAE CHECK(CAE BETWEEN 0 and 99999), 
);


CREATE TABLE ClubeVideo.LOJA (

	Cod_loja				INT					IDENTITY (1, 1),
	Nome_loja				VARCHAR(20)			NOT NULL,
	E_mail					VARCHAR(256)		UNIQUE NOT NULL,
	Telefone				VARCHAR(9)			UNIQUE NOT NULL,
	Cod_endereco			INT,	
	Cod_empresa				INT,
	ativa					BIT					NOT NULL DEFAULT 1,

	PRIMARY KEY (Cod_loja),
	CONSTRAINT FKENDERECOLOJA FOREIGN KEY(Cod_endereco) 
		REFERENCES ClubeVideo.Endereco(nEndereco) ON DELETE SET NULL,
	CONSTRAINT FKEMPRESALOJA FOREIGN KEY(Cod_empresa) 
		REFERENCES ClubeVideo.Empresa(nEmpresa) ON DELETE SET NULL,
	CONSTRAINT CHECKTELELOJA CHECK(LEN(Telefone) = 9)
);



CREATE TABLE ClubeVideo.PAGAMENTO(
	Cod_Pagamento		INT,
	Descricao			VARCHAR(20),
	PRIMARY KEY (Cod_Pagamento)
);


CREATE TABLE ClubeVideo.SITUACAO (
	Cod_Situacao		INT,
	Descricao			VARCHAR(40),
	PRIMARY KEY (Cod_Situacao)
);


CREATE TABLE ClubeVideo.PROFISSAO (
	Cod_Profissao			INT,
	Descricao				VARCHAR(60),
	Cod_pertence			INT,
	PRIMARY KEY (Cod_Profissao),
	CONSTRAINT FKPERTENCE FOREIGN KEY (Cod_pertence) REFERENCES ClubeVideo.PROFISSAO_PERTENCE(Cod) ON DELETE SET NULL
);

CREATE TABLE ClubeVideo.FUNCIONARIO (

	Cod_Funcionario				INT,
	Nome_Funcionario			VARCHAR(40)	NOT NULL,
	Data_Nascimento				DATE,
	Nacionalidade				VARCHAR(30),
	Sexo						VARCHAR(1),
	Estado_Civil				VARCHAR(20),
	Telemovel					VARCHAR(9)			NOT NULL UNIQUE,
	E_mail						VARCHAR(256)		NOT NULL UNIQUE,
	Vencimento					MONEY,
	Data_Admissao				DATE,
	Cod_endereco				INT,
	Cod_Situacao				INT,
	Cod_profissao				INT,
	Cod_tipo_pagamento			INT,
	NIF							VARCHAR(9)			UNIQUE,  
	NIB							VARCHAR(21),
	No_doc_identificacao		VARCHAR(14)			UNIQUE,
	Cod_empresa					INT,

	PRIMARY KEY(Cod_Funcionario),

	CONSTRAINT FKEMPRESA FOREIGN KEY(Cod_empresa) 
		REFERENCES ClubeVideo.Empresa(nEmpresa) ON DELETE SET NULL,
	CONSTRAINT FKENDERECO FOREIGN KEY(Cod_endereco) 
		REFERENCES ClubeVideo.Endereco(nEndereco) ON DELETE SET NULL,
	CONSTRAINT FKSITUACAO FOREIGN KEY(Cod_Situacao) 
		REFERENCES ClubeVideo.SITUACAO(Cod_Situacao) ON DELETE SET NULL,
	CONSTRAINT FKPROFISSAO FOREIGN KEY(Cod_profissao) 
		REFERENCES ClubeVideo.PROFISSAO(Cod_Profissao) ON DELETE SET NULL,
	CONSTRAINT FKPAGAMENTO FOREIGN KEY(Cod_tipo_pagamento) 
		REFERENCES ClubeVideo.PAGAMENTO(Cod_Pagamento) ON DELETE SET NULL,

	CONSTRAINT CHECKTELEFUN CHECK(LEN(Telemovel) = 9),
	CONSTRAINT CHECKNIFFUN CHECK(LEN(NIF) = 9),
	CONSTRAINT CHECKNIBFUN CHECK(LEN(NIB) = 21),
	CONSTRAINT CHECKSEXOFUN CHECK(Sexo = 'F' OR Sexo = 'M')
);



CREATE TABLE ClubeVideo.FUNCIONARIOS_EM_LOJAS (
	Cod_loja			INT,
	Cod_funcionario		INT,

	PRIMARY KEY(Cod_loja, Cod_funcionario),
	CONSTRAINT FKLOJAFUNC FOREIGN KEY(Cod_loja) 
		REFERENCES ClubeVideo.LOJA(Cod_loja) ON DELETE CASCADE,
	CONSTRAINT FKFUNCIONARIOFUNC FOREIGN KEY(Cod_funcionario) 
		REFERENCES ClubeVideo.FUNCIONARIO(Cod_Funcionario) ON DELETE CASCADE,
);



CREATE TABLE ClubeVideo.TipoIVA(

	nIVA			INT,
	percentagem		INT				NOT NULL	UNIQUE,
	descricao		VARCHAR(50)		NOT NULL,

	PRIMARY KEY (nIVA),
	CHECK(percentagem BETWEEN 0 and 100),
);


CREATE TABLE ClubeVideo.TipoStock(

	nStock		INT,
	descricao	VARCHAR(50)		NOT NULL,

	PRIMARY KEY (nStock),
);



CREATE TABLE ClubeVideo.Artigo(

	nArtigo			INT,  
	nome			VARCHAR(50)		UNIQUE		NOT NULL,
	stockMin		BIGINT,
	stockMax		BIGINT,
	precoStock		MONEY			NOT NULL,
	dataCriacao		DATE			NOT NULL,
	dataUltAlt		DATE			NOT NULL,

	IVA				INT				NOT NULL DEFAULT 1,
	stock			INT				NOT NULL DEFAULT 1,

	quantStock		INT				DEFAULT 0,							
	quantDispLojas	INT				DEFAULT 0,
	quantAlugLojas	INT				DEFAULT 0,
	estado			BIT				DEFAULT 1,							

	PRIMARY KEY (nArtigo),
	CONSTRAINT FKIVA FOREIGN KEY (IVA) 
		REFERENCES ClubeVideo.TipoIVA(nIVA) ON DELETE SET DEFAULT,
	CONSTRAINT FKSTOCK FOREIGN KEY (stock) 
		REFERENCES ClubeVideo.TipoStock(nStock) ON DELETE SET DEFAULT,
	CONSTRAINT CHECKSTOCKMIN CHECK(stockMin >= 0),
	CONSTRAINT CHECKSTOCKMAX CHECK(stockMax >= 0),
	CONSTRAINT CHECKSTOCKQT CHECK(quantStock >= 0),
	CONSTRAINT CHECKDLOJAS CHECK(quantDispLojas >= 0),
	CONSTRAINT CHECKALOJAS CHECK(quantAlugLojas >= 0),
);


CREATE TABLE ClubeVideo.Disponibilidade(

	nDisponibilidade	INT,
	descricao			VARCHAR(50)	NOT NULL,

	PRIMARY KEY (nDisponibilidade),
);



CREATE TABLE ClubeVideo.Produto(

	nProduto			INT IDENTITY (1, 1),
	artigo				INT,
	loja				INT				NOT NULL,
	disponibilidade		INT				DEFAULT 1,

	PRIMARY KEY (artigo, nProduto),
	CONSTRAINT FKARTIGOPROD FOREIGN KEY (artigo) 
		REFERENCES ClubeVideo.Artigo(nArtigo) ON DELETE CASCADE,
	CONSTRAINT FKLOJAPROD FOREIGN KEY (loja) 
		REFERENCES ClubeVideo.LOJA(Cod_loja) ON DELETE CASCADE,      
	CONSTRAINT FKDISPONIBILIDADE FOREIGN KEY (disponibilidade) 
		REFERENCES ClubeVideo.Disponibilidade(nDisponibilidade)
		ON DELETE SET NULL
);


CREATE TABLE ClubeVideo.LISTA_PRECOS(

	Cod_lista_precos				INT,  
	Descricao						VARCHAR(100) NOT NULL,
	Cod_empresa						INT,

	PRIMARY KEY(Cod_lista_precos),
	CONSTRAINT FKEMPRESALPRECOS FOREIGN KEY(Cod_empresa) 
		REFERENCES ClubeVideo.Empresa(nEmpresa)
		ON DELETE SET NULL
);



CREATE TABLE ClubeVideo.PRECO_ARTIGO(
	Cod_artigo				INT,
	Cod_lista_precos		INT,
	Preco					MONEY,

	PRIMARY KEY(Cod_lista_precos, Cod_artigo),
	CONSTRAINT FKARTIGOPRECO FOREIGN KEY(Cod_artigo) 
		REFERENCES ClubeVideo.Artigo(nArtigo)
		ON DELETE CASCADE,
	CONSTRAINT FKLISTAPRECOSPRECO FOREIGN KEY(Cod_lista_precos) 
		REFERENCES ClubeVideo.LISTA_PRECOS(Cod_lista_precos)
		ON DELETE CASCADE
);


CREATE TABLE ClubeVideo.RELACAO_TER_EMP (
	Cod_natureza					INT,
	Descricao						VARCHAR(50),

	PRIMARY KEY(Cod_natureza)
);



CREATE TABLE ClubeVideo.TERCEIRO (

	Cod_terceiro				INT,  
	Cod_empresa					INT,
	Nome_terceiro				VARCHAR(40),
	CAE							INT,
	Data_c_registo				DATE,
	Cod_relacao_ter_emp			INT,
	Telefone					VARCHAR(9)			UNIQUE NOT NULL,
	NIF							VARCHAR(9)			UNIQUE,
	Cod_morada					INT,
	E_mail						VARCHAR(256)		UNIQUE NOT NULL,
	Cod_lista_precos			INT					NOT NULL,

	PRIMARY KEY(Cod_terceiro),
	CONSTRAINT FKEMPTERCEIRO FOREIGN KEY(Cod_empresa) 
		REFERENCES ClubeVideo.Empresa(nEmpresa)
		ON DELETE SET NULL,
	CONSTRAINT FKLISTAPRECOTERCEIRO FOREIGN KEY(Cod_lista_precos)
		REFERENCES ClubeVideo.LISTA_PRECOS(Cod_lista_precos)
		ON DELETE SET NULL,
	CONSTRAINT FKRELTEREMP FOREIGN KEY(Cod_relacao_ter_emp) 
		REFERENCES ClubeVideo.RELACAO_TER_EMP(Cod_natureza)
		ON DELETE SET NULL,
	CONSTRAINT FKENDERECOTER FOREIGN KEY(Cod_morada) 
		REFERENCES ClubeVideo.Endereco(nEndereco)
		ON DELETE SET NULL,
	CONSTRAINT CHECKTELETERCEIRO CHECK(LEN(Telefone) = 9)
);



CREATE TABLE ClubeVideo.TipoDocumento(

	nTipoDoc	INT,
	empresa		INT,
	descricao	VARCHAR(50)		NOT NULL,

	PRIMARY KEY (empresa,nTipoDoc),
	CONSTRAINT FKEMPRESATPDOC FOREIGN KEY (empresa) 
		REFERENCES ClubeVideo.Empresa(nEmpresa)
		ON DELETE CASCADE,
);



CREATE TABLE ClubeVideo.Expedicao(

	nExpedicao	INT,
	descricao	VARCHAR(50)		NOT NULL,

	PRIMARY KEY (nExpedicao),
);



CREATE TABLE ClubeVideo.Documento(

	nDocumento		INT   IDENTITY (1, 1),
	tipoDoc			INT			NOT NULL,
	empresa			INT			NOT NULL,
	terceiro		INT			NOT NULL,
	loja			INT			NOT NULL,
	dataEmissao		DATE		NOT NULL,
	dataEntrega		DATE		NOT NULL,
	nVendedor		INT			NOT NULL,
	dataVencimento	DATE		NOT NULL,
	fExpedicao		INT			NOT NULL,
	endEntrega		INT			NOT NULL,
	endFaturacao	INT			NOT NULL,

	valorTotal		MONEY		DEFAULT NULL,										
	valorTotalIVA	MONEY		DEFAULT NULL,										
	estado			BIT			DEFAULT 0,											

	PRIMARY KEY (empresa,tipoDoc,nDocumento), 
	CONSTRAINT FKEMPRESADOC FOREIGN KEY (tipoDoc,empresa) 
		REFERENCES ClubeVideo.TipoDocumento(nTipoDoc,empresa) ON DELETE CASCADE,
	CONSTRAINT FKTERCEIRODOC FOREIGN KEY (terceiro) 
		REFERENCES ClubeVideo.TERCEIRO(Cod_terceiro) ON DELETE CASCADE,   
	CONSTRAINT FKLOJADOC FOREIGN KEY (loja) 
		REFERENCES ClubeVideo.LOJA(Cod_loja) ON DELETE CASCADE,        
	CONSTRAINT FKVENDEDORDOC FOREIGN KEY (nVendedor) 
		REFERENCES ClubeVideo.FUNCIONARIO(Cod_Funcionario) ON DELETE CASCADE,  
	CONSTRAINT FKEXPEDICAODOC FOREIGN KEY (fExpedicao) 
		REFERENCES ClubeVideo.Expedicao(nExpedicao) ON DELETE CASCADE,
	CONSTRAINT FKENDERECOENTDOC FOREIGN KEY (endEntrega) 
		REFERENCES ClubeVideo.Endereco(nEndereco) ON DELETE NO ACTION,
	CONSTRAINT FKENDERECOFACDOC FOREIGN KEY (endFaturacao) 
		REFERENCES ClubeVideo.Endereco(nEndereco) ON DELETE NO ACTION,
);


CREATE TABLE ClubeVideo.LinhaDocumento(

	nLinha			INT,
	documento		INT,
	tipoDoc			INT,
	empresa			INT,
	artigo			INT		NOT NULL,
	quantidade		INT		NOT NULL,
	precoUnit		MONEY,																	
	taxaIVA			INT,																	
	dataEntrega		DATE	NOT NULL,
	valorMov		MONEY,																	
	valorIVA		MONEY,																	
	valorTotalIVA	MONEY,																	
	desconto		INT		DEFAULT 0,
	estado			BIT		DEFAULT 0,														

	PRIMARY KEY (empresa,tipoDoc,documento,nLinha),
	CONSTRAINT FKDOCUMENTOLINHA FOREIGN KEY (empresa,tipoDoc,documento) 
		REFERENCES ClubeVideo.Documento(empresa,tipoDoc,nDocumento) ON DELETE CASCADE,
	CONSTRAINT FKARTIGOLINHA FOREIGN KEY (artigo) 
		REFERENCES ClubeVideo.Artigo(nArtigo) ON DELETE CASCADE,
	CONSTRAINT CHECKQTLINHA CHECK(quantidade>0),
	CONSTRAINT CHECKIVALINHA CHECK(taxaIVA BETWEEN 0 and 100),
	CONSTRAINT CHECKDESCONTOLINHA CHECK(desconto BETWEEN 0 and 100),
);



CREATE TABLE ClubeVideo.Produto_LinhaDocumento(

	produto			INT,
	artigo			INT,
	linha			INT,
	documento		INT,
	tipoDoc			INT,
	empresa			INT,
	dataDevolucao	DATE	DEFAULT NULL,	

	PRIMARY KEY (empresa,tipoDoc,documento,linha,artigo,produto),
	CONSTRAINT FKPRODUTOPROD FOREIGN KEY (artigo,produto) 
		REFERENCES ClubeVideo.Produto(artigo, nProduto),
	CONSTRAINT FKLINHAPROD FOREIGN KEY (empresa,tipoDoc,documento,linha)
		REFERENCES ClubeVideo.LinhaDocumento(empresa,tipoDoc,documento,nLinha)
		ON DELETE CASCADE,
);

CREATE TABLE ClubeVideo.[Login] (
	Cod_func		INT,
	Palavra_passe	BINARY(64) NOT NULL,
	PRIMARY KEY (Cod_func),
	CONSTRAINT FKCODFUNCIONARIOLOGIN FOREIGN KEY (Cod_func) REFERENCES ClubeVideo.FUNCIONARIO (Cod_Funcionario)
		ON DELETE CASCADE
);

CREATE TABLE ClubeVideo.PROFISSAO_PERTENCE (
	Cod INT,
	Descricao VARCHAR(10) NOT NULL,
	PRIMARY KEY (Cod)
);

--- Índices

CREATE INDEX idx_Loja ON ClubeVideo.LOJA(Cod_empresa,ativa) WITH (FILLFACTOR = 90, PAD_INDEX = ON);

CREATE INDEX idx_Produto ON ClubeVideo.Produto(loja,artigo) WITH (FILLFACTOR = 65, PAD_INDEX = ON);

CREATE INDEX idx_Funcionario ON ClubeVideo.FUNCIONARIO(Cod_empresa,Nome_Funcionario) WITH (FILLFACTOR = 85, PAD_INDEX = ON);

CREATE INDEX idx_ListaPrecos ON ClubeVideo.LISTA_PRECOS(Cod_empresa) WITH (FILLFACTOR = 85, PAD_INDEX = ON);
