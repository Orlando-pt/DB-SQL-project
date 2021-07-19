
CREATE PROCEDURE ClubeVideo.pr_Documentos_load (@empresa INT, @loja INT, @nVendedor INT = null, @tipoDoc INT) 
AS
	IF (@nVendedor is null)
	BEGIN
		SELECT * FROM ClubeVideo.Documento WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND loja=@loja;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.Documento WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND loja=@loja AND nVendedor=@nVendedor;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_NovoDocumento (@tipoDoc INT, @empresa INT, @terceiro INT, @loja INT, @dataEmissao DATE, @dataEntrega DATE, @nVendedor INT, @dataVencimento DATE, @fExpedicao INT, @endEntrega INT, @endFaturacao INT)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;

	DECLARE @estadoL AS BIT; 
	SELECT @estadoL = ativa
	FROM ClubeVideo.LOJA
	WHERE Cod_loja=@loja;

	DECLARE @funcionario AS INT; 
	SELECT @funcionario = F.Cod_Funcionario
	FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
	WHERE F.Cod_Funcionario=@nVendedor AND L.Cod_loja=@loja;

	DECLARE @Cod_relacao_ter_emp AS INT; 
	SELECT @Cod_relacao_ter_emp = Cod_relacao_ter_emp 
	FROM ClubeVideo.TERCEIRO
	WHERE Cod_terceiro=@terceiro;


	IF ((@dataEntrega<@dataEmissao) OR (@dataVencimento<@dataEntrega) OR @estadoL=0 OR (@funcionario is null)
		OR (@tipoDoc!=1 AND @Cod_relacao_ter_emp!=0) OR (@tipoDoc=1 AND (@Cod_relacao_ter_emp!=1 AND @Cod_relacao_ter_emp!=2)))
	BEGIN
		COMMIT TRANSACTION;
		
		RAISERROR('O Documento não pode ser criado', 16, 1);
		return;
	END
	ELSE
		INSERT INTO ClubeVideo.Documento (empresa, tipoDoc, terceiro, loja, dataEmissao, dataEntrega, nVendedor, dataVencimento, fExpedicao, endEntrega, endFaturacao) VALUES
		(@empresa, @tipoDoc, @terceiro, @loja, @dataEmissao, @dataEntrega, @nVendedor, @dataVencimento, @fExpedicao, @endEntrega, @endFaturacao);

		COMMIT TRANSACTION;

GO

CREATE PROCEDURE ClubeVideo.pr_UpdateDocumento (@nDocumento INT, @tipoDoc INT, @empresa INT, @estado BIT)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;


	CREATE TABLE #Documento_aux(
		loja			INT,
		estado			BIT 
	);

	INSERT INTO #Documento_aux (loja, estado) 
	SELECT loja, estado
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@nDocumento;



	CREATE TABLE #LinhaDocumento_aux(
		nLinha			INT,
		artigo			INT,
		quantidade		INT,
		valorMov		MONEY, 
		valorTotalIVA	MONEY,  
		estado			BIT
	);


	INSERT INTO #LinhaDocumento_aux (nLinha, artigo, quantidade, valorMov, valorTotalIVA, estado) 
	SELECT nLinha, artigo, quantidade, valorMov, valorTotalIVA, estado
	FROM ClubeVideo.LinhaDocumento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@nDocumento;
	

	DECLARE @estado_old AS BIT;
	SELECT @estado_old = estado
	FROM #Documento_aux;

	DECLARE @numLinhas AS INT;
	SELECT @numLinhas = count(*)
	FROM #LinhaDocumento_aux;

	DECLARE @numLinhasIncompletas AS INT = 0;

	IF (@tipoDoc!=1) 
	BEGIN
		SELECT @numLinhasIncompletas = count(*)
		FROM #LinhaDocumento_aux
		WHERE estado=0;
	END

	IF (NOT (@estado_old=0 AND @estado=1 AND @numLinhas>0 AND @numLinhasIncompletas=0))
	BEGIN

		COMMIT TRANSACTION;
		RAISERROR('O Documento não pode atualizar o seu estado', 16, 1);
		return;
	END
	ELSE
	BEGIN

		DECLARE @valorTotal AS MONEY;
		SELECT @valorTotal = sum(valorMov)
		FROM #LinhaDocumento_aux;

		DECLARE @valorTotalIVA AS MONEY;
		SELECT @valorTotalIVA = sum(valorTotalIVA)
		FROM #LinhaDocumento_aux;

		DECLARE @loja AS INT;
		SELECT @loja = loja
		FROM #Documento_aux;

		DECLARE @nProduto AS INT;
		SELECT @nProduto = max(nProduto)
		FROM ClubeVideo.Produto;


		DECLARE @artigo AS INT;
		DECLARE @quantidade AS INT;
		DECLARE @nLinha AS INT;

		DECLARE C CURSOR FAST_FORWARD
		FOR SELECT artigo, quantidade, nLinha
		FROM #LinhaDocumento_aux;

		OPEN C;
		FETCH C INTO @artigo, @quantidade, @nLinha;

		WHILE @@FETCH_STATUS = 0
		BEGIN

			IF (@tipoDoc=1 OR @tipoDoc=3)
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantStock=quantStock+@quantidade, quantDispLojas=quantDispLojas+@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=2) 
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantStock=quantStock-@quantidade, quantDispLojas=quantDispLojas-@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=4) 
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantDispLojas=quantDispLojas-@quantidade, quantAlugLojas=quantAlugLojas+@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=5) 
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantDispLojas=quantDispLojas+@quantidade, quantAlugLojas=quantAlugLojas-@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=6) 
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantStock=quantStock-@quantidade, quantDispLojas=quantDispLojas-@quantidade, quantAlugLojas=quantAlugLojas-@quantidade
				WHERE nArtigo=@artigo;
			END

			IF (@tipoDoc=1)
			BEGIN

				DECLARE @count AS INT = 0;

				WHILE (@count < @quantidade)
				BEGIN

					SET @count += 1;
					SET @nProduto += 1;

					INSERT INTO ClubeVideo.Produto (artigo, loja) VALUES
					(@artigo, @loja);
			
					EXEC ClubeVideo.pr_NovoProdutoLinha @nProduto, @artigo, @nLinha, @nDocumento, @tipoDoc, @empresa, null;
			
				END
			END


			FETCH C INTO @artigo, @quantidade, @nLinha;
		END

		CLOSE C;
		DEALLOCATE C;


		UPDATE ClubeVideo.Documento
		SET valorTotal=@valorTotal, valorTotalIVA=@valorTotalIVA, estado=@estado 
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@nDocumento;

		COMMIT TRANSACTION;

	END

GO


CREATE PROCEDURE ClubeVideo.pr_DeleteDocumento (@nDocumento INT, @tipoDoc INT, @empresa INT)
AS
	DECLARE @estado AS BIT;
	SELECT @estado = estado
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@nDocumento;

	IF (@estado=1)
	BEGIN
		RAISERROR('O Documento não pode ser eliminado', 16, 1);
		return;
	END
	ELSE
		DELETE ClubeVideo.Documento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@nDocumento;
		
GO



CREATE PROCEDURE ClubeVideo.pr_SearchDocumento (@empresa INT, @nDocumento INT = null, @tipoDoc INT, @terceiro INT = null, @loja INT = null, @dataEmissao DATE = null, @dataEntrega DATE = null, @nVendedor INT = null, @dataVencimento DATE = null, @fExpedicao INT = null, @endEntrega INT = null, @endFaturacao INT = null, @valorTotal MONEY = null,	@valorTotalIVA MONEY = null, @estado BIT = null)
AS
BEGIN

	DECLARE @sqlCommand nvarchar(1000);
	SET @sqlCommand = 'SELECT * FROM ClubeVideo.Documento';

	DECLARE @v_empresa nvarchar(100);
	SET @v_empresa = @empresa;

	SET @sqlCommand += ' WHERE empresa = ' + @v_empresa; 

	DECLARE @v_tipoDoc nvarchar(100);
	SET @v_tipoDoc = @tipoDoc;
	SET @sqlCommand += ' AND tipoDoc = ' + @v_tipoDoc;

	IF (NOT (@nDocumento is NULL))
	BEGIN
		DECLARE @v_nDocumento nvarchar(100);
		SET @v_nDocumento = @nDocumento;
		SET @sqlCommand += ' AND nDocumento = ' + @v_nDocumento;
	END

	IF (NOT (@loja is NULL))
	BEGIN
		DECLARE @v_loja nvarchar(100);
		SET @v_loja = @loja;
		SET @sqlCommand += ' AND loja = ' + @v_loja;
	END

	IF (NOT (@nVendedor is NULL))
	BEGIN
		DECLARE @v_nVendedor nvarchar(100);
		SET @v_nVendedor = @nVendedor;
		SET @sqlCommand += ' AND nVendedor = ' + @v_nVendedor;
	END

	IF (NOT (@terceiro is NULL))
	BEGIN
		DECLARE @v_terceiro nvarchar(100);
		SET @v_terceiro = @terceiro;
		SET @sqlCommand += ' AND terceiro = ' + @v_terceiro;
	END

	IF (NOT (@dataEmissao is NULL))
	BEGIN
		DECLARE @v_dataEmissao nvarchar(100);
		SET @v_dataEmissao = '''' + CAST(@dataEmissao AS nvarchar(10)) + '''';
		SET @sqlCommand += ' AND dataEmissao = ' + @v_dataEmissao;
	END

	IF (NOT (@dataEntrega is NULL))
	BEGIN
		DECLARE @v_dataEntrega nvarchar(100);
		SET @v_dataEntrega = '''' + CAST(@dataEntrega AS nvarchar(10)) + '''';
		SET @sqlCommand += ' AND dataEntrega = ' + @v_dataEntrega;
	END

	IF (NOT (@dataVencimento is NULL))
	BEGIN
		DECLARE @v_dataVencimento nvarchar(100);
		SET @v_dataVencimento = '''' + CAST(@dataVencimento AS nvarchar(10)) + '''';
		SET @sqlCommand += ' AND dataVencimento = ' + @v_dataVencimento;
	END

	IF (NOT (@fExpedicao is NULL))
	BEGIN
		DECLARE @v_fExpedicao nvarchar(100);
		SET @v_fExpedicao = @fExpedicao;
		SET @sqlCommand += ' AND fExpedicao = ' + @v_fExpedicao;
	END

	IF (NOT (@endEntrega is NULL))
	BEGIN
		DECLARE @v_endEntrega nvarchar(100);
		SET @v_endEntrega = @endEntrega;
		SET @sqlCommand += ' AND endEntrega = ' + @v_endEntrega;
	END

	IF (NOT (@endFaturacao is NULL))
	BEGIN
		DECLARE @v_endFaturacao nvarchar(100);
		SET @v_endFaturacao = @endFaturacao;
		SET @sqlCommand += ' AND endFaturacao = ' + @v_endFaturacao;
	END

	IF (NOT (@valorTotal is NULL))
	BEGIN
		DECLARE @v_valorTotal nvarchar(100);
		SET @v_valorTotal = @valorTotal;
		SET @sqlCommand += ' AND valorTotal = ' + @v_valorTotal;
	END

	IF (NOT (@valorTotalIVA is NULL))
	BEGIN
		DECLARE @v_valorTotalIVA nvarchar(100);
		SET @v_valorTotalIVA = @valorTotalIVA;
		SET @sqlCommand += ' AND valorTotalIVA = ' + @v_valorTotalIVA;
	END

	IF (NOT (@estado is NULL))
	BEGIN
		DECLARE @v_estado nvarchar(100);
		SET @v_estado = @estado;
		SET @sqlCommand += ' AND estado = ' + @v_estado;
	END

	EXEC (@sqlCommand)
END
GO


CREATE PROCEDURE ClubeVideo.pr_TipoDoc (@empresa INT, @nTipoDoc INT = null) 
AS
	IF (@nTipoDoc is null)
	BEGIN
		SELECT * FROM ClubeVideo.TipoDocumento WHERE empresa=@empresa;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.TipoDocumento WHERE empresa=@empresa AND nTipoDoc=@nTipoDoc;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_Terceiro (@Cod_empresa INT, @tipoDoc INT, @Cod_terceiro INT = null) 
AS
	IF (@Cod_terceiro is null)
	BEGIN
		IF (@tipoDoc=1)
		BEGIN
			SELECT * FROM ClubeVideo.TERCEIRO WHERE Cod_empresa=@Cod_empresa 
			AND (Cod_relacao_ter_emp=1 OR Cod_relacao_ter_emp=2);
		END
		ELSE
		BEGIN
			SELECT * FROM ClubeVideo.TERCEIRO WHERE Cod_empresa=@Cod_empresa 
			AND Cod_relacao_ter_emp=0;
		END
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.TERCEIRO WHERE Cod_terceiro=@Cod_terceiro;
	END
GO


CREATE PROCEDURE ClubeVideo.pr_Funcionario (@Cod_empresa INT, @Cod_Funcionario INT = null) 
AS
	IF (@Cod_Funcionario is null)
	BEGIN
		SELECT * FROM ClubeVideo.FUNCIONARIO WHERE Cod_empresa=@Cod_empresa;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.FUNCIONARIO WHERE Cod_Funcionario=@Cod_Funcionario;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_Expedicao (@nExpedicao INT = null) 
AS
	IF (@nExpedicao is null)
	BEGIN
		SELECT * FROM ClubeVideo.Expedicao;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.Expedicao WHERE nExpedicao=@nExpedicao;
	END
GO

CREATE PROCEDURE ClubeVideo.pr_Funcionario_load (@Cod_loja INT = null)
AS
	IF (@Cod_loja IS null)
	BEGIN
		SELECT * FROM ClubeVideo.FUNCIONARIO;
	END
	ELSE
	BEGIN
		SELECT F.Cod_Funcionario, F.Nome_Funcionario, F.Data_Nascimento, F.Nacionalidade, F.Sexo, F.Estado_Civil, F.Telemovel, F.E_mail, F.Vencimento, F.Data_Admissao, F.Cod_endereco, F.Cod_Situacao, F.Cod_profissao, F.Cod_tipo_pagamento, F.NIF, F.NIB, F.No_doc_identificacao, F.Cod_empresa 
		FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
		WHERE L.Cod_loja = @Cod_loja;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_UpdateFuncionario (@Cod_Funcionario INT, @Estado_Civil VARCHAR(20), @Telemovel VARCHAR(9), @E_mail VARCHAR(256), @Vencimento MONEY, @Cod_endereco INT, @Cod_Situacao INT, @Cod_profissao INT, @Cod_tipo_pagamento INT, @NIB VARCHAR(21))
AS
	UPDATE ClubeVideo.FUNCIONARIO 
	SET Estado_Civil = @Estado_Civil, Telemovel = @Telemovel, E_mail = @E_mail, Vencimento = @Vencimento, Cod_endereco = @Cod_endereco, Cod_Situacao = @Cod_Situacao, Cod_profissao = @Cod_profissao, Cod_tipo_pagamento = @Cod_tipo_pagamento, NIB = @NIB
	WHERE Cod_Funcionario = @Cod_Funcionario;

GO



CREATE PROCEDURE ClubeVideo.pr_criarFuncionario (@Cod_Funcionario INT, @Nome_Funcionario VARCHAR(40), @Data_Nascimento DATE, @Nacionalidade VARCHAR(30),
@Sexo VARCHAR(1), @Estado_Civil VARCHAR(20), @Telemovel VARCHAR(9), @E_mail VARCHAR(256), @Vencimento MONEY, @Data_Admissao DATE, @Cod_endereco INT, 
@Cod_Situacao INT, @Cod_profissao INT, @Cod_tipo_pagamento INT, @NIF VARCHAR(9), @NIB VARCHAR(21), @No_doc_identificacao VARCHAR(14), @Cod_empresa INT)
AS
	INSERT INTO ClubeVideo.FUNCIONARIO VALUES
	(@Cod_Funcionario, @Nome_Funcionario, @Data_Nascimento, @Nacionalidade, @Sexo, @Estado_Civil, @Telemovel, @E_mail, @Vencimento, 
	@Data_Admissao, @Cod_endereco, @Cod_Situacao, @Cod_profissao, @Cod_tipo_pagamento, @NIF, @NIB, @No_doc_identificacao, @Cod_empresa);

GO


CREATE PROCEDURE ClubeVideo.pr_SearchFuncionarioLoja (@Cod_empresa INT, @Cod_loja INT = null, @Cod_Funcionario INT = null, @Nome_Funcionario VARCHAR(40) = null, @Data_Nascimento DATE = null, @Nacionalidade VARCHAR(30) = null, @Sexo VARCHAR(1) = null, @Estado_Civil VARCHAR(20) = null, @Telemovel VARCHAR(9) = null, @E_mail VARCHAR(256) = null, @Vencimento MONEY = null, @Data_Admissao DATE = null, @Cod_endereco INT = null, @Cod_Situacao INT = null, @Cod_profissao INT = null, @Cod_tipo_pagamento INT = null, @NIF VARCHAR(9) = null, @NIB VARCHAR(21) = null, @No_doc_identificacao VARCHAR(14) = null)
AS
BEGIN

	DECLARE @sqlCommand nvarchar(2000);

	DECLARE @v_Cod_empresa nvarchar(100);
	SET @v_Cod_empresa = @Cod_empresa;


	IF (NOT (@Cod_loja is NULL))
	BEGIN

		SET @sqlCommand = 'SELECT F.Cod_Funcionario, Nome_Funcionario, Data_Nascimento, Nacionalidade, Sexo , Estado_Civil, Telemovel , E_mail, Vencimento, Data_Admissao, Cod_endereco, Cod_Situacao, Cod_profissao, Cod_tipo_pagamento, NIF, NIB, No_doc_identificacao, Cod_empresa, Cod_loja FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario';

		DECLARE @v_Cod_loja nvarchar(100);
		SET @v_Cod_loja = @Cod_loja;

		SET @sqlCommand += ' WHERE Cod_empresa = ' + @v_Cod_empresa + ' AND Cod_loja = ' + @v_Cod_loja; 
	END
	ELSE
	BEGIN
		
		SET @sqlCommand = 'SELECT * FROM ClubeVideo.FUNCIONARIO';
		SET @sqlCommand += ' WHERE Cod_empresa = ' + @v_Cod_empresa; 
	END

	IF (NOT (@Cod_Funcionario is NULL))
	BEGIN
		DECLARE @v_Cod_Funcionario nvarchar(100);
		SET @v_Cod_Funcionario = @Cod_Funcionario;
		SET @sqlCommand += ' AND Cod_Funcionario = ' + @v_Cod_Funcionario;
	END

	IF (NOT (@Nome_Funcionario is NULL))
	BEGIN
		DECLARE @v_Nome_Funcionario nvarchar(100);
		SET @v_Nome_Funcionario = '''' + @Nome_Funcionario + '''';
		SET @sqlCommand += ' AND Nome_Funcionario = ' + @v_Nome_Funcionario; 
	END

	IF (NOT (@Data_Nascimento is NULL))
	BEGIN
		DECLARE @v_Data_Nascimento nvarchar(100);
		SET @v_Data_Nascimento = '''' + CAST(@Data_Nascimento AS nvarchar(10)) + '''';
		SET @sqlCommand += ' AND Data_Nascimento = ' + @v_Data_Nascimento; 
	END

	IF (NOT (@Nacionalidade is NULL))
	BEGIN
		DECLARE @v_Nacionalidade nvarchar(100);
		SET @v_Nacionalidade = '''' + @Nacionalidade + '''';
		SET @sqlCommand += ' AND Nacionalidade = ' + @v_Nacionalidade; 
	END

	IF (NOT (@Sexo is NULL))
	BEGIN
		DECLARE @v_Sexo nvarchar(100);
		SET @v_Sexo = '''' + @Sexo + '''';
		SET @sqlCommand += ' AND Sexo = ' + @v_Sexo; 
	END

	IF (NOT (@Estado_Civil is NULL))
	BEGIN
		DECLARE @v_Estado_Civil nvarchar(100);
		SET @v_Estado_Civil = '''' + @Estado_Civil + '''';
		SET @sqlCommand += ' AND Estado_Civil = ' + @v_Estado_Civil; 
	END

	IF (NOT (@Telemovel is NULL))
	BEGIN
		DECLARE @v_Telemovel nvarchar(100);
		SET @v_Telemovel = '''' + @Telemovel + '''';
		SET @sqlCommand += ' AND Telemovel = ' + @v_Telemovel; 
	END

	IF (NOT (@E_mail is NULL))
	BEGIN
		DECLARE @v_E_mail nvarchar(100);
		SET @v_E_mail = '''' + @E_mail + '''';
		SET @sqlCommand += ' AND E_mail = ' + @v_E_mail; 
	END

	IF (NOT (@Vencimento is NULL))
	BEGIN
		DECLARE @v_Vencimento nvarchar(100);
		SET @v_Vencimento = @Vencimento;
		SET @sqlCommand += ' AND Vencimento = ' + @v_Vencimento; 
	END

	IF (NOT (@Data_Admissao is NULL))
	BEGIN
		DECLARE @v_Data_Admissao nvarchar(100);
		SET @v_Data_Admissao = '''' + CAST(@Data_Admissao AS nvarchar(10)) + '''';
		SET @sqlCommand += ' AND Data_Admissao = ' + @v_Data_Admissao; 
	END

	IF (NOT (@Cod_endereco is NULL))
	BEGIN
		DECLARE @v_Cod_endereco nvarchar(100);
		SET @v_Cod_endereco = @Cod_endereco;
		SET @sqlCommand += ' AND Cod_endereco = ' + @v_Cod_endereco; 
	END

	IF (NOT (@Cod_Situacao is NULL))
	BEGIN
		DECLARE @v_Cod_Situacao nvarchar(100);
		SET @v_Cod_Situacao = @Cod_Situacao;
		SET @sqlCommand += ' AND Cod_Situacao = ' + @v_Cod_Situacao; 
	END

	IF (NOT (@Cod_profissao is NULL))
	BEGIN
		DECLARE @v_Cod_profissao nvarchar(100);
		SET @v_Cod_profissao = @Cod_profissao;
		SET @sqlCommand += ' AND Cod_profissao = ' + @v_Cod_profissao; 
	END

	IF (NOT (@Cod_tipo_pagamento is NULL))
	BEGIN
		DECLARE @v_Cod_tipo_pagamento nvarchar(100);
		SET @v_Cod_tipo_pagamento = @Cod_tipo_pagamento;
		SET @sqlCommand += ' AND Cod_tipo_pagamento = ' + @v_Cod_tipo_pagamento; 
	END

	IF (NOT (@NIF is NULL))
	BEGIN
		DECLARE @v_NIF nvarchar(100);
		SET @v_NIF = '''' + @NIF + '''';
		SET @sqlCommand += ' AND NIF = ' + @v_NIF; 
	END

	IF (NOT (@NIB is NULL))
	BEGIN
		DECLARE @v_NIB nvarchar(100);
		SET @v_NIB = '''' + @NIB + '''';
		SET @sqlCommand += ' AND NIB = ' + @v_NIB; 
	END

	IF (NOT (@No_doc_identificacao is NULL))
	BEGIN
		DECLARE @v_No_doc_identificacao nvarchar(100);
		SET @v_No_doc_identificacao = '''' + @No_doc_identificacao + '''';
		SET @sqlCommand += ' AND No_doc_identificacao = ' + @v_No_doc_identificacao; 
	END

	EXEC (@sqlCommand)
END
GO


CREATE PROCEDURE ClubeVideo.pr_Situacao (@Cod_Situacao INT = null) 
AS
	IF (@Cod_Situacao is null)
	BEGIN
		SELECT * FROM ClubeVideo.SITUACAO;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.SITUACAO WHERE Cod_Situacao=@Cod_Situacao;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_Profissao (@Cod_Profissao INT = null) 
AS
	IF (@Cod_Profissao is null)
	BEGIN
		SELECT * FROM ClubeVideo.PROFISSAO;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.PROFISSAO WHERE Cod_Profissao=@Cod_Profissao;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_Pagamento (@Cod_Pagamento INT = null) 
AS
	IF (@Cod_Pagamento is null)
	BEGIN
		SELECT * FROM ClubeVideo.PAGAMENTO;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.PAGAMENTO WHERE Cod_Pagamento=@Cod_Pagamento;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_FuncionarioLojas_load (@Cod_funcionario INT)
AS
	SELECT LL.Cod_loja, LL.Nome_loja, LL.E_mail, LL.Telefone, LL.Cod_endereco, LL.Cod_empresa, LL.ativa
	FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
	JOIN ClubeVideo.LOJA AS LL ON L.Cod_loja=LL.Cod_loja
	WHERE F.Cod_Funcionario=@Cod_funcionario;
GO



CREATE PROCEDURE ClubeVideo.pr_FuncionarioNLojas_load (@Cod_funcionario INT)
AS

	SELECT LLL.Cod_loja, LLL.Nome_loja, LLL.E_mail, LLL.Telefone, LLL.Cod_endereco, LLL.Cod_empresa, LLL.ativa
	FROM ClubeVideo.LOJA AS LLL
	EXCEPT (SELECT LL.Cod_loja, LL.Nome_loja, LL.E_mail, LL.Telefone, LL.Cod_endereco, LL.Cod_empresa, LL.ativa
				FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
				JOIN ClubeVideo.LOJA AS LL ON L.Cod_loja=LL.Cod_loja
				WHERE F.Cod_Funcionario=@Cod_funcionario);
GO



CREATE PROCEDURE ClubeVideo.pr_insertFuncionarioLoja (@Cod_loja INT, @Cod_funcionario INT)
AS
	INSERT INTO ClubeVideo.FUNCIONARIOS_EM_LOJAS VALUES 
	(@Cod_loja, @Cod_funcionario);
GO


CREATE PROCEDURE ClubeVideo.pr_deleteFuncionarioLoja (@Cod_loja INT, @Cod_funcionario INT)
AS
	DELETE ClubeVideo.FUNCIONARIOS_EM_LOJAS 
	WHERE Cod_loja=@Cod_loja AND Cod_funcionario=@Cod_funcionario;
GO


CREATE PROCEDURE ClubeVideo.pr_NovaLinha (@nLinha INT, @documento INT, @tipoDoc INT, @empresa INT, @artigo INT, @quantidade INT, @dataEntrega DATE, @desconto INT = null)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;


	CREATE TABLE #Documento_aux(
		dataEntrega		DATE,
		dataVencimento	DATE,
		estado			BIT 
	);

	INSERT INTO #Documento_aux (dataEntrega,dataVencimento,estado) 
	SELECT dataEntrega, dataVencimento, estado
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@documento;

	DECLARE @estadoD AS BIT;
	SELECT @estadoD = estado
	FROM #Documento_aux;

	DECLARE @dataEntregaD AS DATE;
	SELECT @dataEntregaD = dataEntrega
	FROM #Documento_aux;

	DECLARE @dataVencimentoD AS DATE;
	SELECT @dataVencimentoD = dataVencimento
	FROM #Documento_aux;

	IF (@estadoD=0 AND (@dataEntrega>@dataEntregaD) AND (@dataEntrega<@dataVencimentoD))
	BEGIN

		IF (@desconto is null)
		BEGIN
			INSERT INTO ClubeVideo.LinhaDocumento (empresa, tipoDoc, documento, nLinha, artigo, quantidade, dataEntrega) VALUES
			(@empresa, @tipoDoc, @documento, @nLinha, @artigo, @quantidade, @dataEntrega);

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			INSERT INTO ClubeVideo.LinhaDocumento (empresa, tipoDoc, documento, nLinha, artigo, quantidade, dataEntrega, desconto) VALUES
			(@empresa, @tipoDoc, @documento, @nLinha, @artigo, @quantidade, @dataEntrega, @desconto);

			COMMIT TRANSACTION;
		END
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION;
		RAISERROR('Não é possivel inserir a Linha no Documento', 16, 1);
		return;
	END
GO


CREATE PROCEDURE ClubeVideo.pr_UpdateLinha (@nLinha INT, @documento INT, @tipoDoc INT, @empresa INT, @estado BIT)
AS
	UPDATE ClubeVideo.LinhaDocumento
	SET estado=@estado
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@nLinha;
GO


CREATE PROCEDURE ClubeVideo.pr_deleteLinha (@nLinha INT, @documento INT, @tipoDoc INT, @empresa INT)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;

	DECLARE @estadoD AS BIT;
	SELECT @estadoD = estado
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@documento;

	IF (@estadoD=1)
	BEGIN
		COMMIT TRANSACTION;
		RAISERROR('Não é possivel eliminar a Linha no Documento', 16, 1);
		return;
	END
	ELSE
	BEGIN
		DELETE ClubeVideo.LinhaDocumento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@nLinha;

		COMMIT TRANSACTION;
	END
GO


CREATE PROCEDURE ClubeVideo.pr_SearchLinha (@empresa INT, @nLinha INT = null, @documento INT, @tipoDoc INT, @artigo INT = null, @quantidade INT = null, @precoUnit MONEY = null, @taxaIVA INT = null, @dataEntrega DATE = null, @valorMov MONEY = null, @valorIVA MONEY = null, @valorTotalIVA MONEY = null, @desconto INT = null, @estado BIT = null)
AS
BEGIN

	DECLARE @sqlCommand nvarchar(1000);
	SET @sqlCommand = 'SELECT * FROM ClubeVideo.LinhaDocumento';

	DECLARE @v_empresa nvarchar(100);
	SET @v_empresa = @empresa;

	SET @sqlCommand += ' WHERE empresa = ' + @v_empresa; 


	DECLARE @v_tipoDoc nvarchar(100);
	SET @v_tipoDoc = @tipoDoc;
	SET @sqlCommand += ' AND tipoDoc = ' + @v_tipoDoc;

	DECLARE @v_documento nvarchar(100);
	SET @v_documento = @documento;
	SET @sqlCommand += ' AND documento = ' + @v_documento;

	IF (NOT (@nLinha is NULL))
	BEGIN
		DECLARE @v_nLinha nvarchar(100);
		SET @v_nLinha = @nLinha;
		SET @sqlCommand += ' AND nLinha = ' + @v_nLinha;
	END

	IF (NOT (@artigo is NULL))
	BEGIN
		DECLARE @v_artigo nvarchar(100);
		SET @v_artigo = @artigo;
		SET @sqlCommand += ' AND artigo = ' + @v_artigo;
	END

	IF (NOT (@quantidade is NULL))
	BEGIN
		DECLARE @v_quantidade nvarchar(100);
		SET @v_quantidade = @quantidade;
		SET @sqlCommand += ' AND quantidade = ' + @v_quantidade;
	END

	IF (NOT (@precoUnit is NULL))
	BEGIN
		DECLARE @v_precoUnit nvarchar(100);
		SET @v_precoUnit = @precoUnit;
		SET @sqlCommand += ' AND precoUnit = ' + @v_precoUnit;
	END

	IF (NOT (@taxaIVA is NULL))
	BEGIN
		DECLARE @v_taxaIVA nvarchar(100);
		SET @v_taxaIVA = @taxaIVA;
		SET @sqlCommand += ' AND taxaIVA = ' + @v_taxaIVA;
	END

	IF (NOT (@dataEntrega is NULL))
	BEGIN
		DECLARE @v_dataEntrega nvarchar(100);
		SET @v_dataEntrega = '''' + CAST(@dataEntrega AS nvarchar(10)) + '''';
		SET @sqlCommand += ' AND dataEntrega = ' + @v_dataEntrega;
	END

	IF (NOT (@valorMov is NULL))
	BEGIN
		DECLARE @v_valorMov nvarchar(100);
		SET @v_valorMov = @valorMov;
		SET @sqlCommand += ' AND valorMov = ' + @v_valorMov;
	END

	IF (NOT (@valorIVA is NULL))
	BEGIN
		DECLARE @v_valorIVA nvarchar(100);
		SET @v_valorIVA = @valorIVA;
		SET @sqlCommand += ' AND valorIVA = ' + @v_valorIVA;
	END

	IF (NOT (@valorTotalIVA is NULL))
	BEGIN
		DECLARE @v_valorTotalIVA nvarchar(100);
		SET @v_valorTotalIVA = @valorTotalIVA;
		SET @sqlCommand += ' AND valorTotalIVA = ' + @v_valorTotalIVA;
	END

	IF (NOT (@desconto is NULL))
	BEGIN
		DECLARE @v_desconto nvarchar(100);
		SET @v_desconto = @desconto;
		SET @sqlCommand += ' AND desconto = ' + @v_desconto;
	END

	IF (NOT (@estado is NULL))
	BEGIN
		DECLARE @v_estado nvarchar(100);
		SET @v_estado = @estado;
		SET @sqlCommand += ' AND estado = ' + @v_estado;
	END

	EXEC (@sqlCommand)
END
GO


CREATE PROCEDURE ClubeVideo.pr_ListasPrecos_load (@Cod_empresa INT) 
AS
	SELECT * FROM ClubeVideo.LISTA_PRECOS WHERE Cod_empresa=@Cod_empresa;		
GO



CREATE PROCEDURE ClubeVideo.pr_criarListasPrecos (@Cod_lista_precos INT, @Descricao VARCHAR(100), @Cod_empresa INT)
AS
	INSERT INTO ClubeVideo.LISTA_PRECOS VALUES 
	(@Cod_lista_precos, @Descricao, @Cod_empresa);

	DECLARE @nArtigo AS INT;
	DECLARE @precoStock AS MONEY;

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT nArtigo, precoStock
	FROM ClubeVideo.Artigo;

	OPEN C;
	FETCH C INTO @nArtigo, @precoStock;

	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT INTO ClubeVideo.PRECO_ARTIGO VALUES 
		(@nArtigo, @Cod_lista_precos, @precoStock);

		FETCH C INTO @nArtigo, @precoStock;
	END

	CLOSE C;
	DEALLOCATE C;
GO


CREATE PROCEDURE ClubeVideo.pr_SearchListaPrecos (@Cod_empresa INT, @Cod_lista_precos INT = null, @Descricao VARCHAR(100) = null)
AS
BEGIN

	DECLARE @sqlCommand nvarchar(1000);
	SET @sqlCommand = 'SELECT * FROM ClubeVideo.LISTA_PRECOS';

	DECLARE @v_Cod_empresa nvarchar(100);
	SET @v_Cod_empresa = @Cod_empresa;

	SET @sqlCommand += ' WHERE Cod_empresa = ' + @v_Cod_empresa; 


	IF (NOT (@Cod_lista_precos is NULL))
	BEGIN
		DECLARE @v_Cod_lista_precos nvarchar(100);
		SET @v_Cod_lista_precos = @Cod_lista_precos;
		SET @sqlCommand += ' AND Cod_lista_precos = ' + @v_Cod_lista_precos;
	END

	IF (NOT (@Descricao is NULL))
	BEGIN
		DECLARE @v_Descricao nvarchar(100);
		SET @v_Descricao = '''' + @Descricao + '''';
		SET @sqlCommand += ' AND Descricao = ' + @v_Descricao;
	END

	EXEC (@sqlCommand)
END
GO



CREATE PROCEDURE ClubeVideo.pr_ArtigosListasPrecos_load (@Cod_lista_precos INT) 
AS
	SELECT * FROM ClubeVideo.PRECO_ARTIGO WHERE Cod_lista_precos=@Cod_lista_precos;		
GO



CREATE PROCEDURE ClubeVideo.pr_UpdateArtigoListasPrecos (@Cod_artigo INT, @Cod_lista_precos INT, @Preco MONEY)
AS
	UPDATE ClubeVideo.PRECO_ARTIGO
	SET Preco=@Preco 
	WHERE Cod_artigo=@Cod_artigo AND Cod_lista_precos=@Cod_lista_precos;
GO



CREATE PROCEDURE ClubeVideo.pr_SearchArtigoListaPrecos (@Cod_lista_precos INT, @Cod_artigo INT = null, @Preco MONEY = null)
AS
BEGIN

	DECLARE @sqlCommand nvarchar(1000);
	SET @sqlCommand = 'SELECT * FROM ClubeVideo.PRECO_ARTIGO';

	DECLARE @v_Cod_lista_precos nvarchar(100);
	SET @v_Cod_lista_precos = @Cod_lista_precos;

	SET @sqlCommand += ' WHERE Cod_lista_precos = ' + @v_Cod_lista_precos; 


	IF (NOT (@Cod_artigo is NULL))
	BEGIN
		DECLARE @v_Cod_artigo nvarchar(100);
		SET @v_Cod_artigo = @Cod_artigo;
		SET @sqlCommand += ' AND Cod_artigo = ' + @v_Cod_artigo;
	END

	IF (NOT (@Preco is NULL))
	BEGIN
		DECLARE @v_Preco nvarchar(100);
		SET @v_Preco = @Preco;
		SET @sqlCommand += ' AND Preco = ' + @v_Preco;
	END

	EXEC (@sqlCommand)
END
GO


CREATE PROCEDURE ClubeVideo.pr_Loja (@Cod_empresa INT, @Cod_loja INT = null) 
AS
	IF (@Cod_loja is null)
	BEGIN
		SELECT * FROM ClubeVideo.LOJA WHERE Cod_empresa=@Cod_empresa;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.LOJA WHERE Cod_loja=@Cod_loja;
	END
GO


CREATE PROCEDURE ClubeVideo.pr_Lojas (@Cod_empresa INT, @Cod_funcionario INT = null)
AS
	IF (@Cod_funcionario is null)
	BEGIN
		SELECT * FROM ClubeVideo.LOJA WHERE Cod_empresa=@Cod_empresa;
	END
	ELSE
	BEGIN
		SELECT LL.Cod_loja, LL.Nome_loja, LL.E_mail, LL.Telefone, LL.Cod_endereco, LL.Cod_empresa, LL.ativa
		FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
		JOIN ClubeVideo.LOJA AS LL ON L.Cod_loja=LL.Cod_loja
		WHERE F.Cod_Funcionario=@Cod_funcionario;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_NovaLoja (@Nome_loja VARCHAR(20), @E_mail VARCHAR(256), @Telefone VARCHAR(9), @Cod_endereco INT, @Cod_empresa INT)
AS
	INSERT INTO ClubeVideo.LOJA (Nome_loja, E_mail, Telefone, Cod_endereco, Cod_empresa) VALUES
	(@Nome_loja, @E_mail, @Telefone, @Cod_endereco, @Cod_empresa)
GO



CREATE PROCEDURE ClubeVideo.pr_UpdateLoja (@Cod_loja INT, @ativa BIT)
AS
	UPDATE ClubeVideo.LOJA 
	SET ativa = @ativa 
	WHERE Cod_loja = @Cod_loja
GO



CREATE PROCEDURE ClubeVideo.pr_SearchLoja (@Cod_empresa INT, @Cod_funcionario INT = null, @Cod_loja INT = null, @Nome_loja VARCHAR(20) = null, @E_mail VARCHAR(256) = null, @Telefone VARCHAR(9) = null, @Cod_endereco INT = null, @ativa BIT = null) 
AS
BEGIN

	DECLARE @sqlCommand nvarchar(1000);

	IF (@Cod_funcionario is null)
	BEGIN
		SET @sqlCommand = 'SELECT * FROM ClubeVideo.LOJA AS LL';
	
		DECLARE @v_Cod_empresa nvarchar(100);
		SET @v_Cod_empresa = @Cod_empresa;

		SET @sqlCommand += ' WHERE LL.Cod_empresa = ' + @v_Cod_empresa; 
	END
	ELSE
	BEGIN
		SET @sqlCommand = 'SELECT LL.Cod_loja, LL.Nome_loja, LL.E_mail, LL.Telefone, LL.Cod_endereco, LL.Cod_empresa, LL.ativa FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario JOIN ClubeVideo.LOJA AS LL ON L.Cod_loja=LL.Cod_loja';
		
		DECLARE @v_Cod_Funcionario nvarchar(100);
		SET @v_Cod_Funcionario = @Cod_Funcionario;

		SET @sqlCommand += ' WHERE F.Cod_Funcionario = ' + @v_Cod_Funcionario; 
	END


	IF (NOT (@Cod_loja is NULL))
	BEGIN
		DECLARE @v_Cod_loja nvarchar(100);
		SET @v_Cod_loja = @Cod_loja;
		SET @sqlCommand += ' AND LL.Cod_loja = ' + @v_Cod_loja;
	END

	IF (NOT (@Nome_loja is NULL))
	BEGIN
		DECLARE @v_Nome_loja nvarchar(100);
		SET @v_Nome_loja = '''' + @Nome_loja + '''';
		SET @sqlCommand += ' AND LL.Nome_loja = ' + @v_Nome_loja; 
	END

	IF (NOT (@E_mail is NULL))
	BEGIN
		DECLARE @v_E_mail nvarchar(100);
		SET @v_E_mail = '''' + @E_mail + '''';
		SET @sqlCommand += ' AND LL.E_mail = ' + @v_E_mail; 
	END

	IF (NOT (@Telefone is NULL))
	BEGIN
		DECLARE @v_Telefone nvarchar(100);
		SET @v_Telefone = '''' + @Telefone + '''';
		SET @sqlCommand += ' AND LL.Telefone = ' + @v_Telefone; 
	END

	IF (NOT (@Cod_endereco is NULL))
	BEGIN
		DECLARE @v_Cod_endereco nvarchar(100);
		SET @v_Cod_endereco = @Cod_endereco;
		SET @sqlCommand += ' AND LL.Cod_endereco = ' + @v_Cod_endereco;
	END

	IF (NOT (@ativa is NULL))
	BEGIN
		DECLARE @v_ativa nvarchar(100);
		SET @v_ativa = @ativa;
		SET @sqlCommand += ' AND LL.ativa = ' + @v_ativa;
	END

	EXEC (@sqlCommand)
END
GO

CREATE PROCEDURE ClubeVideo.pr_Artigo (@nArtigo INT = null) 
AS
	IF (@nArtigo is null)
	BEGIN
		SELECT * FROM ClubeVideo.Artigo;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.Artigo WHERE nArtigo=@nArtigo;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_Disponibilidade (@nDisponibilidade INT = null) 
AS
	IF (@nDisponibilidade is null)
	BEGIN
		SELECT * FROM ClubeVideo.Disponibilidade;
	END
	ELSE
	BEGIN
		SELECT * FROM ClubeVideo.Disponibilidade WHERE nDisponibilidade=@nDisponibilidade;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_SearchProdutosLoja (@loja INT, @nProduto INT = null, @artigo INT = null, @disponibilidade INT = null)
AS
BEGIN

	DECLARE @sqlCommand nvarchar(1000);
	SET @sqlCommand = 'SELECT * FROM ClubeVideo.Produto';
	
	DECLARE @v_loja nvarchar(100);
	SET @v_loja = @loja;
	SET @sqlCommand += ' WHERE loja = ' + @v_loja; 


	IF (NOT (@artigo is NULL))
	BEGIN
		DECLARE @v_artigo nvarchar(100);
		SET @v_artigo = @artigo;
		SET @sqlCommand += ' AND artigo = ' + @v_artigo; 
	END

	IF (NOT (@nProduto is NULL))
	BEGIN
		DECLARE @v_nProduto nvarchar(100);
		SET @v_nProduto = @nProduto;
		SET @sqlCommand += ' AND nProduto = ' + @v_nProduto; 
	END

	IF (NOT (@disponibilidade is NULL))
	BEGIN
		DECLARE @v_disponibilidade nvarchar(100);
		SET @v_disponibilidade = @disponibilidade;
		SET @sqlCommand += ' AND disponibilidade = ' + @v_disponibilidade; 	
	END

	EXEC (@sqlCommand)
END
GO

CREATE PROCEDURE ClubeVideo.pr_ProdutosDisponiveis (@linha INT, @documento INT, @tipoDoc INT, @empresa INT)
AS

	DECLARE @loja AS INT;
	SELECT @loja = loja 
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@documento;

	DECLARE @artigo AS INT;
	SELECT @artigo = artigo
	FROM ClubeVideo.LinhaDocumento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@linha;


	IF (@tipoDoc=2 OR @tipoDoc=4) 
	BEGIN
		SELECT * FROM ClubeVideo.Produto WHERE loja=@loja AND artigo=@artigo AND disponibilidade=1;
	END

	IF (@tipoDoc=3) 
	BEGIN
		SELECT * FROM ClubeVideo.Produto WHERE loja=@loja AND artigo=@artigo AND disponibilidade=2;
	END

	IF (@tipoDoc=5 OR @tipoDoc=6) 
	BEGIN
		SELECT * FROM ClubeVideo.Produto WHERE loja=@loja AND artigo=@artigo AND disponibilidade=3;
	END
GO



CREATE PROCEDURE ClubeVideo.pr_NovoProdutoLinha (@produto INT, @artigo INT, @linha INT, @documento INT, @tipoDoc INT, @empresa INT, @dataDevolucao DATE = NULL)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;

	DECLARE @estadoD AS BIT;
	SELECT @estadoD = estado
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@documento;


	CREATE TABLE #LinhaDocumento_aux2(
		dataEntrega		DATE,
		artigo			INT,
		estado			BIT
	);


	INSERT INTO #LinhaDocumento_aux2 (dataEntrega, artigo, estado) 
	SELECT dataEntrega, artigo, estado
	FROM ClubeVideo.LinhaDocumento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@linha;

	DECLARE @estadoL AS BIT;
	SELECT @estadoL = estado
	FROM #LinhaDocumento_aux2;

	DECLARE @artigoL AS INT;
	SELECT @artigoL = artigo
	FROM #LinhaDocumento_aux2;


	IF (NOT (@estadoL=0 AND @estadoD=0 AND @artigo=@artigoL))
	BEGIN
		COMMIT TRANSACTION;
		RAISERROR('O Produto da Linha de Documento não pode ser criado', 16, 1);
		return;
	END
	ELSE
	BEGIN

		DECLARE @disponibilidade AS INT;
		SELECT @disponibilidade = disponibilidade
		FROM ClubeVideo.Produto 
		WHERE artigo=@artigo AND nProduto=@produto;

		IF ( ((@tipoDoc=2 OR @tipoDoc=4) AND (@disponibilidade!=1)) OR 
		((@tipoDoc=3) AND (@disponibilidade!=2)) OR ((@tipoDoc=5 OR @tipoDoc=6) AND (@disponibilidade!=3)) )
		BEGIN

			COMMIT TRANSACTION;
			RAISERROR('Produto da Linha de Documento não pode ser criado', 16, 1);
			return;
		END
		ELSE

			IF (@tipoDoc!=4) 
			BEGIN

				INSERT INTO ClubeVideo.Produto_LinhaDocumento (empresa, tipoDoc, documento, linha, artigo, produto) VALUES
				(@empresa, @tipoDoc, @documento, @linha, @artigo, @produto);

				COMMIT TRANSACTION;
				return;
			END
			ELSE 
			BEGIN 

				IF (@dataDevolucao is null)
				BEGIN

					COMMIT TRANSACTION;
					RAISERROR('O Produto da Linha de Documento não pode ser criado (indicar a data de devolução)', 16, 1);
					return;
				END
				ELSE
				BEGIN

					DECLARE @dataEntrega AS DATE;
					SELECT @dataEntrega = dataEntrega
					FROM #LinhaDocumento_aux2;

					IF(@dataDevolucao<@dataEntrega)
					BEGIN

						COMMIT TRANSACTION;
						RAISERROR('O Produto da Linha de Documento não pode ser criado (data de devolução incorreta)', 16, 1);
						return;
					END
					ELSE

						INSERT INTO ClubeVideo.Produto_LinhaDocumento (empresa, tipoDoc, documento, linha, artigo, produto, dataDevolucao) VALUES
						(@empresa, @tipoDoc, @documento, @linha, @artigo, @produto, @dataDevolucao);

						COMMIT TRANSACTION;
						return;
					END
				END
			END

GO


CREATE PROCEDURE ClubeVideo.pr_deleteProdutoLinha (@produto INT, @artigo INT, @linha INT, @documento INT, @tipoDoc INT, @empresa INT)
AS
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;

	DECLARE @estadoD AS BIT;
	SELECT @estadoD = estado
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@documento;

	IF (@estadoD=1)
	BEGIN
		COMMIT TRANSACTION;
		RAISERROR('Não é possivel eliminar o Produto da Linha de Documento', 16, 1);
		return;
	END
	ELSE
	BEGIN
		DELETE ClubeVideo.Produto_LinhaDocumento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND linha=@linha AND artigo=@artigo AND produto=@produto;

		COMMIT TRANSACTION;
	END

GO

CREATE PROCEDURE ClubeVideo.pr_TodosArtigos
AS
	SELECT * FROM ClubeVideo.Artigo;
CREATE PROCEDURE ClubeVideo.pr_UpdateArtigos @nArtigo INT = null, @nome VARCHAR(50) = null, @stockMin BIGINT = null, @stockMax BIGINT = null, @precoStock MONEY = null,
	@dataUltAlt DATE = null, @IVA INT = null, @stock INT = null, @estado BIT = null
AS
	IF CHARINDEX('''', @nome) = 0 AND CHARINDEX('"', @nome) = 0
		UPDATE ClubeVideo.Artigo SET nome = @nome, stockMin = @stockMin, stockMax = @stockMax, precoStock = @precoStock,
			dataUltAlt = @dataUltAlt, Iva = @IVA, stock = @stock, estado = @estado WHERE nArtigo = @nArtigo;
	ELSE
		RAISERROR(''' não permitido no campo "nome"', 16, 1);

CREATE PROCEDURE ClubeVideo.pr_InsertInArtigos @nArtigo INT = null, @nome VARCHAR(50) = null, @stockMin BIGINT = null, @stockMax BIGINT = null, @precoStock MONEY = null,
	@dataCriacao DATE = null, @dataUltAlt DATE = null, @IVA INT = null, @stock INT = null, @quantStock INT = null, @quantDispLojas INT = null,
	@quantAlugLojas INT = null, @estado BIT = null
AS
	DECLARE @sqlCommand NVARCHAR(800);
	DECLARE @values NVARCHAR(500) = '';

	SET @sqlCommand = 'INSERT INTO ClubeVideo.Artigo (';
	
	IF @nArtigo IS NOT NULL
	BEGIN
		SET @sqlCommand += 'nArtigo, ';
		SET @values += CAST(@nArtigo AS VARCHAR(12)) + ', ';
	END
	IF @nome IS NOT null AND CHARINDEX('''', @nome) = 0 AND CHARINDEX('"', @nome) = 0
	BEGIN
		SET @sqlCommand += 'nome, ';
		SET @values += '''' + @nome + ''', ';
	END
	IF @stockMin IS NOT null
	BEGIN
		SET @sqlCommand += 'stockMin, ';
		SET @values += CAST(@stockMin AS VARCHAR(12)) + ', ';
	END
	IF @stockMax IS NOT null
	BEGIN
		SET @sqlCommand += 'stockMax, ';
		SET @values += CAST(@stockMax AS varchar(12)) + ', ';
	END
	IF @precoStock IS NOT null
	BEGIN
		SET @sqlCommand += 'precoStock, ';
		SET @values += '''' + CAST(@precoStock AS varchar(12)) + ''', ';
	END
	IF @dataCriacao IS NOT null
	BEGIN
		SET @sqlCommand += 'dataCriacao, ';
		SET @values += '''' + CAST(@dataCriacao AS VARCHAR(15)) + ''', ';
	END
	IF @dataUltAlt IS NOT null
	BEGIN
		SET @sqlCommand += 'dataUltAlt, ';
		SET @values += '''' + CAST(@dataUltAlt AS VARCHAR(15)) + ''', ';
	END
	IF @IVA IS NOT null
	BEGIN
		SET @sqlCommand += 'Iva, ';
		SET @values += CAST(@IVA AS varchar(3)) + ', ';
	END
	IF @stock IS NOT null
	BEGIN
		SET @sqlCommand += 'stock, ';
		SET @values += CAST(@stock AS varchar(10)) + ', ';
	END
	IF @quantStock IS NOT null
	BEGIN
		SET @sqlCommand += 'quantStock, ';
		SET @values += CAST(@quantStock AS varchar(10))+ ', ';
	END
	IF @quantDispLojas IS NOT null
	BEGIN
		SET @sqlCommand += 'quantDispLojas, ';
		SET @values += CAST(@quantDispLojas AS varchar(10)) + ', ';
	END
	IF @quantAlugLojas IS NOT null
	BEGIN
		SET @sqlCommand += 'quantAlugLojas, ';
		SET @values += CAST(@quantAlugLojas AS varchar(10)) + ', ';
	END
	IF @estado IS NOT null
	BEGIN
		SET @sqlCommand += 'estado, ';
		SET @values += CAST(@estado AS VARCHAR(1)) + ', ';
	END
	
	SET @sqlCommand = SUBSTRING(@sqlCommand, 1, LEN(@sqlCommand) - 1);
	SET @values = SUBSTRING(@values, 1, LEN(@values) - 1);
	SET @sqlCommand += ') VALUES (' + @values + ');';

	EXEC (@sqlCommand);


CREATE PROCEDURE ClubeVideo.pr_todasEmpresas
AS
	SELECT * FROM ClubeVideo.Empresa;


CREATE PROCEDURE ClubeVideo.pr_criarEmpresa @nEmpresa INT = NULL, @sigla VARCHAR(10) = NULL, @descricao VARCHAR(90) = NULL,
						@capitalSocial DECIMAL(18, 0) = NULL, @NIF INT = NULL, @telefone INT = NULL, @endEletronico VARCHAR(256) = NULL,
						@ano INT = NULL, @CAE INT = NULL, @codEndereco INT = NULL, @Msg_resposta NVARCHAR(250) = '' OUTPUT
AS
	SET NOCOUNT ON;
	SET @Msg_resposta = 'ok';

	IF @codEndereco IS NULL
		BEGIN TRY
			INSERT INTO ClubeVideo.Empresa (nEmpresa, sigla, descricao, capialSocial, NIF, telefone, endEletronico, ano, CAE)
				VALUES (@nEmpresa, @sigla, @descricao, @capitalSocial, @NIF, @telefone, @endEletronico, @ano, @CAE);
		END TRY
		BEGIN CATCH
			SET @Msg_resposta = 'Erro a introduzir dados em tabela. Verifique novamente os campos';
		END CATCH
	ELSE
		BEGIN TRY
			INSERT INTO ClubeVideo.Empresa (nEmpresa, sigla, descricao, capialSocial, NIF, telefone, endEletronico, ano, CAE, Cod_endereco)
				VALUES (@nEmpresa, @sigla, @descricao, @capitalSocial, @NIF, @telefone, @endEletronico, @ano, @CAE, @codEndereco);
		END TRY
		BEGIN CATCH
			SET @Msg_resposta = 'Erro a introduzir dados em tabela. Verifique novamente os campos';
		END CATCH


CREATE PROCEDURE ClubeVideo.pr_atualizarEmpresa @nEmpresa INT = NULL, @sigla VARCHAR(10) = NULL, @descricao VARCHAR(90) = NULL,
						@capitalSocial DECIMAL(18, 0) = NULLL, @telefone INT = NULL, @endEletronico VARCHAR(256) = NULL,
						@CAE INT = NULL, @codEndereco INT = NULL, @Msg_resposta NVARCHAR(250) = '' OUTPUT
AS
	SET NOCOUNT ON;
	SET @Msg_resposta = 'ok';

	IF @codEndereco IS NULL
		BEGIN TRY
			UPDATE ClubeVideo.Empresa SET sigla = @sigla, descricao = @descricao, capialSocial = @capitalSocial,
						telefone = @telefone, endEletronico = @endEletronico, CAE = @CAE WHERE nEmpresa = @nEmpresa;
		END TRY
		BEGIN CATCH
			SET @Msg_resposta = 'Erro a introduzir dados em tabela. Verifique novamente os campos';
		END CATCH
	ELSE
		BEGIN TRY
			UPDATE ClubeVideo.Empresa SET sigla = @sigla, descricao = @descricao, capialSocial = @capitalSocial,
						telefone = @telefone, endEletronico = @endEletronico, CAE = @CAE, Cod_endereco = @codEndereco WHERE nEmpresa = @nEmpresa;
		END TRY
		BEGIN CATCH
			SET @Msg_resposta = 'Erro a introduzir dados em tabela. Verifique novamente os campos';
		END CATCH


CREATE PROCEDURE ClubeVideo.pr_TodosEnderecos
AS
	SELECT * FROM ClubeVideo.Endereco;


CREATE PROCEDURE ClubeVideo.pr_UpdateEndereco @nEndereco INT, @morada VARCHAR(20), @codigoPostal VARCHAR(10), @localidade VARCHAR(20), @distrito VARCHAR(20),
					@concelho NVARCHAR(30), @freguesia NVARCHAR(50), @pais VARCHAR(20), @Msg_resposta NVARCHAR(250)='' OUTPUT
AS
	SET NOCOUNT ON

	SET @Msg_resposta = 'ok';

	IF @nEndereco IS null
		SET @Msg_resposta = 'Introduza o número de endereço.';
	ELSE
		IF @morada IS null OR @morada = ''
			SET @Msg_resposta = 'Introduza morada.';
		ELSE
			IF @codigoPostal IS null OR @codigoPostal = ''
				SET @Msg_resposta = 'Introduza código-postal.';
			ELSE	
				IF @localidade IS null OR @localidade = ''
					SET @Msg_resposta = 'Introduza localidade.';
				ELSE
					IF @distrito IS null OR @distrito = ''
						SET @Msg_resposta = 'Introduza distrito.';
					ELSE
						IF @concelho IS null OR @concelho = ''
							SET @Msg_resposta = 'Introduza concelho.';
						ELSE
							IF @freguesia IS null OR @freguesia = ''
								SET @Msg_resposta = 'Introduza freguesia.';
							ELSE
								IF @pais IS null OR @pais = ''
									SET @Msg_resposta = 'Introduza país.';
								ELSE
								BEGIN
									BEGIN TRY
										UPDATE ClubeVideo.Endereco SET morada = @morada, codigoPostal = @codigoPostal, localidade = @localidade
											, distrito = @distrito, concelho = @concelho, freguesia = @freguesia, pais = @pais WHERE nEndereco = @nEndereco;
									END TRY
									BEGIN CATCH
										SET @Msg_resposta = 'Erro a atualizar os valores na base de dados.Verifique novamente os parâmetros.';
									END CATCH
								END


CREATE PROCEDURE ClubeVideo.pr_CriarEndereco @nEndereco INT = null, @morada VARCHAR(20) = null, @codigoPostal VARCHAR(10) = null,
					@localidade VARCHAR(20) = null, @distrito VARCHAR(20) = null,
					@concelho NVARCHAR(30) = null, @freguesia NVARCHAR(50) = null, @pais VARCHAR(20) = null, @Msg_resposta NVARCHAR(250)='' OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	SET @Msg_resposta = 'ok';

	IF @nEndereco IS null
		SET @Msg_resposta = 'Introduza o número de endereço.';
	ELSE
		IF @morada IS null OR @morada = ''
			SET @Msg_resposta = 'Introduza morada.';
		ELSE
			IF @codigoPostal IS null OR @codigoPostal = ''
				SET @Msg_resposta = 'Introduza código-postal.';
			ELSE
				IF @localidade IS null OR @localidade = ''
					SET @Msg_resposta = 'Introduza localidade.';
				ELSE
					IF @distrito IS null OR @distrito = ''
						SET @Msg_resposta = 'Introduza distrito.';
					ELSE
						IF @concelho IS null OR @concelho = ''
							SET @Msg_resposta = 'Introduza concelho.';
						ELSE
							IF @freguesia IS null OR @freguesia = ''
								SET @Msg_resposta = 'Introduza freguesia.';
							ELSE
								IF @pais IS null OR @pais = ''
									SET @Msg_resposta = 'Introduza país.';
								ELSE
								BEGIN
									BEGIN TRY
										INSERT INTO ClubeVideo.Endereco VALUES(@nEndereco, @morada, @codigoPostal, @localidade, @distrito, @concelho, @freguesia, @pais);
									END TRY
									BEGIN CATCH
										SET @Msg_resposta = 'Erro a atualizar os valores na base de dados.Verifique novamente os parâmetros.';
									END CATCH
								END
END


CREATE PROCEDURE ClubeVideo.pr_RemoverEndereco @nrEndereco INT
AS
	IF NOT EXISTS (SELECT Cod_endereco FROM ClubeVideo.Funcionario WHERE Cod_endereco = @nrEndereco)
	BEGIN
		IF NOT EXISTS (SELECT Cod_endereco FROM ClubeVideo.LOJA WHERE Cod_endereco = @nrEndereco)
		BEGIN
			IF NOT EXISTS (SELECT Cod_morada FROM ClubeVideo.TERCEIRO WHERE Cod_morada = @nrEndereco)
			BEGIN
				IF NOT EXISTS (SELECT Cod_endereco FROM ClubeVideo.Empresa WHERE Cod_endereco = @nrEndereco)
				BEGIN
					IF NOT EXISTS (SELECT endEntrega FROM ClubeVideo.Documento WHERE endEntrega = @nrEndereco)
					BEGIN
						IF NOT EXISTS (SELECT endFaturacao FROM ClubeVideo.Documento WHERE endFaturacao = @nrEndereco)
						BEGIN
							DELETE FROM ClubeVideo.Endereco WHERE nEndereco = @nrEndereco;
						END
						ELSE
						BEGIN
							RAISERROR('O endereço é usado como endereço de faturação em documento.', 16, 1);
						END
					END
					ELSE
					BEGIN
						RAISERROR('O endereço é usado como endereço de entrega em documento.', 16, 1);
					END
				END
				ELSE
				BEGIN
					RAISERROR('O endereço é usado como endereço duma empresa.', 16, 1);
				END
			END
			ELSE
			BEGIN
				RAISERROR('O endereço é usado para terceiros.', 16, 1);
			END
		END
		ELSE
		BEGIN
			RAISERROR('O endereço é usado para loja.', 16, 1);
		END
	END
	ELSE
	BEGIN
		RAISERROR('O endereço é usado para funcionário', 16, 1);
	END


CREATE PROCEDURE ClubeVideo.pr_ADICIONAR_LOGIN @Cod_funcionario INT, @Passe NVARCHAR(50), @Msg_resposta NVARCHAR(250) = '' OUTPUT
AS
	SET NOCOUNT ON;
	SET @Msg_resposta = 'ok';

	BEGIN TRY
        INSERT INTO ClubeVideo.[LOGIN]
			VALUES(@Cod_funcionario, HASHBYTES('SHA2_512', @Passe));
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER() = 2627
			SET @Msg_resposta = 'O funcionário em questão já tem login associado';
		ELSE
			SET @Msg_resposta = 'Erro a submeter valores na base de dados';
	END CATCH


CREATE PROCEDURE ClubeVideo.pr_VERIFICAR_LOGIN @Cod_funcionario INT, @Passe NVARCHAR(50), @Msg_resposta NVARCHAR(250)='' OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	SET @Cod_funcionario = REPLACE(@Cod_funcionario, '''', '''''');

    DECLARE @cod INT

    IF EXISTS (SELECT TOP 1 Cod_func FROM ClubeVideo.[LOGIN] WHERE Cod_func=@Cod_funcionario)
    BEGIN
        SET @cod=(SELECT Cod_func FROM ClubeVideo.[LOGIN] WHERE Cod_func=@Cod_funcionario AND Palavra_passe=HASHBYTES('SHA2_512', @Passe))

       IF(@cod IS NULL)
           SET @Msg_resposta='Password Incorreta'
       ELSE 
           SET @Msg_resposta='Login efetuado'
    END
    ELSE
       SET @Msg_resposta='Login invalido'

END


CREATE PROCEDURE ClubeVideo.pr_EMPRESAOULOJA @Cod_funcionario INT, @outputt INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	SET @outputt = -1;

	SELECT @outputt = Cod_pertence FROM ClubeVideo.PROFISSAO WHERE Cod_Profissao = (
		SELECT Cod_profissao FROM ClubeVideo.FUNCIONARIO WHERE Cod_Funcionario = @Cod_funcionario);
END
GO

GO
CREATE PROCEDURE ClubeVideo.pr_NOMEEMPFUN @nrEmpresa INT, @nrFuncionario INT, @nomeEmpresa VARCHAR(30) OUTPUT, @nomeFuncionario VARCHAR(40) OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	SET @nomeEmpresa = 'Erro!! Empresa não existe na bd';
	SET @nomeFuncionario = 'Erro!! Funcionario não existe na bd';

	SELECT @nomeEmpresa = descricao FROM ClubeVideo.Empresa WHERE nEmpresa = @nrEmpresa;
	SELECT @nomeFuncionario = Nome_Funcionario FROM ClubeVideo.FUNCIONARIO WHERE Cod_Funcionario = @nrFuncionario;

END


CREATE PROCEDURE ClubeVideo.pr_TodosTerceiros
AS
	SELECT * FROM ClubeVideo.TERCEIRO;


CREATE PROCEDURE ClubeVideo.pr_submeterTerceiro @codTerceiro INT = null, @codEmpresa INT = NULL, @nomeTerceiro VARCHAR(40) = NULL,
						@CAE INT = NULL, @dataRegisto DATE = NULL, @cod_relacao INT = NULL, @telefone VARCHAR(9) = NULL, 
						@NIF VARCHAR(9) = NULL, @codMorada INT = NULL, @email VARCHAR(256) = NULL, @codListaPrecos INT = NULL,
						
						@nEndereco INT = null, @morada VARCHAR(30) = null, @codigoPostal VARCHAR(8) = null,
						@localidade VARCHAR(40) = null, @distrito VARCHAR(20) = null,
						@concelho NVARCHAR(50) = null, @freguesia NVARCHAR(200) = null, @pais VARCHAR(20) = null, @Msg_resposta NVARCHAR(250)='' OUTPUT
AS
	SET NOCOUNT ON;
	SET @Msg_resposta = 'ok';

	IF NOT EXISTS (SELECT 1 FROM ClubeVideo.Endereco WHERE nEndereco = @codMorada)
	BEGIN
		IF @nEndereco IS NOT NULL
			EXEC ClubeVideo.pr_CriarEndereco @nEndereco, @morada, @codigoPostal, @localidade, @distrito, @concelho, @freguesia, @pais, @Msg_resposta OUTPUT;
		ELSE
			SET @Msg_resposta = 'O código de endereço especificado não está atribuído.';
	END

	IF @Msg_resposta = 'ok'
	BEGIN
		BEGIN TRY
		INSERT INTO ClubeVideo.TERCEIRO VALUES (@codTerceiro, @codEmpresa, @nomeTerceiro, @CAE, @dataRegisto, @cod_relacao, @telefone, 
															@NIF, @codMorada, @email, @codListaPrecos);
		END TRY
		BEGIN CATCH
			SET @Msg_resposta = 'Erro a introduzir valores na base de dados';
		END CATCH
	END


CREATE PROCEDURE ClubeVideo.pr_UpdateTerceiro @codTerceiro INT = null, @codEmpresa INT = NULL, @nomeTerceiro VARCHAR(40) = NULL,
						@CAE INT = NULL, @dataRegisto DATE = NULL, @cod_relacao INT = NULL, @telefone VARCHAR(9) = NULL, 
						@NIF VARCHAR(9) = NULL, @codMorada INT = NULL, @email VARCHAR(256) = NULL, @codListaPrecos INT = NULL, @Msg_resposta NVARCHAR(250)='' OUTPUT
AS
	SET NOCOUNT ON
	DECLARE @sqlCommand NVARCHAR(800);
	
	SET @Msg_resposta = 'ok';
	SET @sqlCommand = 'UPDATE ClubeVideo.TERCEIRO SET ';

	IF @codTerceiro IS null
		SET @Msg_resposta = 'Introduza o número de endereço.';
	ELSE
	BEGIN
		IF @codEmpresa IS NOT null
			SET @sqlCommand += ' Cod_empresa = ' + CAST(@codEmpresa AS VARCHAR(8)) + ', ';
		IF @nomeTerceiro IS NOT null AND @nomeTerceiro != ''
			SET @sqlCommand += ' Nome_terceiro = ''' + @nomeTerceiro + ''', ';
		IF @CAE IS not null
			SET @sqlCommand += ' CAE = ' + CAST(@CAE AS VARCHAR(8)) + ', ';
		IF @dataRegisto IS NOT null
			SET @sqlCommand += ' Data_c_registo = ''' + CAST(@dataRegisto AS VARCHAR(15)) + ''', ';
		IF @cod_relacao IS NOT null
			SET @sqlCommand += ' Cod_relacao_ter_emp = ' + CAST(@cod_relacao AS VARCHAR(8)) + ', ';
		IF @telefone IS NOT null AND @telefone != ''
			SET @sqlCommand += ' Telefone = ''' + @telefone + ''', ';
		IF @NIF IS NOT null AND @NIF != ''
			SET @sqlCommand += ' NIF = ''' + @NIF + ''', ';
		IF @codMorada IS NOT null
			SET @sqlCommand += ' Cod_morada = ' + CAST(@codMorada AS VARCHAR(8)) + ', ';
		IF @email IS NOT null AND @email != ''
			SET @sqlCommand += ' E_mail = ''' + @email + ''', ';
		IF @cod_relacao IS NOT null
			SET @sqlCommand += ' Cod_lista_precos = ' + CAST(@cod_relacao AS VARCHAR(8)) + ', ';

		SET @sqlCommand = SUBSTRING(@sqlCommand, 1, LEN(@sqlCommand) - 1);

		SET @sqlCommand += ' WHERE Cod_terceiro = ' + CAST(@codTerceiro AS VARCHAR(8)) + ';';

		BEGIN TRY
			EXEC(@sqlCommand);
		END TRY
		BEGIN CATCH
			-- SET @Msg_resposta = 'Ocorreu um erro a atualizar valores na tabela';
			SET @Msg_resposta = ERROR_MESSAGE();
		END CATCH
	END


CREATE PROCEDURE ClubeVideo.pr_RemoverTerceiro @codTerceiro INT
AS
	IF NOT EXISTS (SELECT terceiro FROM ClubeVideo.Documento WHERE terceiro = @codTerceiro)
		DELETE FROM ClubeVideo.TERCEIRO WHERE Cod_terceiro = @codTerceiro;
	ELSE
		RAISERROR('Impossível remover pois terceiro em causa está associado a um documento.', 16, 1);