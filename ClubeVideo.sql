USE [master]
GO
/****** Object:  Database [p3g8]    Script Date: 11/06/2020 15:42:44 ******/
CREATE DATABASE [p3g8]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'p3g8', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p3g8.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'p3g8_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p3g8_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [p3g8] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [p3g8].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [p3g8] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [p3g8] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [p3g8] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [p3g8] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [p3g8] SET ARITHABORT OFF 
GO
ALTER DATABASE [p3g8] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [p3g8] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [p3g8] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [p3g8] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [p3g8] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [p3g8] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [p3g8] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [p3g8] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [p3g8] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [p3g8] SET  ENABLE_BROKER 
GO
ALTER DATABASE [p3g8] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [p3g8] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [p3g8] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [p3g8] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [p3g8] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [p3g8] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [p3g8] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [p3g8] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [p3g8] SET  MULTI_USER 
GO
ALTER DATABASE [p3g8] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [p3g8] SET DB_CHAINING OFF 
GO
ALTER DATABASE [p3g8] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [p3g8] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [p3g8] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [p3g8] SET QUERY_STORE = OFF
GO
USE [p3g8]
GO
/****** Object:  User [p3g8]    Script Date: 11/06/2020 15:42:45 ******/
CREATE USER [p3g8] FOR LOGIN [p3g8] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [p3g8]
GO
/****** Object:  Schema [ClubeVideo]    Script Date: 11/06/2020 15:42:46 ******/
CREATE SCHEMA [ClubeVideo]
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_SearchDocumento]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_SearchDocumento] (@empresa INT, @nDocumento INT = null, @tipoDoc INT = null, @terceiro INT = null, @loja INT = null, @dataEmissao DATE = null, @dataEntrega DATE = null, @nVendedor INT = null, @dataVencimento DATE = null, @fExpedicao INT = null, @endEntrega INT = null, @endFaturacao INT = null, @valorTotal MONEY = null,	@valorTotalIVA MONEY = null)
RETURNS @table TABLE (v_empresa INT, v_nDocumento INT, v_tipoDoc INT, v_terceiro INT, v_loja INT, v_dataEmissao DATE, v_dataEntrega DATE, v_nVendedor INT, v_dataVencimento DATE, v_fExpedicao INT, v_endEntrega INT, v_endFaturacao INT, v_valorTotal MONEY, v_valorTotalIVA MONEY)
AS
BEGIN

	DECLARE @v_empresa AS INT;
	DECLARE @v_nDocumento AS INT;
	DECLARE @v_tipoDoc AS INT;
	DECLARE @v_terceiro AS INT;
	DECLARE @v_loja AS INT;
	DECLARE @v_dataEmissao AS DATE;
	DECLARE @v_dataEntrega AS DATE;
	DECLARE @v_nVendedor AS INT;
	DECLARE @v_dataVencimento AS DATE;
	DECLARE @v_fExpedicao AS INT;
	DECLARE @v_endEntrega AS INT;
	DECLARE @v_endFaturacao AS INT;
	DECLARE @v_valorTotal AS MONEY;									
	DECLARE @v_valorTotalIVA AS MONEY;


	DECLARE @count AS INT;	


	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT * FROM ClubeVideo.Documento 
	WHERE empresa=@empresa;

	OPEN C;
	FETCH C INTO @v_empresa, @v_nDocumento, @v_tipoDoc, @v_terceiro, @v_loja, @v_dataEmissao, @v_dataEntrega, @v_nVendedor, @v_dataVencimento, @v_fExpedicao, @v_endEntrega, @v_endFaturacao, @v_valorTotal, @v_valorTotalIVA;


	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @count = 1;
		
		IF (NOT (@nDocumento is NULL) AND (@v_nDocumento != @nDocumento))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@tipoDoc is NULL) AND (@v_tipoDoc != @tipoDoc))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@terceiro is NULL) AND (@v_terceiro != @terceiro))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@loja is NULL) AND (@v_loja != @loja))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@dataEmissao is NULL) AND (@v_dataEmissao != @dataEmissao))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@dataEntrega is NULL) AND (@v_dataEntrega != @dataEntrega))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@nVendedor is NULL) AND (@v_nVendedor != @nVendedor))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@dataVencimento is NULL) AND (@v_dataVencimento != @dataVencimento))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@fExpedicao is NULL) AND (@v_fExpedicao != @fExpedicao))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@endEntrega is NULL) AND (@v_endEntrega != @endEntrega))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@endFaturacao is NULL) AND (@v_endFaturacao != @endFaturacao))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@valorTotal is NULL) AND (@v_valorTotal != @valorTotal))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@valorTotalIVA is NULL) AND (@v_valorTotalIVA != @valorTotalIVA))
		BEGIN
			SET @count = 0;
		END

		--------------------------

		IF (@count = 1)
		BEGIN
			INSERT INTO @table VALUES (@v_empresa, @v_nDocumento, @v_tipoDoc, @v_terceiro, @v_loja, @v_dataEmissao, @v_dataEntrega, @v_nVendedor, @v_dataVencimento, @v_fExpedicao, @v_endEntrega, @v_endFaturacao, @v_valorTotal, @v_valorTotalIVA);
		END

		FETCH C INTO @v_empresa, @v_nDocumento, @v_tipoDoc, @v_terceiro, @v_loja, @v_dataEmissao, @v_dataEntrega, @v_nVendedor, @v_dataVencimento, @v_fExpedicao, @v_endEntrega, @v_endFaturacao, @v_valorTotal, @v_valorTotalIVA;
	END

	CLOSE C;
	DEALLOCATE C;

	return;
END
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_SearchFuncionarioLoja]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_SearchFuncionarioLoja] (@Cod_empresa INT, @Cod_loja INT, @Cod_Funcionario INT = null, @Nome_Funcionario VARCHAR(40) = null, @Data_Nascimento DATE = null, @Nacionalidade VARCHAR(30) = null, @Sexo VARCHAR(1) = null, @Estado_Civil VARCHAR(20) = null, @Telemovel VARCHAR(9) = null, @E_mail VARCHAR(256) = null, @Vencimento MONEY = null, @Data_Admissao DATE = null, @Cod_endereco INT = null, @Cod_Situacao INT = null, @Cod_profissao INT = null, @Cod_tipo_pagamento INT = null, @NIF VARCHAR(9) = null, @NIB VARCHAR(21) = null, @No_doc_identificacao VARCHAR(14) = null)
RETURNS @table TABLE (v_Cod_Funcionario INT, v_Nome_Funcionario VARCHAR(40), v_Data_Nascimento DATE, v_Nacionalidade VARCHAR(30), v_Sexo VARCHAR(1), v_Estado_Civil VARCHAR(20), v_Telemovel VARCHAR(9), v_E_mail VARCHAR(256), v_Vencimento MONEY, v_Data_Admissao DATE, v_Cod_endereco INT, v_Cod_Situacao INT, v_Cod_profissao INT, v_Cod_tipo_pagamento INT, v_NIF VARCHAR(9), v_NIB VARCHAR(21), v_No_doc_identificacao VARCHAR(14), v_Cod_empresa INT, v_Cod_loja INT)
AS
BEGIN

	DECLARE @v_Cod_Funcionario AS INT; 
	DECLARE @v_Nome_Funcionario AS VARCHAR(40); 
	DECLARE @v_Data_Nascimento AS DATE; 
	DECLARE @v_Nacionalidade AS VARCHAR(30); 
	DECLARE @v_Sexo AS VARCHAR(1); 
	DECLARE @v_Estado_Civil AS VARCHAR(20);  
	DECLARE @v_Telemovel AS VARCHAR(9);  
	DECLARE @v_E_mail AS VARCHAR(256);  
	DECLARE @v_Vencimento AS MONEY; 
	DECLARE @v_Data_Admissao AS DATE; 
	DECLARE @v_Cod_endereco AS INT; 
	DECLARE @v_Cod_Situacao AS INT;  
	DECLARE @v_Cod_profissao AS INT; 
	DECLARE @v_Cod_tipo_pagamento AS INT; 
	DECLARE @v_NIF AS VARCHAR(9);
	DECLARE @v_NIB AS VARCHAR(21);  
	DECLARE @v_No_doc_identificacao AS VARCHAR(14); 
	DECLARE @v_Cod_empresa AS INT; 
	DECLARE @v_Cod_loja AS INT; 


	DECLARE @count AS INT;	


	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT F.Cod_Funcionario, Nome_Funcionario, Data_Nascimento, Nacionalidade, Sexo , Estado_Civil, Telemovel , E_mail, Vencimento, Data_Admissao, Cod_endereco, Cod_Situacao, Cod_profissao, Cod_tipo_pagamento, NIF, NIB, No_doc_identificacao, Cod_empresa, Cod_loja  
	FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
	WHERE Cod_empresa=@Cod_empresa AND Cod_loja = @Cod_loja;

	OPEN C;
	FETCH C INTO @v_Cod_Funcionario, @v_Nome_Funcionario, @v_Data_Nascimento, @v_Nacionalidade, @v_Sexo, @v_Estado_Civil, @v_Telemovel, @v_E_mail, @v_Vencimento, @v_Data_Admissao, @v_Cod_endereco, @v_Cod_Situacao, @v_Cod_profissao, @v_Cod_tipo_pagamento, @v_NIF, @v_NIB, @v_No_doc_identificacao, @v_Cod_empresa, @v_Cod_loja;


	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @count = 1;
		
		IF (NOT (@Cod_Funcionario is NULL) AND (@v_Cod_Funcionario != @Cod_Funcionario))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Nome_Funcionario is NULL) AND (@v_Nome_Funcionario != @Nome_Funcionario))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Data_Nascimento is NULL) AND (@v_Data_Nascimento != @Data_Nascimento))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Nacionalidade is NULL) AND (@v_Nacionalidade != @Nacionalidade))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Sexo is NULL) AND (@v_Sexo != @Sexo))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Estado_Civil is NULL) AND (@v_Estado_Civil != @Estado_Civil))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Telemovel is NULL) AND (@v_Telemovel != @Telemovel))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@E_mail is NULL) AND (@v_E_mail != @E_mail))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Vencimento is NULL) AND (@v_Vencimento != @Vencimento))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Data_Admissao is NULL) AND (@v_Data_Admissao != @Data_Admissao))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_endereco is NULL) AND (@v_Cod_endereco != @Cod_endereco))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_Situacao is NULL) AND (@v_Cod_Situacao != @Cod_Situacao))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_profissao is NULL) AND (@v_Cod_profissao != @Cod_profissao))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_tipo_pagamento is NULL) AND (@v_Cod_tipo_pagamento != @Cod_tipo_pagamento))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@NIF is NULL) AND (@v_NIF != @NIF))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@NIB is NULL) AND (@v_NIB != @NIB))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@No_doc_identificacao is NULL) AND (@v_No_doc_identificacao != @No_doc_identificacao))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_empresa is NULL) AND (@v_Cod_empresa != @Cod_empresa))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_loja is NULL) AND (@v_Cod_loja != @Cod_loja))
		BEGIN
			SET @count = 0;
		END


		--------------------------

		IF (@count = 1)
		BEGIN
			INSERT INTO @table VALUES (@v_Cod_Funcionario, @v_Nome_Funcionario, @v_Data_Nascimento, @v_Nacionalidade, @v_Sexo, @v_Estado_Civil, @v_Telemovel, @v_E_mail, @v_Vencimento, @v_Data_Admissao, @v_Cod_endereco, @v_Cod_Situacao, @v_Cod_profissao, @v_Cod_tipo_pagamento, @v_NIF, @v_NIB, @v_No_doc_identificacao, @v_Cod_empresa, @v_Cod_loja);
		END

		FETCH C INTO @v_Cod_Funcionario, @v_Nome_Funcionario, @v_Data_Nascimento, @v_Nacionalidade, @v_Sexo, @v_Estado_Civil, @v_Telemovel, @v_E_mail, @v_Vencimento, @v_Data_Admissao, @v_Cod_endereco, @v_Cod_Situacao, @v_Cod_profissao, @v_Cod_tipo_pagamento, @v_NIF, @v_NIB, @v_No_doc_identificacao, @v_Cod_empresa, @v_Cod_loja;
	END

	CLOSE C;
	DEALLOCATE C;

	return;
END
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_SearchLoja]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_SearchLoja] (@Cod_empresa INT, @Cod_loja INT = null, @Nome_loja VARCHAR(20) = null, @E_mail VARCHAR(256) = null, @Telefone VARCHAR(9) = null, @Cod_endereco INT = null, @ativa BIT = null) 
RETURNS @table TABLE (v_Cod_loja INT, v_Nome_loja VARCHAR(20), v_E_mail VARCHAR(256), v_Telefone VARCHAR(9), v_Cod_endereco INT, v_Cod_empresa INT, v_ativa BIT)
AS
BEGIN

	DECLARE @v_Cod_loja AS INT;
	DECLARE @v_Nome_loja AS VARCHAR(20);
	DECLARE @v_E_mail AS VARCHAR(256);
	DECLARE @v_Telefone AS VARCHAR(9);
	DECLARE @v_Cod_endereco AS INT;
	DECLARE @v_Cod_empresa AS INT;
	DECLARE @v_ativa AS BIT;	

	DECLARE @count AS INT;	


	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT * FROM ClubeVideo.LOJA WHERE Cod_empresa=@Cod_empresa;

	OPEN C;
	FETCH C INTO @v_Cod_loja, @v_Nome_loja, @v_E_mail, @v_Telefone, @v_Cod_endereco, @v_Cod_empresa, @v_ativa;

	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @count = 1;
		
		IF (NOT (@Cod_loja is NULL) AND (@v_Cod_loja != @Cod_loja))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Nome_loja is NULL) AND (@v_Nome_loja != @Nome_loja))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@E_mail is NULL) AND (@v_E_mail != @E_mail))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Telefone is NULL) AND (@v_Telefone != @Telefone))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_endereco is NULL) AND (@v_Cod_endereco != @Cod_endereco))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@Cod_empresa is NULL) AND (@v_Cod_empresa != @Cod_empresa))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@ativa is NULL) AND (@v_ativa != @ativa))
		BEGIN
			SET @count = 0;
		END

		--------------------------

		IF (@count = 1)
		BEGIN
			INSERT INTO @table VALUES (@v_Cod_loja, @v_Nome_loja, @v_E_mail, @v_Telefone, @v_Cod_endereco, @v_Cod_empresa, @v_ativa);
		END

		FETCH C INTO @v_Cod_loja, @v_Nome_loja, @v_E_mail, @v_Telefone, @v_Cod_endereco, @v_Cod_empresa, @v_ativa;
	END

	CLOSE C;
	DEALLOCATE C;

	return;
END
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_SearchProdutosLoja]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_SearchProdutosLoja] (@loja INT, @nProduto INT = null, @artigo INT = null, @disponibilidade INT = null)
RETURNS @table TABLE (v_nProduto INT, v_artigo INT, v_loja INT, v_disponibilidade INT)
AS
BEGIN

	DECLARE @v_nProduto AS INT; 
	DECLARE @v_artigo AS INT; 
	DECLARE @v_loja AS INT; 
	DECLARE @v_disponibilidade AS INT; 


	DECLARE @count AS INT;	


	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT * FROM ClubeVideo.Produto WHERE loja = @loja;

	OPEN C;
	FETCH C INTO @v_nProduto, @v_artigo, @v_loja, @v_disponibilidade;


	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @count = 1;
		
		IF (NOT (@nProduto is NULL) AND (@v_nProduto != @nProduto))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@artigo is NULL) AND (@v_artigo != @artigo))
		BEGIN
			SET @count = 0;
		END

		IF (NOT (@disponibilidade is NULL) AND (@v_disponibilidade != @disponibilidade))
		BEGIN
			SET @count = 0;
		END

		--------------------------

		IF (@count = 1)
		BEGIN
			INSERT INTO @table VALUES (@v_nProduto, @v_artigo, @v_loja, @v_disponibilidade);
		END

		FETCH C INTO @v_nProduto, @v_artigo, @v_loja, @v_disponibilidade;
	END

	CLOSE C;
	DEALLOCATE C;

	return;
END
GO
/****** Object:  Table [ClubeVideo].[Endereco]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Endereco](
	[nEndereco] [int] NOT NULL,
	[morada] [varchar](30) NOT NULL,
	[codigoPostal] [varchar](8) NOT NULL,
	[localidade] [varchar](40) NOT NULL,
	[distrito] [varchar](20) NOT NULL,
	[concelho] [varchar](50) NOT NULL,
	[freguesia] [varchar](200) NOT NULL,
	[pais] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_EnderecoCompleto]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_EnderecoCompleto] (@nEndereco INT) RETURNS Table
AS
	RETURN(SELECT * FROM ClubeVideo.Endereco WHERE nEndereco=@nEndereco)
GO
/****** Object:  Table [ClubeVideo].[FUNCIONARIO]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[FUNCIONARIO](
	[Cod_Funcionario] [int] NOT NULL,
	[Nome_Funcionario] [varchar](40) NOT NULL,
	[Data_Nascimento] [date] NULL,
	[Nacionalidade] [varchar](30) NULL,
	[Sexo] [varchar](1) NULL,
	[Estado_Civil] [varchar](20) NULL,
	[Telemovel] [varchar](9) NOT NULL,
	[E_mail] [varchar](256) NOT NULL,
	[Vencimento] [money] NULL,
	[Data_Admissao] [date] NULL,
	[Cod_endereco] [int] NULL,
	[Cod_Situacao] [int] NULL,
	[Cod_profissao] [int] NULL,
	[Cod_tipo_pagamento] [int] NULL,
	[NIF] [varchar](9) NULL,
	[NIB] [varchar](21) NULL,
	[No_doc_identificacao] [varchar](14) NULL,
	[Cod_empresa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_EmpresaFuncionario]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_EmpresaFuncionario] (@Cod_funcionario INT) RETURNS Table
AS
	RETURN(SELECT Cod_empresa FROM ClubeVideo.FUNCIONARIO WHERE Cod_Funcionario = @Cod_funcionario)
GO
/****** Object:  Table [ClubeVideo].[LinhaDocumento]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[LinhaDocumento](
	[nLinha] [int] NOT NULL,
	[documento] [int] NOT NULL,
	[tipoDoc] [int] NOT NULL,
	[empresa] [int] NOT NULL,
	[artigo] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[precoUnit] [money] NULL,
	[taxaIVA] [int] NULL,
	[dataEntrega] [date] NOT NULL,
	[valorMov] [money] NULL,
	[valorIVA] [money] NULL,
	[valorTotalIVA] [money] NULL,
	[desconto] [int] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[empresa] ASC,
	[tipoDoc] ASC,
	[documento] ASC,
	[nLinha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_Linhas]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_Linhas] (@documento INT, @tipoDoc INT, @empresa INT) RETURNS Table
AS
	RETURN(SELECT * FROM ClubeVideo.LinhaDocumento WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento)
GO
/****** Object:  Table [ClubeVideo].[Produto]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Produto](
	[nProduto] [int] IDENTITY(1,1) NOT NULL,
	[artigo] [int] NOT NULL,
	[loja] [int] NOT NULL,
	[disponibilidade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[artigo] ASC,
	[nProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_ProdutosEmLoja]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_ProdutosEmLoja] (@loja INT) RETURNS Table
AS
	RETURN(SELECT *
		FROM ClubeVideo.Produto 
		WHERE loja = @loja)
GO
/****** Object:  Table [ClubeVideo].[Produto_LinhaDocumento]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Produto_LinhaDocumento](
	[produto] [int] NOT NULL,
	[artigo] [int] NOT NULL,
	[linha] [int] NOT NULL,
	[documento] [int] NOT NULL,
	[tipoDoc] [int] NOT NULL,
	[empresa] [int] NOT NULL,
	[dataDevolucao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[empresa] ASC,
	[tipoDoc] ASC,
	[documento] ASC,
	[linha] ASC,
	[artigo] ASC,
	[produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [ClubeVideo].[f_ProdutosLinha]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ClubeVideo].[f_ProdutosLinha] (@linha INT, @documento INT, @tipoDoc INT, @empresa INT) RETURNS Table
AS
	RETURN(SELECT * FROM ClubeVideo.Produto_LinhaDocumento 
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND linha=@linha)
GO
/****** Object:  View [dbo].[PUBANDEMPLOYEES_VIEW]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PUBANDEMPLOYEES_VIEW] AS
	SELECT pub_name, fname, minit, lname FROM (pubs.dbo.publishers JOIN pubs.dbo.employee ON publishers.pub_id=employee.pub_id);
GO
/****** Object:  View [dbo].[STOREANDTITLES_VIEW]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[STOREANDTITLES_VIEW] AS
	SELECT stor_name, title FROM (pubs.dbo.sales JOIN pubs.dbo.stores ON sales.stor_id=stores.stor_id JOIN pubs.dbo.titles ON titles.title_id=sales.title_id);
GO
/****** Object:  View [dbo].[TITLEANDAUTHORS_VIEW]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TITLEANDAUTHORS_VIEW] AS
	SELECT title, au_fname, au_lname
	FROM (pubs.dbo.titles JOIN pubs.dbo.titleauthor ON titles.title_id=titleauthor.title_id JOIN pubs.dbo.authors ON authors.au_id=titleauthor.au_id);
GO
/****** Object:  View [dbo].[titles_business]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[titles_business](title_id, title, type, pub_id, price, notes) AS
	SELECT title_id, title, type, pub_id, price, notes
	FROM pubs.dbo.titles
	WHERE type='Business';
GO
/****** Object:  Table [ClubeVideo].[Artigo]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Artigo](
	[nArtigo] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[stockMin] [bigint] NULL,
	[stockMax] [bigint] NULL,
	[precoStock] [money] NOT NULL,
	[dataCriacao] [date] NOT NULL,
	[dataUltAlt] [date] NOT NULL,
	[IVA] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[quantStock] [int] NULL,
	[quantDispLojas] [int] NULL,
	[quantAlugLojas] [int] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nArtigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[Disponibilidade]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Disponibilidade](
	[nDisponibilidade] [int] NOT NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nDisponibilidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[Documento]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Documento](
	[nDocumento] [int] IDENTITY(1,1) NOT NULL,
	[tipoDoc] [int] NOT NULL,
	[empresa] [int] NOT NULL,
	[terceiro] [int] NOT NULL,
	[loja] [int] NOT NULL,
	[dataEmissao] [date] NOT NULL,
	[dataEntrega] [date] NOT NULL,
	[nVendedor] [int] NOT NULL,
	[dataVencimento] [date] NOT NULL,
	[fExpedicao] [int] NOT NULL,
	[endEntrega] [int] NOT NULL,
	[endFaturacao] [int] NOT NULL,
	[valorTotal] [money] NULL,
	[valorTotalIVA] [money] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[empresa] ASC,
	[tipoDoc] ASC,
	[nDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[Empresa]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Empresa](
	[nEmpresa] [int] NOT NULL,
	[sigla] [varchar](10) NOT NULL,
	[descricao] [varchar](90) NOT NULL,
	[capialSocial] [decimal](18, 0) NOT NULL,
	[NIF] [int] NOT NULL,
	[telefone] [int] NOT NULL,
	[endEletronico] [varchar](256) NOT NULL,
	[ano] [int] NOT NULL,
	[CAE] [int] NOT NULL,
	[Cod_endereco] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[Expedicao]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Expedicao](
	[nExpedicao] [int] NOT NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nExpedicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[FUNCIONARIOS_EM_LOJAS]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[FUNCIONARIOS_EM_LOJAS](
	[Cod_loja] [int] NOT NULL,
	[Cod_funcionario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_loja] ASC,
	[Cod_funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[LISTA_PRECOS]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[LISTA_PRECOS](
	[Cod_lista_precos] [int] NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
	[Cod_empresa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_lista_precos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[Login]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[Login](
	[Cod_func] [int] NOT NULL,
	[Palavra_passe] [binary](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_func] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[LOJA]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[LOJA](
	[Cod_loja] [int] IDENTITY(1,1) NOT NULL,
	[Nome_loja] [varchar](20) NOT NULL,
	[E_mail] [varchar](256) NOT NULL,
	[Telefone] [varchar](9) NOT NULL,
	[Cod_endereco] [int] NULL,
	[Cod_empresa] [int] NULL,
	[ativa] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_loja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[PAGAMENTO]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[PAGAMENTO](
	[Cod_Pagamento] [int] NOT NULL,
	[Descricao] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[PRECO_ARTIGO]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[PRECO_ARTIGO](
	[Cod_artigo] [int] NOT NULL,
	[Cod_lista_precos] [int] NOT NULL,
	[Preco] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_lista_precos] ASC,
	[Cod_artigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[PROFISSAO]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[PROFISSAO](
	[Cod_Profissao] [int] NOT NULL,
	[Descricao] [varchar](60) NULL,
	[Cod_pertence] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Profissao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[PROFISSAO_PERTENCE]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[PROFISSAO_PERTENCE](
	[Cod] [int] NOT NULL,
	[Descricao] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[RELACAO_TER_EMP]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[RELACAO_TER_EMP](
	[Cod_natureza] [int] NOT NULL,
	[Descricao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_natureza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[SITUACAO]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[SITUACAO](
	[Cod_Situacao] [int] NOT NULL,
	[Descricao] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Situacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[TERCEIRO]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[TERCEIRO](
	[Cod_terceiro] [int] NOT NULL,
	[Cod_empresa] [int] NULL,
	[Nome_terceiro] [varchar](40) NULL,
	[CAE] [int] NULL,
	[Data_c_registo] [date] NULL,
	[Cod_relacao_ter_emp] [int] NULL,
	[Telefone] [varchar](9) NOT NULL,
	[NIF] [varchar](9) NULL,
	[Cod_morada] [int] NULL,
	[E_mail] [varchar](256) NOT NULL,
	[Cod_lista_precos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_terceiro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[TipoDocumento]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[TipoDocumento](
	[nTipoDoc] [int] NOT NULL,
	[empresa] [int] NOT NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empresa] ASC,
	[nTipoDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[TipoIVA]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[TipoIVA](
	[nIVA] [int] NOT NULL,
	[percentagem] [int] NOT NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nIVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClubeVideo].[TipoStock]    Script Date: 11/06/2020 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClubeVideo].[TipoStock](
	[nStock] [int] NOT NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (1, N'Cães de Aluguel', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 46, 44, 2, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (2, N'Up – Altas Aventuras', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 19, 17, 2, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (3, N'Senhor dos Anéis: O Retorno do Rei', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 13, 13, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (4, N'Seven – Os Sete Crimes Capitais', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 16, 16, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (5, N'Amadeus', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 16, 16, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (6, N'Wall-E', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 16, 16, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (7, N'Um Corpo que Cai', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 16, 16, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (8, N'Gladiador', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 16, 16, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (9, N'Amor, Sublime Amor', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 16, 16, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (10, N'O Fabuloso Destino de Amélie Poulain', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 21, 21, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (11, N'Thelma & Louise', 1000, 7000, 15.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 1, 10, 10, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (12, N'Desconto em compra de produto alugado', NULL, NULL, 5.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 4, 2, 20, 20, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (13, N'Caução', NULL, NULL, 5.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 4, 2, 5, 5, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (14, N'Entrega ao domicílio', NULL, NULL, 5.0000, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, 3, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (15, N'Transformers', 1000, 7000, 17.7600, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (16, N'Romeo and Juliet', 1000, 7000, 16.5100, CAST(N'2020-03-16' AS Date), CAST(N'2020-03-16' AS Date), 1, 1, 2, 2, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (17, N'The Wolf Of Wallstreet', 1000, 7000, 16.3300, CAST(N'2020-03-28' AS Date), CAST(N'2020-03-28' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (18, N'Alien	19.6582657558183', 1000, 7000, 15.0000, CAST(N'2020-03-28' AS Date), CAST(N'2020-03-28' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (19, N'Shutter Island	18.8085108882787', 1000, 7000, 15.0000, CAST(N'2020-05-05' AS Date), CAST(N'2020-05-05' AS Date), 1, 1, 5, 5, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (20, N'Fantastic Beasts and Where To Find Them', 1000, 7000, 13.6200, CAST(N'2020-02-29' AS Date), CAST(N'2020-02-29' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (21, N'Titanic', 1000, 7000, 10.5600, CAST(N'2020-02-03' AS Date), CAST(N'2020-02-03' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (22, N'Ice Age 2', 1000, 7000, 10.0300, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (23, N'Brimstone', 1000, 7000, 18.0900, CAST(N'2020-02-18' AS Date), CAST(N'2020-02-18' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (24, N'Rambo II', 1000, 7000, 15.6500, CAST(N'2020-04-09' AS Date), CAST(N'2020-04-09' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (25, N'The Martian', 1000, 7000, 18.4700, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (26, N'Rambo |', 1000, 7000, 1.0000, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (27, N'Limitless', 1000, 7000, 15.7300, CAST(N'2020-01-02' AS Date), CAST(N'2020-01-02' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (28, N'Snatch', 1000, 7000, 19.4600, CAST(N'2020-02-16' AS Date), CAST(N'2020-02-16' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (29, N'Thor : Ragnarok', 1000, 7000, 19.8700, CAST(N'2020-05-20' AS Date), CAST(N'2020-05-20' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (30, N'American Pie', 1000, 7000, 12.4000, CAST(N'2020-02-23' AS Date), CAST(N'2020-02-23' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (31, N'Avatar', 1000, 7000, 10.1400, CAST(N'2020-03-04' AS Date), CAST(N'2020-03-04' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (32, N'Seven', 1000, 7000, 15.6100, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (33, N'Terminator I', 1000, 7000, 12.1900, CAST(N'2020-02-13' AS Date), CAST(N'2020-02-13' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (34, N'Shutter Island', 1000, 7000, 14.4500, CAST(N'2020-01-30' AS Date), CAST(N'2020-01-30' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (35, N'Octav', 1000, 7000, 16.9100, CAST(N'2020-01-23' AS Date), CAST(N'2020-01-23' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (36, N'Terminator 2', 1000, 7000, 15.3100, CAST(N'2020-03-09' AS Date), CAST(N'2020-03-09' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (37, N'Ice Age 1', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (38, N'Crepúsculo dos Deuses', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (39, N'Batman: O Cavaleiro das Trevas', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (40, N'Brilho Eterno de uma Mente sem Lembranças', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (41, N'Taxi Driver', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (42, N'Butch Cassidy', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (43, N'Gênio Indomável', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (44, N'A Malvada', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (45, N'O Grande Lebowski', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (46, N'Jurassic Park', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (47, N'Janela Indiscreta', 1000, 7000, 11.2700, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (48, N'The Godfather', 1000, 7000, 10.5300, CAST(N'2020-04-29' AS Date), CAST(N'2020-04-29' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (49, N'Shrek', 1000, 7000, 11.0300, CAST(N'2020-05-13' AS Date), CAST(N'2020-05-13' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (50, N'The Conjuring', 1000, 7000, 12.8400, CAST(N'2020-04-03' AS Date), CAST(N'2020-04-03' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (51, N'Allied', 1000, 7000, 11.1400, CAST(N'2020-02-06' AS Date), CAST(N'2020-02-06' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (52, N'Chronicles of Narnia', 1000, 7000, 10.1700, CAST(N'2020-03-10' AS Date), CAST(N'2020-03-10' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (53, N'The Notebook', 1000, 7000, 18.6600, CAST(N'2020-02-06' AS Date), CAST(N'2020-02-06' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (54, N'Zootropolis', 1000, 7000, 12.4000, CAST(N'2020-05-03' AS Date), CAST(N'2020-05-03' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (55, N'Friends With Kids', 1000, 7000, 5.7200, CAST(N'2020-01-30' AS Date), CAST(N'2020-01-30' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (56, N'Star Wars', 1000, 7000, 1.0000, CAST(N'2020-01-23' AS Date), CAST(N'2020-01-23' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (57, N'Love', 1000, 7000, 1.0000, CAST(N'2020-05-23' AS Date), CAST(N'2020-05-23' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (58, N'Interstellar', 1000, 7000, 12.6800, CAST(N'2020-03-26' AS Date), CAST(N'2020-03-26' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (59, N'The Ring', 1000, 7000, 13.3900, CAST(N'2020-03-22' AS Date), CAST(N'2020-03-22' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Artigo] ([nArtigo], [nome], [stockMin], [stockMax], [precoStock], [dataCriacao], [dataUltAlt], [IVA], [stock], [quantStock], [quantDispLojas], [quantAlugLojas], [estado]) VALUES (60, N'Avengers Infinity War', 1000, 6000, 1.0000, CAST(N'2020-01-31' AS Date), CAST(N'2020-01-31' AS Date), 1, 1, 0, 0, 0, 1)
INSERT [ClubeVideo].[Disponibilidade] ([nDisponibilidade], [descricao]) VALUES (1, N'disponível')
INSERT [ClubeVideo].[Disponibilidade] ([nDisponibilidade], [descricao]) VALUES (2, N'indisponível devido a compra')
INSERT [ClubeVideo].[Disponibilidade] ([nDisponibilidade], [descricao]) VALUES (3, N'indisponível devido a aluguer')
SET IDENTITY_INSERT [ClubeVideo].[Documento] ON 

INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (54, 1, 1, 33, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 1, 1, 600.0000, 738.0000, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (55, 1, 1, 33, 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 1, 1, 600.0000, 738.0000, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (56, 1, 1, 33, 3, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 1, 1, 600.0000, 738.0000, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (57, 1, 1, 33, 4, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 1, 1, 600.0000, 738.0000, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (63, 1, 1, 33, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 1, 1, 1, 28.5000, 35.0550, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (64, 1, 1, 41, 1, CAST(N'2020-06-01' AS Date), CAST(N'2020-06-06' AS Date), 0, CAST(N'2020-06-30' AS Date), 3, 200, 200, 14.2500, 17.5275, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (65, 1, 1, 35, 1, CAST(N'2020-06-01' AS Date), CAST(N'2020-06-10' AS Date), 0, CAST(N'2020-06-30' AS Date), 1, 200, 200, 71.2500, 87.6375, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (66, 1, 1, 41, 4, CAST(N'2020-06-01' AS Date), CAST(N'2020-06-06' AS Date), 0, CAST(N'2020-06-30' AS Date), 1, 200, 200, 237.5000, 270.2750, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (67, 1, 1, 41, 4, CAST(N'2020-06-02' AS Date), CAST(N'2020-06-05' AS Date), 0, CAST(N'2020-06-30' AS Date), 1, 200, 200, 56.1096, 63.5523, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (68, 1, 1, 39, 4, CAST(N'2020-06-01' AS Date), CAST(N'2020-06-07' AS Date), 0, CAST(N'2020-06-30' AS Date), 1, 202, 202, 72.7500, 89.4825, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (60, 2, 1, 1, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 1, 1, 13.5000, 16.6050, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (62, 2, 1, 1, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 1, 1, 45.0000, 55.3500, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (71, 2, 1, 8, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 1, 1, 1, 40.5000, 49.8150, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (72, 2, 1, 3, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 1, 1, 1, NULL, NULL, 0)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (74, 2, 1, 4, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 1, 1, 1, 42.7500, 52.5825, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (73, 4, 1, 4, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 1, 1, 28.5000, 35.0550, 1)
INSERT [ClubeVideo].[Documento] ([nDocumento], [tipoDoc], [empresa], [terceiro], [loja], [dataEmissao], [dataEntrega], [nVendedor], [dataVencimento], [fExpedicao], [endEntrega], [endFaturacao], [valorTotal], [valorTotalIVA], [estado]) VALUES (75, 4, 1, 4, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date), 0, CAST(N'2020-01-30' AS Date), 3, 2, 2, 27.0000, 33.2100, 1)
SET IDENTITY_INSERT [ClubeVideo].[Documento] OFF
INSERT [ClubeVideo].[Empresa] ([nEmpresa], [sigla], [descricao], [capialSocial], [NIF], [telefone], [endEletronico], [ano], [CAE], [Cod_endereco]) VALUES (1, N'CV', N'Clube de Video', CAST(100000 AS Decimal(18, 0)), 999999999, 999999999, N'clubevideo@mail.com', 2020, 77220, 1)
INSERT [ClubeVideo].[Empresa] ([nEmpresa], [sigla], [descricao], [capialSocial], [NIF], [telefone], [endEletronico], [ano], [CAE], [Cod_endereco]) VALUES (2, N'Cvv2', N'O update da CV', CAST(1000000 AS Decimal(18, 0)), 888888888, 888888888, N'cvv@gmail.com', 2020, 4444, 2)
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (1, N'Rua 31º de Maio', N'3810-032', N'Santa Joana', N'Aveiro', N'Aveiro', N'Santa Joana', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (2, N'rua 0', N'9521-089', N'Laranjeira', N'Castelo Branco', N'Covilha', N'Peraboa', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (3, N'rua 1', N'8416-086', N'Guardais', N'Evora', N'Montemor-o-Novo', N'Santiago do Escoural', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (4, N'rua 2', N'7911-590', N'Cruzeiro', N'Braga', N'Vila Verde', N'Vila Verde e Barbudo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (5, N'rua 3', N'7662-449', N'Bertelo', N'Guarda', N'Guarda', N'Aldeia Vicosa', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (6, N'rua 4', N'2670-086', N'Castelo de Baixo', N'Guarda', N'Aguiar da Beira', N'Pena Verde', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (7, N'rua 5', N'3792-227', N'Vila Cova', N'Portalegre', N'Elvas', N'Assuncao, Ajuda, Salvador e Santo Ildefonso', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (8, N'rua 6', N'4562-425', N'Carvalhal da Portela', N'Braganca', N'Vinhais', N'Agrochao', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (9, N'rua 7', N'6676-144', N'Ribeiro da Povoa', N'Lisboa', N'Lourinha', N'Reguengo Grande', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (10, N'rua 8', N'7120-923', N'Sibanas', N'Braga', N'Braga', N'Tadim', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (11, N'rua 9', N'1353-270', N'Busturenga', N'Setubal', N'Santiago do Cacem', N'Ermidas-Sado', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (12, N'rua 10', N'7930-155', N'Foz do Rio Mau', N'Viana do Castelo', N'Ponte de Lima', N'Associacao de freguesias do Vale do Neiva', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (13, N'rua 11', N'2586-225', N'Solada', N'Braga', N'Vila Nova de Famalicao', N'Uniao das freguesias de Arnoso (Santa Maria e Santa Eulalia) e Sezures', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (14, N'rua 12', N'9385-284', N'Outeiro', N'Faro', N'Silves', N'Armacao de Pera', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (15, N'rua 13', N'8290-817', N'Souto Chao', N'Beja', N'Vidigueira', N'Pedrogao', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (16, N'rua 14', N'6618-844', N'Cavadas de Baixo', N'Braganca', N'Alfandega da Fe', N'Cerejais', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (17, N'rua 15', N'3785-003', N'Canelas de Baixo', N'Viana do Castelo', N'Ponte de Lima', N'Fornelos e Queijada', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (18, N'rua 16', N'9966-036', N'Lanhezes', N'Viseu', N'Sernancelhe', N'Chosendo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (19, N'rua 17', N'9066-096', N'Malaposta', N'Braga', N'Amares', N'Bouro (Santa Maria)', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (20, N'rua 18', N'2608-651', N'Raivo', N'Viseu', N'Tarouca', N'Varzea da Serra', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (21, N'rua 19', N'8212-906', N'Outeirinho', N'Viseu', N'Moimenta da Beira', N'Moimenta da Beira', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (22, N'rua 20', N'0144-438', N'Aguada de Cima', N'Porto', N'Gondomar', N'Uniao das freguesias de Melres e Medas', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (23, N'rua 21', N'5210-396', N'Vila Verde', N'Castelo Branco', N'Fundao', N'Soalheira', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (24, N'rua 22', N'0633-102', N'Santa Maria de Sardoura', N'Viseu', N'Penalva do Castelo', N'Pindo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (25, N'rua 23', N'9918-795', N'Canavai', N'Evora', N'Estremoz', N'Veiros', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (26, N'rua 24', N'0128-007', N'Zona Industrial da Giesteira', N'Viseu', N'Cinfaes', N'Tarouquela', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (27, N'rua 25', N'3372-823', N'Crasto Sao Jorge', N'Castelo Branco', N'Oleiros', N'Sobral', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (28, N'rua 26', N'6818-330', N'Varzeas', N'Viana do Castelo', N'Ponte de Lima', N'Associacao de freguesias do Vale do Neiva', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (29, N'rua 27', N'7153-553', N'Inha', N'Viseu', N'Lamego', N'Uniao das freguesias de Parada do Bispo e Valdigem', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (30, N'rua 28', N'1696-718', N'Covelo de Paivo', N'Leiria', N'Leiria', N'Uniao das freguesias de Colmeias e Memoria', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (31, N'rua 29', N'4824-529', N'Vinha', N'Porto', N'Paredes', N'Louredo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (32, N'rua 30', N'7993-321', N'Nogueira do Rio', N'Viseu', N'Tabuaco', N'Desejosa', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (33, N'rua 31', N'0913-972', N'Ponte da Ribeira', N'Portalegre', N'Monforte', N'Monforte', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (34, N'rua 32', N'2408-625', N'Recardaes', N'Evora', N'Evora', N'Uniao das freguesias de Sao Sebastiao da Giesteira e Nossa Senhora da Boa Fe', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (35, N'rua 33', N'4079-676', N'Santa Maria do Monte', N'Faro', N'Aljezur', N'Odeceixe', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (36, N'rua 34', N'5459-886', N'Pego', N'Evora', N'Arraiolos', N'Uniao das freguesias de Gafanhoeira (Sao Pedro) e Sabugueiro', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (37, N'rua 35', N'4769-736', N'Avelas de Cima', N'Aveiro', N'Murtosa', N'Monte', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (38, N'rua 36', N'3412-710', N'Vale Agudia', N'Braga', N'Celorico de Basto', N'Agilde', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (39, N'rua 37', N'5025-256', N'Milhaco', N'Porto', N'Baiao', N'Santa Marinha do Zezere', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (40, N'rua 38', N'6799-014', N'Povoa do Teso', N'Beja', N'Beja', N'Uniao das freguesias de Beja (Salvador e Santa Maria da Feira)', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (41, N'rua 39', N'4757-826', N'Acores', N'Lisboa', N'Torres Vedras', N'Ventosa', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (42, N'rua 40', N'2908-829', N'Crosso', N'Castelo Branco', N'Castelo Branco', N'Lardosa', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (43, N'rua 41', N'9703-539', N'Povoa do Pereiro', N'Braganca', N'Vimioso', N'Vilar Seco', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (44, N'rua 42', N'8785-722', N'Coto Cavadinha', N'Coimbra', N'Montemor-o-Velho', N'Liceia', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (45, N'rua 43', N'8423-442', N'Vila Nova dos Fusos', N'Braganca', N'Mirandela', N'Uniao das freguesias de Freixeda e Vila Verde', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (46, N'rua 44', N'0686-314', N'Miragaia', N'Faro', N'Silves', N'Sao Marcos da Serra', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (47, N'rua 45', N'3137-355', N'Tojal', N'Viana do Castelo', N'Ponte de Lima', N'Correlha', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (48, N'rua 46', N'9823-120', N'Avelas de Caminho', N'Vila Real', N'Chaves', N'Uniao das freguesias das Eiras, Sao Juliao de Montenegro e Cela', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (49, N'rua 47', N'9877-507', N'Santa Iria', N'Vila Real', N'Chaves', N'Bustelo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (50, N'rua 48', N'1996-212', N'Tamengos', N'Porto', N'Maia', N'Sao Pedro Fins', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (51, N'rua 49', N'3082-437', N'Pego', N'Evora', N'Evora', N'Uniao das freguesias de Bacelo e Senhora da Saude', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (52, N'rua 50', N'8387-833', N'Covelas', N'Viana do Castelo', N'Paredes de Coura', N'Agualonga', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (53, N'rua 51', N'7780-975', N'Lousa', N'Evora', N'Portel', N'Monte do Trigo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (54, N'rua 52', N'2495-533', N'Picoto', N'Braga', N'Fafe', N'Travassos', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (55, N'rua 53', N'8152-589', N'Serra de Baixo', N'Porto', N'Santo Tirso', N'Uniao das freguesias de Lamelas e Guimarei', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (56, N'rua 54', N'7721-443', N'Trancoso', N'Vila Real', N'Sabrosa', N'Sao Lourenco de Ribapinhao', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (57, N'rua 55', N'7349-523', N'Valmaior', N'Coimbra', N'Condeixa-a-Nova', N'Furadouro', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (58, N'rua 56', N'3623-372', N'Garrido', N'Viseu', N'Moimenta da Beira', N'Castelo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (59, N'rua 57', N'7998-171', N'Talhada', N'Santarem', N'Constancia', N'Constancia', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (60, N'rua 58', N'6272-705', N'Moimenta de Baixo', N'Aveiro', N'Santa Maria da Feira', N'Sanguedo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (61, N'rua 59', N'9205-547', N'Pimenta', N'Vila Real', N'Vila Real', N'Folhadela', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (62, N'rua 60', N'5868-021', N'Verba', N'Vila Real', N'Montalegre', N'Uniao das freguesias de Paradela, Contim e Fiaes', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (64, N'rua 62', N'2858-064', N'Pinhal', N'Braganca', N'Vimioso', N'Uniao das freguesias de Algoso, Campo de Viboras e Uva', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (65, N'rua 63', N'4401-376', N'Cha da Nogueira', N'Portalegre', N'Portalegre', N'Alagoa', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (66, N'rua 64', N'9257-379', N'Pirineus', N'Vila Real', N'Ribeira de Pena', N'Uniao das freguesias de Cerva e Limoes', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (67, N'rua 65', N'8555-308', N'Bugiganga', N'Castelo Branco', N'Covilha', N'Paul', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (68, N'rua 66', N'0158-914', N'Abrunhal', N'Santarem', N'Santarem', N'Uniao das freguesias de Santarem (Marvila), Santa Iria da Ribeira de Santarem, Santarem (Sao Salvador) e Santarem (Sao Nicolau)', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (69, N'rua 67', N'0175-858', N'Cancelinhas', N'Viseu', N'Cinfaes', N'Moimenta', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (70, N'rua 68', N'8516-537', N'Adroia', N'Castelo Branco', N'Fundao', N'Alcaide', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (71, N'rua 69', N'6709-251', N'Cabril', N'Porto', N'Amarante', N'Gouveia (Sao Simao)', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (72, N'rua 70', N'8112-537', N'Feiteira', N'Vila Real', N'Chaves', N'Bustelo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (73, N'rua 71', N'9750-439', N'Devesa', N'Braganca', N'Macedo de Cavaleiros', N'Lamas', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (74, N'rua 72', N'7994-408', N'Trancoso', N'Vila Real', N'Alijo', N'Vila Verde', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (75, N'rua 73', N'2902-260', N'Cabeco da Igreja', N'Viseu', N'Cinfaes', N'Ferreiros de Tendais', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (76, N'rua 74', N'9349-738', N'Sobreiro Torto', N'Viana do Castelo', N'Valenca', N'Uniao das freguesias de Valenca, Cristelo Covo e Arao', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (77, N'rua 75', N'4784-805', N'Avitureira', N'Guarda', N'Aguiar da Beira', N'Pena Verde', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (78, N'rua 76', N'7154-354', N'Soalheira', N'Setubal', N'Sesimbra', N'Quinta do Conde', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (79, N'rua 77', N'8266-550', N'Vale do Conde', N'Guarda', N'Vila Nova de Foz Coa', N'Cedovim', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (80, N'rua 78', N'0230-987', N'Casaldima', N'Lisboa', N'Mafra', N'Santo Isidoro', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (81, N'rua 79', N'7895-829', N'Lugar da Vinha', N'Porto', N'Amarante', N'Uniao das freguesias de Aboadela, Sanche e Varzea', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (82, N'rua 80', N'3603-751', N'Acores', N'Braga', N'Vila Nova de Famalicao', N'Uniao das freguesias de Antas e Abade de Vermoim', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (83, N'rua 81', N'1268-394', N'Espinheiros', N'Porto', N'Paredes', N'Vilela', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (85, N'rua 83', N'0606-430', N'Cruzeiro', N'Evora', N'Montemor-o-Novo', N'Cabrela', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (86, N'rua 84', N'8559-223', N'Soutelo', N'Leiria', N'Leiria', N'Uniao das freguesias de Colmeias e Memoria', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (87, N'rua 85', N'2412-014', N'Modernos', N'Castelo Branco', N'Idanha-a-Nova', N'Touloes', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (88, N'rua 86', N'1488-778', N'Oronhe', N'Portalegre', N'Nisa', N'Uniao das freguesias de Espirito Santo, Nossa Senhora da Graca e Sao Simao', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (89, N'rua 87', N'9512-890', N'Sao Joao da Azenha', N'Leiria', N'Pombal', N'Meirinhas', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (91, N'rua 89', N'6507-156', N'Londral', N'Viana do Castelo', N'Melgaco', N'Gave', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (93, N'rua 91', N'4014-522', N'Zona Industrial da Farrapa', N'Viana do Castelo', N'Paredes de Coura', N'Uniao das freguesias de Insalde e Porreiras', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (94, N'rua 92', N'7500-609', N'Fonte', N'Coimbra', N'Oliveira do Hospital', N'Lourosa', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (95, N'rua 93', N'3620-392', N'Fonte', N'Viana do Castelo', N'Viana do Castelo', N'Uniao das freguesias de Geraz do Lima (Santa Maria, Santa Leocadia e Moreira) e Deao', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (96, N'rua 94', N'5732-162', N'Trelopenedo', N'Viseu', N'Penedono', N'Beselga', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (97, N'rua 95', N'0583-390', N'Bouca', N'Viana do Castelo', N'Ponte de Lima', N'Beiral do Lima', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (98, N'rua 96', N'4516-583', N'Abrunhal', N'Santarem', N'Coruche', N'Biscainho', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (99, N'rua 97', N'0343-105', N'Cabacos', N'Guarda', N'Vila Nova de Foz Coa', N'Custoias', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (100, N'rua 98', N'5367-402', N'Gato', N'Leiria', N'Leiria', N'Regueira de Pontes', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (101, N'rua 99', N'7161-978', N'Serrado do Burgo', N'Portalegre', N'Nisa', N'Uniao das freguesias de Arez e Amieira do Tejo', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (200, N'Rua de cima', N'4444-444', N'Maca', N'Braga', N'Corroios', N'Coiso', N'Portugal')
INSERT [ClubeVideo].[Endereco] ([nEndereco], [morada], [codigoPostal], [localidade], [distrito], [concelho], [freguesia], [pais]) VALUES (202, N'Rua da travessa', N'4444-444', N'Pereira', N'Braga', N'Maçã', N'Nespereira', N'Portugal')
INSERT [ClubeVideo].[Expedicao] ([nExpedicao], [descricao]) VALUES (1, N'Ao balcão')
INSERT [ClubeVideo].[Expedicao] ([nExpedicao], [descricao]) VALUES (2, N'Por entrega ao cliente')
INSERT [ClubeVideo].[Expedicao] ([nExpedicao], [descricao]) VALUES (3, N'Através de transportadora')
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (0, N'Swayam Carneiro', CAST(N'2015-07-23' AS Date), N'Portuguesa', N'M', N'divorciado', N'961136791', N'SwayamCarneiro1026@gmail.com', 4243.0000, CAST(N'2020-04-25' AS Date), 1, 1, 42290, 1, N'674033598', N'PT5000210090864646921', N'69648488 s 581', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (1, N'Brienny Mendes', CAST(N'2008-04-15' AS Date), N'Portuguesa', N'F', N'viúvo', N'934953691', N'BriennyMendes1822@gmail.com', 2452.0000, CAST(N'2020-04-25' AS Date), 3, 5, 12212, 1, N'809093738', N'PT5000820391792034943', N'86551892 s 320', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (2, N'Jamira Almeida', CAST(N'2008-04-05' AS Date), N'Portuguesa', N'F', N'divorciado', N'938499546', N'JamiraAlmeida570@gmail.com', 3606.0000, CAST(N'2020-04-25' AS Date), 4, 2, 52220, 1, N'896627010', N'PT5000587646878288247', N'96040943 s 287', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (3, N'Adália Fonseca', CAST(N'1983-09-26' AS Date), N'Portuguesa', N'F', N'divorciado', N'915839568', N'AdáliaFonseca1469@gmail.com', 3891.0000, CAST(N'2020-04-25' AS Date), 5, 4, 33412, 0, N'038529571', N'PT5000480943685693435', N'99355386 s 888', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (4, N'Marc Fernandes', CAST(N'2018-06-23' AS Date), N'Portuguesa', N'M', N'divorciado', N'933765870', N'MarcFernandes388@gmail.com', 3784.0000, CAST(N'2020-04-25' AS Date), 6, 5, 12212, 2, N'615875487', N'PT5000160841247273905', N'77887832 s 635', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (5, N'Caetano Lopes', CAST(N'2014-08-05' AS Date), N'Portuguesa', N'M', N'viúvo', N'914444832', N'CaetanoLopes469@gmail.com', 3657.0000, CAST(N'2020-04-25' AS Date), 7, 0, 33412, 0, N'307440993', N'PT5000262886241813443', N'83007722 s 469', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (6, N'Wally Valente', CAST(N'1953-05-12' AS Date), N'Portuguesa', N'M', N'casado', N'964934924', N'WallyValente1494@gmail.com', 2887.0000, CAST(N'2020-04-25' AS Date), 8, 3, 12120, 1, N'701195410', N'PT5000700451641843867', N'95586213 s 971', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (7, N'Liyo Vicente', CAST(N'1962-05-27' AS Date), N'Portuguesa', N'M', N'separado', N'961819673', N'LiyoVicente1807@gmail.com', 2897.0000, CAST(N'2020-04-25' AS Date), 9, 1, 51510, 0, N'400190376', N'PT5000299892361448549', N'84108318 s 372', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (8, N'Serena Nogueira', CAST(N'2017-03-03' AS Date), N'Portuguesa', N'F', N'separado', N'913529810', N'SerenaNogueira1083@gmail.com', 4614.0000, CAST(N'2020-04-25' AS Date), 10, 0, 52220, 1, N'609446258', N'PT5000619135935365719', N'91470780 s 861', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (9, N'Manassés Miranda', CAST(N'1995-07-07' AS Date), N'Portuguesa', N'M', N'separado', N'935671494', N'ManassésMiranda571@gmail.com', 3202.0000, CAST(N'2020-04-25' AS Date), 11, 3, 43212, 0, N'934635542', N'PT5000406480562186427', N'56328950 s 272', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (10, N'Eléonor Pacheco', CAST(N'1952-10-01' AS Date), N'Portuguesa', N'F', N'casado', N'915218578', N'EléonorPacheco467@gmail.com', 3061.0000, CAST(N'2020-04-25' AS Date), 12, 5, 42290, 0, N'247967186', N'PT5000503422856621989', N'75299838 s 999', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (11, N'Haley Borges', CAST(N'2014-04-08' AS Date), N'Portuguesa', N'M', N'viúvo', N'932416463', N'HaleyBorges1843@gmail.com', 2385.0000, CAST(N'2020-04-25' AS Date), 13, 0, 42290, 1, N'872214389', N'PT5000826780905435358', N'71278856 s 755', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (12, N'Teodor Vaz', CAST(N'1995-03-03' AS Date), N'Portuguesa', N'M', N'casado', N'939460407', N'TeodorVaz349@gmail.com', 4804.0000, CAST(N'2020-04-25' AS Date), 14, 2, 12211, 0, N'750194224', N'PT5000497341347672656', N'86264997 s 435', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (13, N'Ayoub Simões', CAST(N'2020-02-20' AS Date), N'Portuguesa', N'M', N'solteiro', N'916931781', N'AyoubSimões1752@gmail.com', 4357.0000, CAST(N'2020-04-25' AS Date), 15, 1, 52210, 2, N'939580720', N'PT5000304772591296862', N'95273252 s 540', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (14, N'Victoria Lima', CAST(N'2014-06-26' AS Date), N'Portuguesa', N'F', N'separado', N'961590222', N'VictoriaLima1860@gmail.com', 924.0000, CAST(N'2020-04-25' AS Date), 16, 0, 12120, 1, N'470050500', N'PT5000021692273242891', N'80653644 s 833', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (15, N'Nikita Sousa', CAST(N'2000-02-18' AS Date), N'Portuguesa', N'M', N'divorciado', N'965155513', N'NikitaSousa1996@gmail.com', 3449.0000, CAST(N'2020-04-25' AS Date), 17, 5, 12212, 0, N'237854650', N'PT5000591422857110481', N'92120795 s 453', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (16, N'Vanda Batista', CAST(N'1987-02-22' AS Date), N'Portuguesa', N'F', N'separado', N'937960611', N'VandaBatista1377@gmail.com', 928.0000, CAST(N'2020-04-25' AS Date), 18, 2, 51510, 1, N'686165717', N'PT5000283854991928000', N'95045604 s 269', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (17, N'Jasmeet Barbosa', CAST(N'2015-10-07' AS Date), N'Portuguesa', N'M', N'solteiro', N'965094946', N'JasmeetBarbosa616@gmail.com', 1468.0000, CAST(N'2020-04-25' AS Date), 19, 2, 12212, 1, N'937345027', N'PT5000100677781995869', N'98907391 s 186', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (18, N'Yazmin Rodrigues', CAST(N'1985-03-04' AS Date), N'Portuguesa', N'F', N'solteiro', N'961411538', N'YazminRodrigues1791@gmail.com', 2628.0000, CAST(N'2020-04-25' AS Date), 20, 1, 33412, 0, N'834218569', N'PT5000780429148260837', N'67867399 s 929', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (19, N'Daniil Fonseca', CAST(N'1980-07-26' AS Date), N'Portuguesa', N'M', N'solteiro', N'968379715', N'DaniilFonseca521@gmail.com', 4616.0000, CAST(N'2020-04-25' AS Date), 21, 3, 52220, 0, N'850823807', N'PT5000068784353817151', N'71788444 s 412', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (20, N'Tim Ramos', CAST(N'1998-08-01' AS Date), N'Portuguesa', N'M', N'divorciado', N'964511538', N'TimRamos1415@gmail.com', 2022.0000, CAST(N'2020-04-25' AS Date), 22, 0, 12110, 2, N'695730496', N'PT5000220765072744501', N'52709049 s 594', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (21, N'Aissato Martins', CAST(N'1983-03-28' AS Date), N'Portuguesa', N'F', N'separado', N'933097573', N'AissatoMartins983@gmail.com', 2094.0000, CAST(N'2020-04-25' AS Date), 23, 5, 12212, 1, N'550822355', N'PT5000639083364317295', N'74224057 s 057', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (22, N'Ianira Antunes', CAST(N'1980-07-06' AS Date), N'Portuguesa', N'F', N'casado', N'919994214', N'IaniraAntunes326@gmail.com', 1254.0000, CAST(N'2020-04-25' AS Date), 24, 5, 12221, 2, N'237993796', N'PT5000149871261545147', N'76470914 s 948', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (23, N'Álison Guerreiro', CAST(N'1982-01-22' AS Date), N'Portuguesa', N'F', N'separado', N'911525026', N'ÁlisonGuerreiro1603@gmail.com', 4988.0000, CAST(N'2020-04-25' AS Date), 25, 1, 12120, 0, N'595665304', N'PT5000843939822139342', N'63405080 s 272', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (24, N'Rubens Martins', CAST(N'1959-11-12' AS Date), N'Portuguesa', N'M', N'solteiro', N'937337311', N'RubensMartins72@gmail.com', 1722.0000, CAST(N'2020-04-25' AS Date), 26, 3, 12211, 1, N'803970198', N'PT5000338614800274408', N'52681855 s 286', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (25, N'Zakaria Reis', CAST(N'1965-05-10' AS Date), N'Portuguesa', N'M', N'viúvo', N'962158197', N'ZakariaReis417@gmail.com', 1055.0000, CAST(N'2020-04-25' AS Date), 27, 5, 41100, 0, N'783058856', N'PT5000663937989712698', N'64424792 s 019', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (26, N'Issa Correia', CAST(N'1980-10-03' AS Date), N'Portuguesa', N'M', N'casado', N'935549387', N'IssaCorreia396@gmail.com', 1631.0000, CAST(N'2020-04-25' AS Date), 28, 0, 12211, 2, N'891309748', N'PT5000782504547259481', N'50649829 s 837', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (27, N'Rand Tavares', CAST(N'1950-12-01' AS Date), N'Portuguesa', N'F', N'divorciado', N'966402192', N'RandTavares1617@gmail.com', 2374.0000, CAST(N'2020-04-25' AS Date), 29, 2, 41100, 0, N'340640932', N'PT5000204860304237801', N'97272971 s 356', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (28, N'Jade Pinho', CAST(N'1975-04-28' AS Date), N'Portuguesa', N'F', N'viúvo', N'936314793', N'JadePinho430@gmail.com', 3491.0000, CAST(N'2020-04-25' AS Date), 30, 5, 12211, 0, N'901510553', N'PT5000458260707703984', N'88751005 s 215', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (29, N'Adenilson Neto', CAST(N'1983-07-17' AS Date), N'Portuguesa', N'M', N'separado', N'964710235', N'AdenilsonNeto898@gmail.com', 4150.0000, CAST(N'2020-04-25' AS Date), 31, 0, 12120, 1, N'661620572', N'PT5000711506547025550', N'96852968 s 081', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (30, N'Sofía Ramos', CAST(N'2008-09-13' AS Date), N'Portuguesa', N'F', N'separado', N'919726669', N'SofíaRamos1077@gmail.com', 1909.0000, CAST(N'2020-04-25' AS Date), 32, 1, 41100, 0, N'936818808', N'PT5000698302408522916', N'60818962 s 705', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (31, N'Sulamita Sousa', CAST(N'2007-10-20' AS Date), N'Portuguesa', N'F', N'solteiro', N'969040017', N'SulamitaSousa963@gmail.com', 4642.0000, CAST(N'2020-04-25' AS Date), 33, 0, 43212, 2, N'169167736', N'PT5000020618878800908', N'88848859 s 989', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (32, N'Zidane Garcia', CAST(N'1983-10-02' AS Date), N'Portuguesa', N'M', N'solteiro', N'911011683', N'ZidaneGarcia63@gmail.com', 3503.0000, CAST(N'2020-04-25' AS Date), 34, 3, 11200, 1, N'200009163', N'PT5000627749985823718', N'66364114 s 070', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (33, N'Esperanza Amorim', CAST(N'1955-12-12' AS Date), N'Portuguesa', N'F', N'casado', N'960611770', N'EsperanzaAmorim1624@gmail.com', 3969.0000, CAST(N'2020-04-25' AS Date), 35, 0, 33411, 1, N'601103944', N'PT5000208275137767908', N'69700066 s 971', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (34, N'Melina Nunes', CAST(N'2014-11-07' AS Date), N'Portuguesa', N'F', N'viúvo', N'938245297', N'MelinaNunes467@gmail.com', 2628.0000, CAST(N'2020-04-25' AS Date), 36, 1, 52210, 1, N'945965913', N'PT5000502240029079777', N'55936066 s 273', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (35, N'Isack Leal', CAST(N'2017-06-05' AS Date), N'Portuguesa', N'M', N'viúvo', N'936416121', N'IsackLeal472@gmail.com', 2417.0000, CAST(N'2020-04-25' AS Date), 37, 2, 42290, 2, N'757181600', N'PT5000031982035906503', N'68449635 s 225', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (36, N'Octávio Lima', CAST(N'1977-02-21' AS Date), N'Portuguesa', N'M', N'casado', N'963567277', N'OctávioLima495@gmail.com', 2580.0000, CAST(N'2020-04-25' AS Date), 38, 1, 52220, 1, N'693069455', N'PT5000779893447531027', N'79473937 s 058', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (37, N'Rosalino Assunção', CAST(N'1970-02-24' AS Date), N'Portuguesa', N'M', N'divorciado', N'910647357', N'RosalinoAssunção536@gmail.com', 1828.0000, CAST(N'2020-04-25' AS Date), 39, 3, 12120, 0, N'557510064', N'PT5000766455481131863', N'72149376 s 818', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (38, N'Mary Antunes', CAST(N'1950-08-27' AS Date), N'Portuguesa', N'F', N'viúvo', N'913894390', N'MaryAntunes206@gmail.com', 2674.0000, CAST(N'2020-04-25' AS Date), 40, 0, 12212, 1, N'362439913', N'PT5000525293999474830', N'83177160 s 646', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (39, N'Geraldo Pacheco', CAST(N'1972-03-14' AS Date), N'Portuguesa', N'M', N'solteiro', N'912938840', N'GeraldoPacheco1085@gmail.com', 2265.0000, CAST(N'2020-04-25' AS Date), 41, 3, 12110, 2, N'890706245', N'PT5000953015957127319', N'70514318 s 674', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (40, N'Krittrin Pinho', CAST(N'2008-04-22' AS Date), N'Portuguesa', N'M', N'divorciado', N'932636827', N'KrittrinPinho1341@gmail.com', 1760.0000, CAST(N'2020-04-25' AS Date), 42, 1, 12212, 2, N'902529175', N'PT5000787330612513366', N'85466881 s 055', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (41, N'Minu Miranda', CAST(N'2003-06-07' AS Date), N'Portuguesa', N'F', N'divorciado', N'919732370', N'MinuMiranda1715@gmail.com', 4350.0000, CAST(N'2020-04-25' AS Date), 43, 3, 12120, 2, N'920901413', N'PT5000898735153506772', N'71758941 s 980', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (42, N'Noelle Domingues', CAST(N'1998-10-04' AS Date), N'Portuguesa', N'F', N'casado', N'969519321', N'NoelleDomingues1218@gmail.com', 1542.0000, CAST(N'2020-04-25' AS Date), 44, 0, 41100, 2, N'993153333', N'PT5000080175994557523', N'87436618 s 311', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (43, N'Maiara Correia', CAST(N'1955-08-16' AS Date), N'Portuguesa', N'F', N'viúvo', N'965441943', N'MaiaraCorreia796@gmail.com', 4266.0000, CAST(N'2020-04-25' AS Date), 45, 3, 42290, 1, N'510232456', N'PT5000819327096828136', N'89228654 s 904', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (44, N'Nelissa Vieira', CAST(N'1958-12-20' AS Date), N'Portuguesa', N'F', N'casado', N'964785669', N'NelissaVieira390@gmail.com', 2469.0000, CAST(N'2020-04-25' AS Date), 46, 5, 52210, 2, N'416642864', N'PT5000917338862022550', N'88482720 s 030', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (45, N'Romilton Amaral', CAST(N'1970-02-16' AS Date), N'Portuguesa', N'M', N'casado', N'960727344', N'RomiltonAmaral511@gmail.com', 4801.0000, CAST(N'2020-04-25' AS Date), 47, 0, 51510, 0, N'817811837', N'PT5000318993907569033', N'54875010 s 841', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (46, N'Ahmed Fonseca', CAST(N'1992-06-19' AS Date), N'Portuguesa', N'M', N'viúvo', N'933155949', N'AhmedFonseca1233@gmail.com', 2669.0000, CAST(N'2020-04-25' AS Date), 48, 1, 12120, 0, N'552107733', N'PT5000470989004868492', N'99687134 s 934', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (47, N'Sania Freitas', CAST(N'2003-11-13' AS Date), N'Portuguesa', N'F', N'viúvo', N'930803347', N'SaniaFreitas742@gmail.com', 3150.0000, CAST(N'2020-04-25' AS Date), 49, 0, 33411, 2, N'380455760', N'PT5000382388515374623', N'71449615 s 259', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (48, N'Cláussia Garcia', CAST(N'1976-09-17' AS Date), N'Portuguesa', N'F', N'casado', N'919586177', N'CláussiaGarcia172@gmail.com', 3039.0000, CAST(N'2020-04-25' AS Date), 50, 1, 52210, 2, N'895989684', N'PT5000285427856931607', N'70237206 s 030', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (49, N'Maryam Santos', CAST(N'1974-09-10' AS Date), N'Portuguesa', N'F', N'casado', N'933203921', N'MaryamSantos1452@gmail.com', 3287.0000, CAST(N'2020-04-25' AS Date), 51, 0, 12212, 1, N'432917645', N'PT5000472167257086480', N'66925457 s 212', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (50, N'Érick Neto', CAST(N'1978-02-28' AS Date), N'Portuguesa', N'M', N'casado', N'936036081', N'ÉrickNeto1382@gmail.com', 4695.0000, CAST(N'2020-04-25' AS Date), 52, 3, 33411, 1, N'171594325', N'PT5000270977550079233', N'89652238 s 948', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (51, N'Jody Antunes', CAST(N'1990-02-13' AS Date), N'Portuguesa', N'F', N'viúvo', N'930214482', N'JodyAntunes706@gmail.com', 3238.0000, CAST(N'2020-04-25' AS Date), 53, 5, 42290, 2, N'854684476', N'PT5000558581427202473', N'89776913 s 040', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (52, N'Frida Miranda', CAST(N'1968-02-25' AS Date), N'Portuguesa', N'F', N'viúvo', N'918101609', N'FridaMiranda713@gmail.com', 1579.0000, CAST(N'2020-04-25' AS Date), 54, 3, 52220, 1, N'040807965', N'PT5000836504485242668', N'67418310 s 294', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (53, N'Noely Cardoso', CAST(N'2006-07-02' AS Date), N'Portuguesa', N'F', N'solteiro', N'960674035', N'NoelyCardoso1408@gmail.com', 4741.0000, CAST(N'2020-04-25' AS Date), 55, 0, 52210, 2, N'381598223', N'PT5000499040212040791', N'65831923 s 774', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (54, N'Nala Brito', CAST(N'1957-07-28' AS Date), N'Portuguesa', N'F', N'divorciado', N'936685785', N'NalaBrito926@gmail.com', 1265.0000, CAST(N'2020-04-25' AS Date), 56, 1, 51510, 0, N'935595707', N'PT5000496356249023328', N'75071424 s 442', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (55, N'Dhyani Freitas', CAST(N'1990-10-28' AS Date), N'Portuguesa', N'F', N'viúvo', N'936453673', N'DhyaniFreitas694@gmail.com', 4966.0000, CAST(N'2020-04-25' AS Date), 57, 0, 41100, 1, N'403124048', N'PT5000622358665235888', N'64459659 s 009', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (56, N'Rayanna Moreira', CAST(N'1978-02-25' AS Date), N'Portuguesa', N'F', N'casado', N'961265010', N'RayannaMoreira1037@gmail.com', 2923.0000, CAST(N'2020-04-25' AS Date), 58, 2, 12211, 1, N'899810139', N'PT5000463607686943246', N'60553776 s 870', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (57, N'Laiane Miranda', CAST(N'1979-10-21' AS Date), N'Portuguesa', N'F', N'divorciado', N'968093113', N'LaianeMiranda701@gmail.com', 3738.0000, CAST(N'2020-04-25' AS Date), 59, 0, 11200, 2, N'042859813', N'PT5000053466640171685', N'68194106 s 339', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (58, N'Suriel Almeida', CAST(N'1988-10-20' AS Date), N'Portuguesa', N'F', N'casado', N'930574548', N'SurielAlmeida1599@gmail.com', 1079.0000, CAST(N'2020-04-25' AS Date), 60, 0, 33412, 0, N'097111027', N'PT5000918156380329168', N'85293518 s 477', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (59, N'Navneet Neves', CAST(N'1987-03-16' AS Date), N'Portuguesa', N'F', N'separado', N'916299059', N'NavneetNeves918@gmail.com', 1227.0000, CAST(N'2020-04-25' AS Date), 61, 5, 51510, 0, N'598961678', N'PT5000808829466887284', N'91505762 s 067', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (60, N'Djenabu Silva', CAST(N'1995-06-01' AS Date), N'Portuguesa', N'F', N'viúvo', N'937757080', N'DjenabuSilva1060@gmail.com', 4904.0000, CAST(N'2020-04-25' AS Date), 62, 3, 12120, 0, N'466583806', N'PT5000363952303616714', N'98245467 s 707', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (61, N'Anandy Gonçalves', CAST(N'1952-02-12' AS Date), N'Portuguesa', N'F', N'casado', N'936362081', N'AnandyGonçalves1715@gmail.com', 1471.0000, CAST(N'2020-04-25' AS Date), NULL, 0, 12221, 0, N'461821398', N'PT5000775602031817198', N'64087873 s 987', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (62, N'Djaraye Rodrigues', CAST(N'2014-06-22' AS Date), N'Portuguesa', N'F', N'separado', N'966516363', N'DjarayeRodrigues1435@gmail.com', 2558.0000, CAST(N'2020-04-25' AS Date), 64, 5, 12211, 2, N'419985205', N'PT5000848000186535246', N'80066998 s 966', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (63, N'Inti Castro', CAST(N'1954-11-22' AS Date), N'Portuguesa', N'M', N'separado', N'913509369', N'IntiCastro1106@gmail.com', 2682.0000, CAST(N'2020-04-25' AS Date), 65, 1, 12212, 2, N'105929524', N'PT5000251627775468587', N'59273983 s 253', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (64, N'Mihael Leal', CAST(N'1955-08-01' AS Date), N'Portuguesa', N'M', N'viúvo', N'936104151', N'MihaelLeal1686@gmail.com', 2717.0000, CAST(N'2020-04-25' AS Date), 66, 1, 41100, 1, N'977804581', N'PT5000810904080515168', N'73732326 s 771', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (65, N'Taylor Gonçalves', CAST(N'1961-11-19' AS Date), N'Portuguesa', N'M', N'viúvo', N'965140783', N'TaylorGonçalves801@gmail.com', 1124.0000, CAST(N'2020-04-25' AS Date), 67, 1, 33412, 2, N'267024848', N'PT5000343473334421230', N'67500735 s 926', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (66, N'Thierno Azevedo', CAST(N'1980-06-18' AS Date), N'Portuguesa', N'M', N'separado', N'963126310', N'ThiernoAzevedo770@gmail.com', 4280.0000, CAST(N'2020-04-25' AS Date), 68, 5, 12120, 0, N'435171862', N'PT5000468520777193547', N'93634073 s 724', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (67, N'Umar Monteiro', CAST(N'1980-12-10' AS Date), N'Portuguesa', N'M', N'viúvo', N'913756182', N'UmarMonteiro1474@gmail.com', 4274.0000, CAST(N'2020-04-25' AS Date), 69, 3, 12221, 2, N'975646073', N'PT5000761508887577574', N'91334391 s 542', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (68, N'Bento Loureiro', CAST(N'1971-06-05' AS Date), N'Portuguesa', N'M', N'solteiro', N'968447168', N'BentoLoureiro1943@gmail.com', 3342.0000, CAST(N'2020-04-25' AS Date), 70, 0, 52210, 0, N'676325543', N'PT5000513463490325684', N'89816463 s 299', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (69, N'Eli Sousa', CAST(N'2007-01-07' AS Date), N'Portuguesa', N'M', N'separado', N'939608756', N'EliSousa1618@gmail.com', 946.0000, CAST(N'2020-04-25' AS Date), 71, 1, 12212, 1, N'317980489', N'PT5000827603111218840', N'52108742 s 926', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (70, N'Axel Moreira', CAST(N'2004-05-12' AS Date), N'Portuguesa', N'M', N'separado', N'932829573', N'AxelMoreira664@gmail.com', 4628.0000, CAST(N'2020-04-25' AS Date), 72, 1, 33411, 1, N'561821389', N'PT5000941722985453845', N'83493411 s 562', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (71, N'André Ribeiro', CAST(N'1965-06-27' AS Date), N'Portuguesa', N'M', N'divorciado', N'939769157', N'AndréRibeiro284@gmail.com', 3736.0000, CAST(N'2020-04-25' AS Date), 73, 0, 11200, 1, N'648957245', N'PT5000379650996291329', N'89962508 s 696', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (72, N'Ravidson Macedo', CAST(N'2009-02-02' AS Date), N'Portuguesa', N'M', N'separado', N'935595450', N'RavidsonMacedo394@gmail.com', 1804.0000, CAST(N'2020-04-25' AS Date), 74, 5, 12120, 1, N'934280379', N'PT5000856655615933537', N'80993754 s 211', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (73, N'Zanil Magalhães', CAST(N'1990-11-07' AS Date), N'Portuguesa', N'M', N'viúvo', N'930636429', N'ZanilMagalhães10@gmail.com', 1650.0000, CAST(N'2020-04-25' AS Date), 75, 3, 42290, 1, N'298012844', N'PT5000058403041271477', N'56456615 s 841', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (74, N'Safira Macedo', CAST(N'2008-12-10' AS Date), N'Portuguesa', N'F', N'viúvo', N'918769986', N'SafiraMacedo633@gmail.com', 2394.0000, CAST(N'2020-04-25' AS Date), 76, 5, 12211, 2, N'780234108', N'PT5000690518383704366', N'75573869 s 180', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (75, N'Favian Castro', CAST(N'1977-10-20' AS Date), N'Portuguesa', N'M', N'solteiro', N'918030244', N'FavianCastro197@gmail.com', 1123.0000, CAST(N'2020-04-25' AS Date), 77, 0, 51510, 0, N'904726177', N'PT5000321379436585947', N'50841179 s 017', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (76, N'Anastacia Vicente', CAST(N'2009-04-24' AS Date), N'Portuguesa', N'F', N'casado', N'961097822', N'AnastaciaVicente1844@gmail.com', 4185.0000, CAST(N'2020-04-25' AS Date), 78, 5, 43212, 1, N'049551889', N'PT5000556179390026364', N'72367179 s 939', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (77, N'Wendy Matias', CAST(N'1980-12-06' AS Date), N'Portuguesa', N'F', N'divorciado', N'969399325', N'WendyMatias149@gmail.com', 4314.0000, CAST(N'2020-04-25' AS Date), 79, 1, 51510, 2, N'193705584', N'PT5000484653009176035', N'50000357 s 876', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (78, N'Diliana Garcia', CAST(N'2006-10-25' AS Date), N'Portuguesa', N'F', N'viúvo', N'935976198', N'DilianaGarcia760@gmail.com', 2510.0000, CAST(N'2020-04-25' AS Date), 80, 2, 33412, 1, N'138448583', N'PT5000834771268190533', N'58107690 s 054', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (79, N'Cristiana Faria', CAST(N'1990-09-04' AS Date), N'Portuguesa', N'F', N'separado', N'962983063', N'CristianaFaria1014@gmail.com', 4750.0000, CAST(N'2020-04-25' AS Date), 81, 3, 51510, 0, N'961273186', N'PT5000928315552108680', N'64918350 s 258', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (80, N'Mishka Neto', CAST(N'1951-06-06' AS Date), N'Portuguesa', N'F', N'separado', N'912189276', N'MishkaNeto85@gmail.com', 3424.0000, CAST(N'2020-04-25' AS Date), 82, 0, 12212, 1, N'832267821', N'PT5000814892124709700', N'83189293 s 215', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (81, N'Malam Lourenço', CAST(N'1982-04-22' AS Date), N'Portuguesa', N'M', N'viúvo', N'917018398', N'MalamLourenço698@gmail.com', 2026.0000, CAST(N'2020-04-25' AS Date), 83, 3, 51510, 0, N'182488105', N'PT5000150292404558603', N'87533268 s 913', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (82, N'Melina Garcia', CAST(N'1969-06-06' AS Date), N'Portuguesa', N'F', N'casado', N'960197739', N'MelinaGarcia1708@gmail.com', 2775.0000, CAST(N'2020-04-25' AS Date), NULL, 5, 51510, 0, N'664841658', N'PT5000129975380159925', N'74092153 s 299', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (83, N'Ciara Nascimento', CAST(N'1988-07-01' AS Date), N'Portuguesa', N'F', N'solteiro', N'919820189', N'CiaraNascimento1422@gmail.com', 2633.0000, CAST(N'2020-04-25' AS Date), 85, 0, 51510, 0, N'599624167', N'PT5000762495484673997', N'69953273 s 609', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (84, N'Prapti Vieira', CAST(N'1980-04-20' AS Date), N'Portuguesa', N'F', N'viúvo', N'966326310', N'PraptiVieira1549@gmail.com', 2780.0000, CAST(N'2020-04-25' AS Date), 86, 0, 12211, 0, N'821568835', N'PT5000743308790217769', N'84873846 s 110', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (85, N'Haziel Machado', CAST(N'2015-11-17' AS Date), N'Portuguesa', N'M', N'divorciado', N'937700436', N'HazielMachado1862@gmail.com', 4195.0000, CAST(N'2020-04-25' AS Date), 87, 2, 12110, 0, N'252830017', N'PT5000623833284939208', N'68099674 s 791', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (86, N'Noa Martins', CAST(N'2005-10-22' AS Date), N'Portuguesa', N'F', N'solteiro', N'934357222', N'NoaMartins396@gmail.com', 4444.0000, CAST(N'2020-04-25' AS Date), 88, 0, 12212, 0, N'531252800', N'PT5000682814932415338', N'85699162 s 067', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (87, N'Jake Assunção', CAST(N'1998-04-27' AS Date), N'Portuguesa', N'M', N'divorciado', N'916240262', N'JakeAssunção1334@gmail.com', 4990.0000, CAST(N'2020-04-25' AS Date), 89, 0, 12211, 0, N'542142542', N'PT5000858648778614299', N'63173632 s 939', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (88, N'Ilis Esteves', CAST(N'1994-12-13' AS Date), N'Portuguesa', N'F', N'casado', N'967174643', N'IlisEsteves137@gmail.com', 4743.0000, CAST(N'2020-04-25' AS Date), NULL, 5, 51510, 1, N'474806472', N'PT5000104190236419682', N'69198080 s 908', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (89, N'Kika Brito', CAST(N'1983-11-24' AS Date), N'Portuguesa', N'F', N'solteiro', N'931350083', N'KikaBrito123@gmail.com', 1922.0000, CAST(N'2020-04-25' AS Date), 91, 1, 12212, 1, N'470472435', N'PT5000644276119178770', N'53790155 s 516', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (90, N'Nali Simões', CAST(N'2006-07-21' AS Date), N'Portuguesa', N'F', N'separado', N'967418745', N'NaliSimões1763@gmail.com', 2294.0000, CAST(N'2020-04-25' AS Date), NULL, 0, 12211, 2, N'482766027', N'PT5000616126032262174', N'51340143 s 675', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (91, N'Joseph Anjos', CAST(N'2017-04-17' AS Date), N'Portuguesa', N'M', N'casado', N'960060318', N'JosephAnjos1145@gmail.com', 2094.0000, CAST(N'2020-04-25' AS Date), 93, 5, 52220, 0, N'878018784', N'PT5000219656323244324', N'78171874 s 420', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (92, N'Osvaldo Magalhães', CAST(N'2000-09-13' AS Date), N'Portuguesa', N'M', N'separado', N'919992803', N'OsvaldoMagalhães1544@gmail.com', 1232.0000, CAST(N'2020-04-25' AS Date), 94, 0, 33411, 1, N'253759950', N'PT5000090488890478554', N'66706792 s 320', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (93, N'Yásmine Amorim', CAST(N'1953-07-28' AS Date), N'Portuguesa', N'F', N'divorciado', N'930392584', N'YásmineAmorim782@gmail.com', 4527.0000, CAST(N'2020-04-25' AS Date), 95, 3, 12221, 2, N'906493236', N'PT5000380424803367067', N'68805875 s 491', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (94, N'Janivaldo Ribeiro', CAST(N'1985-03-08' AS Date), N'Portuguesa', N'M', N'viúvo', N'960646673', N'JanivaldoRibeiro1726@gmail.com', 3906.0000, CAST(N'2020-04-25' AS Date), 96, 0, 42290, 0, N'780610201', N'PT5000524125924175608', N'93034876 s 873', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (95, N'Wilson Vaz', CAST(N'2016-09-14' AS Date), N'Portuguesa', N'M', N'divorciado', N'967792423', N'WilsonVaz1048@gmail.com', 2169.0000, CAST(N'2020-04-25' AS Date), 97, 0, 33412, 2, N'451116127', N'PT5000981192294433843', N'53034758 s 852', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (96, N'Djalmo Costa', CAST(N'1959-12-25' AS Date), N'Portuguesa', N'M', N'separado', N'914127967', N'DjalmoCosta1015@gmail.com', 1350.0000, CAST(N'2020-04-25' AS Date), 98, 5, 51510, 0, N'863563791', N'PT5000539963082759709', N'69437049 s 808', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (97, N'Gaspar Reis', CAST(N'1975-04-10' AS Date), N'Portuguesa', N'M', N'casado', N'915660895', N'GasparReis1585@gmail.com', 898.0000, CAST(N'2020-04-25' AS Date), 99, 0, 41100, 1, N'198992727', N'PT5000574768881007865', N'56303518 s 949', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (98, N'Nadja Almeida', CAST(N'1990-10-25' AS Date), N'Portuguesa', N'F', N'separado', N'915179636', N'NadjaAlmeida859@gmail.com', 4473.0000, CAST(N'2020-04-25' AS Date), 100, 2, 52210, 1, N'273542261', N'PT5000131772202575595', N'93902959 s 623', 1)
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (99, N'Jayceline Ferreira', CAST(N'2016-07-04' AS Date), N'Portuguesa', N'F', N'casado', N'913182718', N'JaycelineFerreira491@gmail.com', 4307.0000, CAST(N'2020-04-25' AS Date), 101, 0, 52210, 0, N'996523731', N'PT5000830810018531121', N'98880051 s 734', 1)
GO
INSERT [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario], [Nome_Funcionario], [Data_Nascimento], [Nacionalidade], [Sexo], [Estado_Civil], [Telemovel], [E_mail], [Vencimento], [Data_Admissao], [Cod_endereco], [Cod_Situacao], [Cod_profissao], [Cod_tipo_pagamento], [NIF], [NIB], [No_doc_identificacao], [Cod_empresa]) VALUES (100, N'Joana', CAST(N'1980-01-01' AS Date), N'Portuguesa', N'F', N'solteiro', N'935625545', N'jj@mail.com', 1000.0000, CAST(N'2020-01-01' AS Date), 2, 1, 11200, 0, N'699999999', N'PT5000210090864646921', N'69648488 a 581', 1)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (1, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (1, 1)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (1, 22)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (1, 100)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (2, 75)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (3, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (3, 47)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (3, 49)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (3, 53)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (4, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (5, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (5, 7)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (5, 39)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (6, 58)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (7, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (8, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (8, 90)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (11, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (11, 98)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (12, 49)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (12, 61)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (13, 87)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (14, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (15, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (15, 33)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (17, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (17, 23)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (18, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (18, 47)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (18, 88)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (19, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (19, 42)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (19, 86)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (20, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (20, 22)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (20, 37)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (21, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (21, 5)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (21, 29)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (21, 42)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (22, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (22, 24)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (23, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (23, 14)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (24, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (25, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (25, 43)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (26, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (26, 90)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (27, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (28, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (28, 48)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (29, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (30, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (31, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (31, 94)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (32, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (32, 2)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (33, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (34, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (34, 89)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (35, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (35, 59)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (36, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (36, 10)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (37, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (38, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (39, 0)
INSERT [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] ([Cod_loja], [Cod_funcionario]) VALUES (39, 6)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 54, 1, 1, 1, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (2, 54, 1, 1, 2, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (3, 54, 1, 1, 3, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (4, 54, 1, 1, 4, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (5, 54, 1, 1, 5, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (6, 54, 1, 1, 6, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (7, 54, 1, 1, 7, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (8, 54, 1, 1, 8, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (9, 54, 1, 1, 9, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (10, 54, 1, 1, 10, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 55, 1, 1, 1, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (2, 55, 1, 1, 2, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (3, 55, 1, 1, 3, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (4, 55, 1, 1, 4, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (5, 55, 1, 1, 5, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (6, 55, 1, 1, 6, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (7, 55, 1, 1, 7, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (8, 55, 1, 1, 8, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (9, 55, 1, 1, 9, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (10, 55, 1, 1, 10, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 56, 1, 1, 1, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (2, 56, 1, 1, 2, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (3, 56, 1, 1, 3, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (4, 56, 1, 1, 4, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (5, 56, 1, 1, 5, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (6, 56, 1, 1, 6, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (7, 56, 1, 1, 7, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (8, 56, 1, 1, 8, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (9, 56, 1, 1, 9, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (10, 56, 1, 1, 10, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 57, 1, 1, 1, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (2, 57, 1, 1, 2, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (3, 57, 1, 1, 3, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (4, 57, 1, 1, 4, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (5, 57, 1, 1, 5, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (6, 57, 1, 1, 6, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (7, 57, 1, 1, 7, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (8, 57, 1, 1, 8, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (9, 57, 1, 1, 9, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (10, 57, 1, 1, 10, 4, 15.0000, 23, CAST(N'2020-01-15' AS Date), 60.0000, 13.8000, 73.8000, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 63, 1, 1, 2, 2, 15.0000, 23, CAST(N'2020-01-25' AS Date), 28.5000, 6.5550, 35.0550, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 64, 1, 1, 2, 1, 15.0000, 23, CAST(N'2020-06-25' AS Date), 14.2500, 3.2775, 17.5275, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 65, 1, 1, 10, 5, 15.0000, 23, CAST(N'2020-06-11' AS Date), 71.2500, 16.3875, 87.6375, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 66, 1, 1, 11, 10, 15.0000, 23, CAST(N'2020-06-10' AS Date), 142.5000, 32.7750, 175.2750, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (2, 66, 1, 1, 12, 20, 5.0000, 0, CAST(N'2020-06-10' AS Date), 95.0000, 0.0000, 95.0000, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 67, 1, 1, 13, 5, 5.0000, 0, CAST(N'2020-06-25' AS Date), 23.7500, 0.0000, 23.7500, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (2, 67, 1, 1, 16, 2, 16.5100, 23, CAST(N'2020-06-25' AS Date), 32.3596, 7.4427, 39.8023, 2, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 68, 1, 1, 19, 5, 15.0000, 23, CAST(N'2020-06-25' AS Date), 72.7500, 16.7325, 89.4825, 3, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 60, 2, 1, 1, 1, 15.0000, 23, CAST(N'2020-01-10' AS Date), 13.5000, 3.1050, 16.6050, 10, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 62, 2, 1, 3, 3, 15.0000, 23, CAST(N'2020-01-25' AS Date), 45.0000, 10.3500, 55.3500, 0, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 71, 2, 1, 1, 3, 15.0000, 23, CAST(N'2020-01-03' AS Date), 40.5000, 9.3150, 49.8150, 10, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 74, 2, 1, 1, 3, 15.0000, 23, CAST(N'2020-01-15' AS Date), 42.7500, 9.8325, 52.5825, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 73, 4, 1, 1, 2, 15.0000, 23, CAST(N'2020-01-05' AS Date), 28.5000, 6.5550, 35.0550, 5, 1)
INSERT [ClubeVideo].[LinhaDocumento] ([nLinha], [documento], [tipoDoc], [empresa], [artigo], [quantidade], [precoUnit], [taxaIVA], [dataEntrega], [valorMov], [valorIVA], [valorTotalIVA], [desconto], [estado]) VALUES (1, 75, 4, 1, 2, 2, 15.0000, 23, CAST(N'2020-01-15' AS Date), 27.0000, 6.2100, 33.2100, 10, 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (1, N'Lista 1', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (2, N'Lista 2', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (3, N'Lista 3', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (4, N'Lista 4', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (5, N'Lista 5', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (6, N'Lista 6', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (7, N'Lista 7', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (8, N'Lista 8', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (9, N'Lista 9', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (10, N'Lista 10', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (11, N'Lista 11', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (12, N'Lista 12', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (13, N'Lista 13', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (14, N'Lista 14', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (15, N'Lista 15', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (16, N'Lista 16', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (17, N'Lista 17', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (18, N'Lista 18', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (19, N'Lista 19', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (20, N'Lista 20', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (21, N'Lista 21', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (22, N'Lista 22', 1)
INSERT [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos], [Descricao], [Cod_empresa]) VALUES (23, N'lista 23', 1)
INSERT [ClubeVideo].[Login] ([Cod_func], [Palavra_passe]) VALUES (0, 0x3E519F3C7685A1B29C06BD0D954EE6F7AEE7766758FFA8154BC809A55EE526B97697D95F8124749A15ABFEA25841AC5A5001C29447521FE49F7F3F3BC6B41A8C)
INSERT [ClubeVideo].[Login] ([Cod_func], [Palavra_passe]) VALUES (1, 0x3E519F3C7685A1B29C06BD0D954EE6F7AEE7766758FFA8154BC809A55EE526B97697D95F8124749A15ABFEA25841AC5A5001C29447521FE49F7F3F3BC6B41A8C)
INSERT [ClubeVideo].[Login] ([Cod_func], [Palavra_passe]) VALUES (2, 0x3E519F3C7685A1B29C06BD0D954EE6F7AEE7766758FFA8154BC809A55EE526B97697D95F8124749A15ABFEA25841AC5A5001C29447521FE49F7F3F3BC6B41A8C)
INSERT [ClubeVideo].[Login] ([Cod_func], [Palavra_passe]) VALUES (3, 0x3E519F3C7685A1B29C06BD0D954EE6F7AEE7766758FFA8154BC809A55EE526B97697D95F8124749A15ABFEA25841AC5A5001C29447521FE49F7F3F3BC6B41A8C)
INSERT [ClubeVideo].[Login] ([Cod_func], [Palavra_passe]) VALUES (4, 0xA17E61A52A4BBD68FFE4F3A04D534FF838EF1FD11848127D52C279582107ED064AF85CD7E26C1F9B0D24DE853B2645482D98399CDA7E12E4CBC155F5892B056E)
INSERT [ClubeVideo].[Login] ([Cod_func], [Palavra_passe]) VALUES (5, 0xA17E61A52A4BBD68FFE4F3A04D534FF838EF1FD11848127D52C279582107ED064AF85CD7E26C1F9B0D24DE853B2645482D98399CDA7E12E4CBC155F5892B056E)
INSERT [ClubeVideo].[Login] ([Cod_func], [Palavra_passe]) VALUES (6, 0xA17E61A52A4BBD68FFE4F3A04D534FF838EF1FD11848127D52C279582107ED064AF85CD7E26C1F9B0D24DE853B2645482D98399CDA7E12E4CBC155F5892B056E)
SET IDENTITY_INSERT [ClubeVideo].[LOJA] ON 

INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (1, N'Loja1', N'Ally_Edmonds719046530@bauros.biz', N'771183881', 59, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (2, N'Loja2', N'David_Turner1863862669@bretoux.com', N'536441670', 21, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (3, N'Loja3', N'Anne_Gibson127901834@atink.com', N'726272913', 100, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (4, N'Loja4', N'Chester_Walker1593847277@gmail.com', N'115001911', 50, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (5, N'Loja5', N'Chester_Cartwright2059996043@grannar.com', N'524480167', 11, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (6, N'Loja6', N'Natalie_Reid1110304090@sveldo.biz', N'854459037', 82, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (7, N'Loja7', N'John_Waterson1654668801@acrit.org', N'789532207', 59, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (8, N'Loja8', N'Leslie_Upsdell674895996@gmail.com', N'228539910', 98, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (9, N'Loja9', N'Mason_Lynch1988434359@ovock.tech', N'264514520', 57, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (10, N'Loja10', N'Jasmine_Mccall207551185@bungar.biz', N'303276371', 48, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (11, N'Loja11', N'Denis_Potts300310713@gmail.com', N'889398477', 14, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (12, N'Loja12', N'Ronald_Kidd1549857928@grannar.com', N'560516713', 15, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (13, N'Loja13', N'Sylvia_Hope1560800573@gembat.biz', N'697664074', 97, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (14, N'Loja14', N'Chelsea_Wilkinson1090175024@qater.org', N'258318958', 24, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (15, N'Loja15', N'Emery_Cann605035559@naiker.biz', N'431376932', 10, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (16, N'Loja16', N'Madelyn_Hunt1165717974@ovock.tech', N'605226487', 75, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (17, N'Loja17', N'Liam_Sherry312156228@nanoff.biz', N'187515153', 59, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (18, N'Loja18', N'Vicky_Morris1360580398@corti.com', N'247409831', 76, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (19, N'Loja19', N'David_Walker2035181609@iatim.tech', N'143277818', 100, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (20, N'Loja20', N'Boris_Ripley851633513@sheye.org', N'779552313', 36, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (21, N'Loja21', N'Boris_Owens407071250@nimogy.biz', N'940394874', 1, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (22, N'Loja22', N'Denny_Dowson1472132707@naiker.biz', N'711639883', 51, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (23, N'Loja23', N'wen_Crawley1252824874@atink.com', N'274188433', 40, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (24, N'Loja24', N'Jules_Owens871513750@jiman.org', N'850500789', 66, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (25, N'Loja25', N'Julia_Hill1399260397@bauros.biz', N'699253903', 79, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (26, N'Loja26', N'Joseph_Brock1696984555@guentu.biz', N'283757351', 78, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (27, N'Loja27', N'Bob_Bailey2019467033@naiker.biz', N'595709081', 82, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (28, N'Loja28', N'Aeris_Pierce560674660@yahoo.com', N'232512662', 15, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (29, N'Loja29', N'Christy_Mould1234747623@typill.biz', N'710545063', 58, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (30, N'Loja30', N'Daniel_Booth1994557298@iatim.tech', N'242788574', 83, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (31, N'Loja31', N'Thea_Eagle1841371666@hourpy.biz', N'327982864', 44, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (32, N'Loja32', N'Nate_Reese1731736115@muall.tech', N'391481985', 66, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (33, N'Loja33', N'Cadence_Thorne1935255221@gmail.com', N'106847909', 17, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (34, N'Loja34', N'Elijah_John1972196561@elnee.tech', N'668115412', 5, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (35, N'Loja35', N'Fred_Bowen1369102794@atink.com', N'241720953', 31, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (36, N'Loja36', N'Denny_Pope1100831048@jiman.org', N'493198062', NULL, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (37, N'Loja37', N'Deborah_Uttridge428564781@nimogy.biz', N'265593828', 67, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (38, N'Loja38', N'Mary_Waterson211241282@bauros.biz', N'506902610', 74, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (39, N'Loja39', N'Ruby_Simpson1240610183@mafthy.com', N'411292576', 57, 1, 1)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (40, N'Loja40', N'Hannah_Callan78388006@twipet.com', N'755438347', 93, 1, 0)
INSERT [ClubeVideo].[LOJA] ([Cod_loja], [Nome_loja], [E_mail], [Telefone], [Cod_endereco], [Cod_empresa], [ativa]) VALUES (41, N'Loja 41', N'loja41@gmail.com', N'989898989', 3, 1, 0)
SET IDENTITY_INSERT [ClubeVideo].[LOJA] OFF
INSERT [ClubeVideo].[PAGAMENTO] ([Cod_Pagamento], [Descricao]) VALUES (0, N'Transferência')
INSERT [ClubeVideo].[PAGAMENTO] ([Cod_Pagamento], [Descricao]) VALUES (1, N'Cheque')
INSERT [ClubeVideo].[PAGAMENTO] ([Cod_Pagamento], [Descricao]) VALUES (2, N'Dinheiro')
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 1, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 1, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 1, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 1, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 1, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 1, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 1, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 1, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 1, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 1, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 1, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 1, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 1, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 1, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 1, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 1, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 1, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 1, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 1, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 1, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 1, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 1, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 1, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 1, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 1, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 1, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 1, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 1, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 1, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 1, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 1, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 1, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 1, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 1, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 1, 17.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 1, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 1, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 1, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 2, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 2, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 2, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 2, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 2, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 2, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 2, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 2, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 2, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 2, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 2, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 2, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 2, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 2, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 2, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 2, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 2, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 2, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 2, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 2, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 2, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 2, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 2, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 2, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 2, 11.2700)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 2, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 2, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 2, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 2, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 2, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 2, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 2, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 2, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 2, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 2, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 2, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 2, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 2, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 2, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 3, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 3, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 3, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 3, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 3, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 3, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 3, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 3, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 3, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 3, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 3, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 3, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 3, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 3, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 3, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 3, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 3, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 3, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 3, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 3, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 3, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 3, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 3, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 3, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 3, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 3, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 3, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 3, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 3, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 3, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 3, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 3, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 3, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 3, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 3, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 3, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 3, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 3, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 4, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 4, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 4, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 4, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 4, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 4, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 4, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 4, 13.6200)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 4, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 4, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 4, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 4, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 4, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 4, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 4, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 4, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 4, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 4, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 4, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 4, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 4, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 4, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 4, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 4, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 4, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 4, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 4, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 4, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 4, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 4, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 4, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 4, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 4, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 4, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 4, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 4, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 4, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 4, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 5, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 5, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 5, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 5, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 5, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 5, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 5, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 5, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 5, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 5, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 5, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 5, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 5, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 5, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 5, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 5, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 5, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 5, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 5, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 5, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 5, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 5, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 5, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 5, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 5, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 5, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 5, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 5, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 5, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 5, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 5, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 5, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 5, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 5, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 5, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 5, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 5, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 5, 19.8800)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 6, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 6, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 6, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 6, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 6, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 6, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 6, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 6, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 6, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 6, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 6, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 6, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 6, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 6, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 6, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 6, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 6, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 6, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 6, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 6, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 6, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 6, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 6, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 6, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 6, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 6, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 6, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 6, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 6, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 6, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 6, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 6, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 6, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 6, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 6, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 6, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 6, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 6, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 7, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 7, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 7, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 7, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 7, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 7, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 7, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 7, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 7, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 7, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 7, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 7, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 7, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 7, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 7, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 7, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 7, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 7, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 7, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 7, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 7, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 7, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 7, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 7, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 7, 11.2700)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 7, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 7, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 7, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 7, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 7, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 7, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 7, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 7, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 7, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 7, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 7, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 7, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 7, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 7, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 8, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 8, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 8, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 8, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 8, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 8, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 8, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 8, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 8, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 8, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 8, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 8, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 8, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 8, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 8, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 8, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 8, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 8, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 8, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 8, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 8, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 8, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 8, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 8, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 8, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 8, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 8, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 8, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 8, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 8, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 8, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 8, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 8, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 8, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 8, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 8, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 8, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 8, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 9, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 9, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 9, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 9, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 9, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 9, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 9, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 9, 13.6200)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 9, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 9, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 9, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 9, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 9, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 9, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 9, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 9, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 9, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 9, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 9, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 9, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 9, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 9, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 9, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 9, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 9, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 9, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 9, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 9, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 9, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 9, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 9, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 9, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 9, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 9, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 9, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 9, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 9, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 9, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 10, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 10, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 10, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 10, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 10, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 10, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 10, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 10, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 10, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 10, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 10, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 10, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 10, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 10, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 10, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 10, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 10, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 10, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 10, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 10, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 10, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 10, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 10, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 10, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 10, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 10, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 10, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 10, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 10, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 10, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 10, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 10, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 10, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 10, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 10, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 10, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 10, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 10, 19.8800)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 11, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 11, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 11, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 11, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 11, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 11, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 11, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 11, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 11, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 11, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 11, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 11, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 11, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 11, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 11, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 11, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 11, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 11, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 11, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 11, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 11, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 11, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 11, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 11, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 11, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 11, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 11, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 11, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 11, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 11, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 11, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 11, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 11, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 11, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 11, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 11, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 11, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 11, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 12, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 12, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 12, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 12, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 12, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 12, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 12, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 12, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 12, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 12, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 12, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 12, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 12, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 12, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 12, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 12, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 12, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 12, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 12, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 12, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 12, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 12, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 12, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 12, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 12, 11.2700)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 12, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 12, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 12, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 12, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 12, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 12, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 12, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 12, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 12, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 12, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 12, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 12, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 12, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 12, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 13, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 13, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 13, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 13, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 13, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 13, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 13, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 13, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 13, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 13, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 13, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 13, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 13, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 13, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 13, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 13, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 13, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 13, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 13, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 13, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 13, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 13, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 13, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 13, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 13, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 13, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 13, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 13, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 13, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 13, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 13, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 13, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 13, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 13, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 13, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 13, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 13, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 13, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 14, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 14, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 14, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 14, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 14, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 14, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 14, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 14, 13.6200)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 14, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 14, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 14, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 14, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 14, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 14, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 14, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 14, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 14, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 14, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 14, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 14, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 14, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 14, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 14, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 14, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 14, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 14, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 14, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 14, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 14, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 14, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 14, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 14, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 14, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 14, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 14, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 14, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 14, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 14, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 15, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 15, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 15, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 15, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 15, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 15, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 15, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 15, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 15, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 15, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 15, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 15, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 15, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 15, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 15, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 15, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 15, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 15, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 15, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 15, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 15, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 15, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 15, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 15, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 15, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 15, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 15, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 15, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 15, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 15, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 15, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 15, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 15, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 15, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 15, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 15, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 15, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 15, 19.8800)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 16, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 16, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 16, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 16, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 16, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 16, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 16, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 16, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 16, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 16, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 16, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 16, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 16, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 16, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 16, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 16, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 16, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 16, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 16, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 16, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 16, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 16, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 16, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 16, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 16, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 16, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 16, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 16, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 16, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 16, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 16, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 16, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 16, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 16, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 16, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 16, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 16, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 16, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 17, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 17, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 17, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 17, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 17, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 17, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 17, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 17, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 17, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 17, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 17, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 17, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 17, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 17, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 17, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 17, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 17, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 17, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 17, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 17, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 17, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 17, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 17, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 17, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 17, 11.2700)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 17, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 17, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 17, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 17, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 17, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 17, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 17, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 17, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 17, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 17, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 17, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 17, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 17, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 17, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 18, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 18, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 18, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 18, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 18, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 18, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 18, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 18, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 18, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 18, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 18, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 18, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 18, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 18, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 18, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 18, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 18, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 18, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 18, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 18, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 18, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 18, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 18, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 18, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 18, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 18, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 18, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 18, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 18, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 18, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 18, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 18, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 18, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 18, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 18, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 18, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 18, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 18, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 19, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 19, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 19, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 19, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 19, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 19, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 19, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 19, 13.6200)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 19, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 19, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 19, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 19, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 19, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 19, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 19, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 19, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 19, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 19, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 19, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 19, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 19, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 19, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 19, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 19, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 19, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 19, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 19, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 19, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 19, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 19, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 19, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 19, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 19, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 19, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 19, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 19, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 19, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 19, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 20, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 20, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 20, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 20, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 20, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 20, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 20, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 20, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 20, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 20, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 20, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 20, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 20, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 20, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 20, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 20, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 20, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 20, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 20, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 20, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 20, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 20, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 20, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 20, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 20, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 20, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 20, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 20, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 20, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 20, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 20, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 20, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 20, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 20, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 20, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 20, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 20, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 20, 19.8800)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 21, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 21, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 21, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 21, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 21, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 21, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 21, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 21, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 21, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 21, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 21, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 21, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 21, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 21, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 21, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 21, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 21, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 21, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 21, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 21, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 21, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 21, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 21, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 21, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 21, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 21, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 21, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 21, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 21, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 21, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 21, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 21, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 21, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 21, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 21, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 21, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 21, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 21, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 22, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 22, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 22, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 22, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 22, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 22, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 22, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 22, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 22, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 22, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 22, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 22, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 22, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 22, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 22, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 22, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 22, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 22, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 22, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 22, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 22, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 22, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 22, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 22, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 22, 11.2700)
GO
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 22, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 22, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 22, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 22, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 22, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 22, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 22, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 22, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 22, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 22, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 22, 18.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 22, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 22, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 22, 19.8800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (1, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (2, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (3, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (4, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (5, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (6, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (7, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (8, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (9, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (10, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (11, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (12, 23, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (13, 23, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (14, 23, 5.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (15, 23, 17.7600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (16, 23, 16.5100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (17, 23, 16.3300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (18, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (19, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (20, 23, 13.6200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (21, 23, 10.5600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (22, 23, 10.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (23, 23, 18.0900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (24, 23, 15.6500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (25, 23, 18.4700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (26, 23, 15.2900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (27, 23, 15.7300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (28, 23, 19.4600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (29, 23, 19.8700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (30, 23, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (31, 23, 10.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (32, 23, 15.6100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (33, 23, 12.1900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (34, 23, 14.4500)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (35, 23, 16.9100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (36, 23, 15.3100)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (37, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (38, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (39, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (40, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (41, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (42, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (43, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (44, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (45, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (46, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (47, 23, 11.2700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (48, 23, 10.5300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (49, 23, 11.0300)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (50, 23, 12.8400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (51, 23, 11.1400)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (52, 23, 10.1700)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (53, 23, 18.6600)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (54, 23, 12.4000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (55, 23, 5.7200)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (56, 23, 15.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (57, 23, 1.0000)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (58, 23, 12.6800)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (59, 23, 13.3900)
INSERT [ClubeVideo].[PRECO_ARTIGO] ([Cod_artigo], [Cod_lista_precos], [Preco]) VALUES (60, 23, 1.0000)
SET IDENTITY_INSERT [ClubeVideo].[Produto] ON 

INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (1, 1, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (4, 1, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (62, 1, 15, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (104, 1, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (105, 1, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (106, 1, 1, 3)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (107, 1, 1, 3)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (108, 1, 5, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (109, 1, 5, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (110, 1, 13, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (111, 1, 13, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (112, 1, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (113, 1, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (114, 1, 22, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (115, 1, 22, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (116, 1, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (117, 1, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (118, 1, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (119, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (120, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (121, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (122, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (123, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (124, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (125, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (126, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (127, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (128, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (129, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (130, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (131, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (132, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (133, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (134, 1, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (171, 1, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (172, 1, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (173, 1, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (174, 1, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (211, 1, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (212, 1, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (213, 1, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (214, 1, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (251, 1, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (252, 1, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (253, 1, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (254, 1, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (2, 2, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (15, 2, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (135, 2, 1, 3)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (136, 2, 1, 3)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (137, 2, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (138, 2, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (175, 2, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (176, 2, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (177, 2, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (178, 2, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (215, 2, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (216, 2, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (217, 2, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (218, 2, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (255, 2, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (256, 2, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (257, 2, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (258, 2, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (291, 2, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (292, 2, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (293, 2, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (3, 3, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (38, 3, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (139, 3, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (140, 3, 1, 2)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (141, 3, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (142, 3, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (179, 3, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (180, 3, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (181, 3, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (182, 3, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (219, 3, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (220, 3, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (221, 3, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (222, 3, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (259, 3, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (260, 3, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (261, 3, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (262, 3, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (27, 4, 8, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (49, 4, 12, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (143, 4, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (144, 4, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (145, 4, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (146, 4, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (183, 4, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (184, 4, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (185, 4, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (186, 4, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (223, 4, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (224, 4, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (225, 4, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (226, 4, 3, 1)
GO
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (263, 4, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (264, 4, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (265, 4, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (266, 4, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (31, 5, 37, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (147, 5, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (148, 5, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (149, 5, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (150, 5, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (187, 5, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (188, 5, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (189, 5, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (190, 5, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (227, 5, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (228, 5, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (229, 5, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (230, 5, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (267, 5, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (268, 5, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (269, 5, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (270, 5, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (151, 6, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (152, 6, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (153, 6, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (154, 6, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (191, 6, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (192, 6, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (193, 6, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (194, 6, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (231, 6, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (232, 6, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (233, 6, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (234, 6, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (271, 6, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (272, 6, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (273, 6, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (274, 6, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (40, 7, 38, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (56, 7, 16, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (64, 7, 13, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (155, 7, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (156, 7, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (157, 7, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (158, 7, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (195, 7, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (196, 7, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (197, 7, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (198, 7, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (235, 7, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (236, 7, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (237, 7, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (238, 7, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (275, 7, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (276, 7, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (277, 7, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (278, 7, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (159, 8, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (160, 8, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (161, 8, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (162, 8, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (199, 8, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (200, 8, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (201, 8, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (202, 8, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (239, 8, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (240, 8, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (241, 8, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (242, 8, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (279, 8, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (280, 8, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (281, 8, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (282, 8, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (46, 9, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (55, 9, 35, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (163, 9, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (164, 9, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (165, 9, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (166, 9, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (203, 9, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (204, 9, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (205, 9, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (206, 9, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (243, 9, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (244, 9, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (245, 9, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (246, 9, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (283, 9, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (284, 9, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (285, 9, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (286, 9, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (30, 10, 26, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (83, 10, 21, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (167, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (168, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (169, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (170, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (207, 10, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (208, 10, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (209, 10, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (210, 10, 2, 1)
GO
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (247, 10, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (248, 10, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (249, 10, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (250, 10, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (287, 10, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (288, 10, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (289, 10, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (290, 10, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (294, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (295, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (296, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (297, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (298, 10, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (12, 11, 23, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (21, 11, 31, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (35, 11, 38, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (299, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (300, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (301, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (302, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (303, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (304, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (305, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (306, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (307, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (308, 11, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (42, 12, 30, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (309, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (310, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (311, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (312, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (313, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (314, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (315, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (316, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (317, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (318, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (319, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (320, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (321, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (322, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (323, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (324, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (325, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (326, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (327, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (328, 12, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (10, 13, 9, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (329, 13, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (330, 13, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (331, 13, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (332, 13, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (333, 13, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (41, 14, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (65, 14, 33, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (67, 14, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (11, 16, 5, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (25, 16, 10, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (50, 16, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (334, 16, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (335, 16, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (53, 17, 36, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (98, 17, 5, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (7, 18, 35, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (99, 18, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (47, 19, 8, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (336, 19, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (337, 19, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (338, 19, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (339, 19, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (340, 19, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (22, 20, 28, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (26, 20, 20, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (6, 21, 8, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (28, 21, 35, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (92, 21, 13, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (24, 22, 33, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (78, 22, 25, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (79, 22, 11, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (101, 22, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (69, 23, 35, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (88, 24, 37, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (34, 25, 13, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (66, 25, 20, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (96, 25, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (33, 26, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (72, 26, 30, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (48, 27, 9, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (58, 27, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (74, 27, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (90, 27, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (16, 28, 35, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (23, 28, 35, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (43, 28, 38, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (51, 28, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (76, 28, 4, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (82, 28, 25, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (68, 29, 7, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (70, 29, 23, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (80, 29, 16, 1)
GO
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (86, 29, 1, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (87, 29, 8, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (37, 31, 27, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (60, 35, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (91, 35, 32, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (100, 36, 36, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (57, 37, 9, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (103, 37, 28, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (45, 38, 32, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (61, 38, 33, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (52, 39, 12, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (85, 39, 34, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (89, 40, 3, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (18, 42, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (73, 42, 30, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (77, 42, 31, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (94, 43, 34, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (32, 44, 2, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (84, 44, 11, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (17, 45, 39, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (59, 45, 38, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (75, 45, 17, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (102, 45, 25, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (39, 46, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (19, 47, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (81, 47, 26, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (93, 47, 18, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (97, 47, 14, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (95, 48, 5, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (44, 49, 23, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (63, 49, 36, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (5, 50, 36, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (13, 50, 23, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (14, 51, 19, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (20, 51, 21, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (29, 52, 28, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (9, 53, 15, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (36, 57, 17, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (54, 58, 15, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (8, 59, 29, 1)
INSERT [ClubeVideo].[Produto] ([nProduto], [artigo], [loja], [disponibilidade]) VALUES (71, 59, 18, 1)
SET IDENTITY_INSERT [ClubeVideo].[Produto] OFF
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (131, 1, 1, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (132, 1, 1, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (133, 1, 1, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (134, 1, 1, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (135, 2, 2, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (136, 2, 2, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (137, 2, 2, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (138, 2, 2, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (139, 3, 3, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (140, 3, 3, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (141, 3, 3, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (142, 3, 3, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (143, 4, 4, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (144, 4, 4, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (145, 4, 4, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (146, 4, 4, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (147, 5, 5, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (148, 5, 5, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (149, 5, 5, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (150, 5, 5, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (151, 6, 6, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (152, 6, 6, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (153, 6, 6, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (154, 6, 6, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (155, 7, 7, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (156, 7, 7, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (157, 7, 7, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (158, 7, 7, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (159, 8, 8, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (160, 8, 8, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (161, 8, 8, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (162, 8, 8, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (163, 9, 9, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (164, 9, 9, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (165, 9, 9, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (166, 9, 9, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (167, 10, 10, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (168, 10, 10, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (169, 10, 10, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (170, 10, 10, 54, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (171, 1, 1, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (172, 1, 1, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (173, 1, 1, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (174, 1, 1, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (175, 2, 2, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (176, 2, 2, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (177, 2, 2, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (178, 2, 2, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (179, 3, 3, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (180, 3, 3, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (181, 3, 3, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (182, 3, 3, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (183, 4, 4, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (184, 4, 4, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (185, 4, 4, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (186, 4, 4, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (187, 5, 5, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (188, 5, 5, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (189, 5, 5, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (190, 5, 5, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (191, 6, 6, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (192, 6, 6, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (193, 6, 6, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (194, 6, 6, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (195, 7, 7, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (196, 7, 7, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (197, 7, 7, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (198, 7, 7, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (199, 8, 8, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (200, 8, 8, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (201, 8, 8, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (202, 8, 8, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (203, 9, 9, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (204, 9, 9, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (205, 9, 9, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (206, 9, 9, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (207, 10, 10, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (208, 10, 10, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (209, 10, 10, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (210, 10, 10, 55, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (211, 1, 1, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (212, 1, 1, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (213, 1, 1, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (214, 1, 1, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (215, 2, 2, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (216, 2, 2, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (217, 2, 2, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (218, 2, 2, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (219, 3, 3, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (220, 3, 3, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (221, 3, 3, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (222, 3, 3, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (223, 4, 4, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (224, 4, 4, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (225, 4, 4, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (226, 4, 4, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (227, 5, 5, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (228, 5, 5, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (229, 5, 5, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (230, 5, 5, 56, 1, 1, NULL)
GO
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (231, 6, 6, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (232, 6, 6, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (233, 6, 6, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (234, 6, 6, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (235, 7, 7, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (236, 7, 7, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (237, 7, 7, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (238, 7, 7, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (239, 8, 8, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (240, 8, 8, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (241, 8, 8, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (242, 8, 8, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (243, 9, 9, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (244, 9, 9, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (245, 9, 9, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (246, 9, 9, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (247, 10, 10, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (248, 10, 10, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (249, 10, 10, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (250, 10, 10, 56, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (251, 1, 1, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (252, 1, 1, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (253, 1, 1, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (254, 1, 1, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (255, 2, 2, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (256, 2, 2, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (257, 2, 2, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (258, 2, 2, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (259, 3, 3, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (260, 3, 3, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (261, 3, 3, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (262, 3, 3, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (263, 4, 4, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (264, 4, 4, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (265, 4, 4, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (266, 4, 4, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (267, 5, 5, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (268, 5, 5, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (269, 5, 5, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (270, 5, 5, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (271, 6, 6, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (272, 6, 6, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (273, 6, 6, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (274, 6, 6, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (275, 7, 7, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (276, 7, 7, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (277, 7, 7, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (278, 7, 7, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (279, 8, 8, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (280, 8, 8, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (281, 8, 8, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (282, 8, 8, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (283, 9, 9, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (284, 9, 9, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (285, 9, 9, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (286, 9, 9, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (287, 10, 10, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (288, 10, 10, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (289, 10, 10, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (290, 10, 10, 57, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (291, 2, 1, 63, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (292, 2, 1, 63, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (293, 2, 1, 64, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (294, 10, 1, 65, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (295, 10, 1, 65, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (296, 10, 1, 65, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (297, 10, 1, 65, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (298, 10, 1, 65, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (299, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (300, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (301, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (302, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (303, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (304, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (305, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (306, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (307, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (308, 11, 1, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (309, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (310, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (311, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (312, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (313, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (314, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (315, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (316, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (317, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (318, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (319, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (320, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (321, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (322, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (323, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (324, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (325, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (326, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (327, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (328, 12, 2, 66, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (329, 13, 1, 67, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (330, 13, 1, 67, 1, 1, NULL)
GO
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (331, 13, 1, 67, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (332, 13, 1, 67, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (333, 13, 1, 67, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (334, 16, 2, 67, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (335, 16, 2, 67, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (336, 19, 1, 68, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (337, 19, 1, 68, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (338, 19, 1, 68, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (339, 19, 1, 68, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (340, 19, 1, 68, 1, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (1, 1, 1, 60, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (3, 3, 1, 62, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (139, 3, 1, 62, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (140, 3, 1, 62, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (4, 1, 1, 71, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (104, 1, 1, 71, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (105, 1, 1, 71, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (116, 1, 1, 74, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (117, 1, 1, 74, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (118, 1, 1, 74, 2, 1, NULL)
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (106, 1, 1, 73, 4, 1, CAST(N'2020-01-20' AS Date))
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (107, 1, 1, 73, 4, 1, CAST(N'2020-01-20' AS Date))
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (135, 2, 1, 75, 4, 1, CAST(N'2020-01-29' AS Date))
INSERT [ClubeVideo].[Produto_LinhaDocumento] ([produto], [artigo], [linha], [documento], [tipoDoc], [empresa], [dataDevolucao]) VALUES (136, 2, 1, 75, 4, 1, CAST(N'2020-01-29' AS Date))
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (11200, N'Diretor geral e gestor executivo, de empresas', 1)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (12110, N'Diretor financeiro', 1)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (12120, N'Diretor de recursos humanos', 1)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (12211, N'Diretor de vendas', 1)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (12212, N'Diretor de marketing', 1)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (12221, N'Diretor de publicidade', 1)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (33411, N'Chefe de escritório', 1)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (33412, N'Encarregado de armazém', 2)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (41100, N'Empregado de escritório em geral', 2)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (42290, N'Pessoal de receção e de informação a clientes', 2)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (43212, N'Empregado de armazém', 2)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (51510, N'Encarregado de limpeza', 3)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (52210, N'Operador de caixa', 2)
INSERT [ClubeVideo].[PROFISSAO] ([Cod_Profissao], [Descricao], [Cod_pertence]) VALUES (52220, N'Encarregado de loja', 2)
INSERT [ClubeVideo].[PROFISSAO_PERTENCE] ([Cod], [Descricao]) VALUES (1, N'Empresa')
INSERT [ClubeVideo].[PROFISSAO_PERTENCE] ([Cod], [Descricao]) VALUES (2, N'Loja')
INSERT [ClubeVideo].[PROFISSAO_PERTENCE] ([Cod], [Descricao]) VALUES (3, N'Outro')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (0, N'cliente')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (1, N'fornecedor')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (2, N'fornecedor imobilizado')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (3, N'consultor/assessor')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (4, N'devedor/credores diversos')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (5, N'comissionista')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (6, N'sindicato')
INSERT [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza], [Descricao]) VALUES (7, N'empréstimos')
INSERT [ClubeVideo].[SITUACAO] ([Cod_Situacao], [Descricao]) VALUES (0, N'Não definido')
INSERT [ClubeVideo].[SITUACAO] ([Cod_Situacao], [Descricao]) VALUES (1, N'Contrato permanente')
INSERT [ClubeVideo].[SITUACAO] ([Cod_Situacao], [Descricao]) VALUES (2, N'Contrato a termo certo')
INSERT [ClubeVideo].[SITUACAO] ([Cod_Situacao], [Descricao]) VALUES (3, N'Contrato a tempo indeterminado')
INSERT [ClubeVideo].[SITUACAO] ([Cod_Situacao], [Descricao]) VALUES (4, N'Despedido')
INSERT [ClubeVideo].[SITUACAO] ([Cod_Situacao], [Descricao]) VALUES (5, N'Outro')
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (1, 1, N'Morgan Potts', NULL, CAST(N'2020-02-18' AS Date), 0, N'207219863', N'223130572', 40, N'Morgan_Potts8537@yahoo.com', 4)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (2, 1, N'Darlene Lee', NULL, CAST(N'2020-05-11' AS Date), 0, N'497312429', N'594731143', 43, N'Darlene_Lee7748@guentu.biz', 3)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (3, 1, N'Rufus Cork', NULL, CAST(N'2020-05-04' AS Date), 0, N'175430249', N'778694136', 86, N'Rufus_Cork7369@nimogy.biz', 15)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (4, 1, N'Amelia Hunter', NULL, CAST(N'2020-01-16' AS Date), 0, N'202858324', N'139452023', 29, N'Amelia_Hunter592@gmail.com', 17)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (5, 1, N'Alex Bayliss', NULL, CAST(N'2020-05-09' AS Date), 0, N'654196339', N'610981449', 47, N'Alex_Bayliss1234@nanoff.biz', 4)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (6, 1, N'Emmanuelle Bell', NULL, CAST(N'2020-04-09' AS Date), 0, N'311776708', N'441168942', 26, N'Emmanuelle_Bell3670@gompie.com', 18)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (7, 1, N'Sebastian Ranks', NULL, CAST(N'2020-01-19' AS Date), 0, N'453875271', N'877996963', 54, N'Sebastian_Ranks3584@deons.tech', 12)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (8, 1, N'Lillian Parker', NULL, CAST(N'2020-01-06' AS Date), 0, N'953131699', N'144016299', 82, N'Lillian_Parker513@irrepsy.com', 11)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (9, 1, N'Harry Stone', NULL, CAST(N'2020-02-21' AS Date), 0, N'355013320', N'134812800', 51, N'Harry_Stone 995@muall.tech', 18)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (10, 1, N'Eileen Snow', NULL, CAST(N'2020-04-25' AS Date), 0, N'395024127', N'887242379', 11, N'Eileen_Snow5653@elnee.tech', 2)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (11, 1, N'Ryan Cann', NULL, CAST(N'2020-02-20' AS Date), 0, N'176922034', N'292525428', 98, N'Ryan_Cann3710@deavo.com', 21)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (12, 1, N'Florence Wild', NULL, CAST(N'2020-04-04' AS Date), 0, N'872680209', N'283395072', 15, N'Florence_Wild593@yahoo.com', 11)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (13, 1, N'Joyce Alcroft', NULL, CAST(N'2020-02-04' AS Date), 0, N'533004041', N'409118842', 54, N'Joyce_Alcroft2300@atink.com', 13)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (14, 1, N'Ron Butler', NULL, CAST(N'2020-02-20' AS Date), 0, N'620787360', N'278196096', 17, N'Ron_Butler9163@elnee.tech', 4)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (15, 1, N'Thea Porter', NULL, CAST(N'2020-04-15' AS Date), 0, N'952296720', N'136837012', 48, N'Thea_Porter469@supunk.biz', 7)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (16, 1, N'Ron Pierce', NULL, CAST(N'2020-01-28' AS Date), 0, N'902962587', N'646930194', 95, N'Ron_Pierce5217@supunk.biz', 1)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (17, 1, N'Nathan Silva', NULL, CAST(N'2020-02-11' AS Date), 0, N'125364830', N'985703597', 7, N'Nathan_Silva2124@mafthy.com', 7)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (18, 1, N'Johnny Rixon', NULL, CAST(N'2020-03-30' AS Date), 0, N'469756602', N'755519634', 37, N'Johnny_Rixon3189@gmail.com', 3)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (19, 1, N'Gabriel Mcleod', NULL, CAST(N'2020-01-09' AS Date), 0, N'872407178', N'468491954', 65, N'Gabriel_Mcleod2641@famism.biz', 5)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (20, 1, N'Helen Thornton', NULL, CAST(N'2020-04-23' AS Date), 0, N'513463229', N'460445748', 18, N'Helen_Thornton1463@bauros.biz', 12)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (21, 1, N'Harry Nanton', NULL, CAST(N'2020-03-02' AS Date), 0, N'359726571', N'115300769', 81, N'Harry_Nanton2251@vetan.org', 5)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (22, 1, N'Kurt Rust', NULL, CAST(N'2020-04-17' AS Date), 0, N'293947296', N'971553112', 11, N'Kurt_Rust2542@infotech44.tech', 14)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (23, 1, N'Tony Butler', NULL, CAST(N'2020-04-22' AS Date), 0, N'446024372', N'667591898', 47, N'Tony_Butler4059@dionrab.com', 17)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (24, 1, N'Lana Pearson', NULL, CAST(N'2020-03-18' AS Date), 0, N'175311603', N'687297874', 27, N'Lana_Pearson89@dionrab.com', 10)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (25, 1, N'Logan Ballard', NULL, CAST(N'2020-03-05' AS Date), 0, N'128289073', N'883444841', 25, N'Logan_Ballard1682@muall.tech', 3)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (26, 1, N'Cedrick Harper', NULL, CAST(N'2020-01-18' AS Date), 0, N'533245578', N'509931861', 83, N'Cedrick_Harper1217@kideod.biz', 3)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (27, 1, N'Cedrick Mcnally', NULL, CAST(N'2020-04-07' AS Date), 0, N'725395848', N'468606060', 72, N'Cedrick_Mcnally5976@womeona.net', 14)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (28, 1, N'Peter Umney', NULL, CAST(N'2020-01-12' AS Date), 0, N'908107595', N'135379765', 10, N'Peter_Umney3776@supunk.biz', 21)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (29, 1, N'Fiona Clifton', NULL, CAST(N'2020-01-19' AS Date), 0, N'338155405', N'414262760', 49, N'Fiona_Clifton2653@twace.org', 16)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (30, 1, N'Abbey Larkin', NULL, CAST(N'2020-03-21' AS Date), 0, N'545184546', N'571033940', 86, N'Abbey_Larkin9462@jiman.org', 14)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (31, 1, N'CarMax', NULL, CAST(N'2020-03-31' AS Date), 3, N'754374362', N'389318011', 20, N'Joseph_Baker1944164504@bauros.biz', 19)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (32, 1, N'Vodafone', NULL, CAST(N'2020-03-13' AS Date), 6, N'612728637', N'292896235', 15, N'Gemma_London1723294004@womeona.net', 15)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (33, 1, N'Demaco', 47630, CAST(N'2020-03-17' AS Date), 2, N'886721800', N'661637724', 3, N'John_Uttridge439373068@irrepsy.com', 7)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (34, 1, N'AECOM', NULL, CAST(N'2020-05-22' AS Date), 5, N'838198435', N'397155812', 35, N'Jackeline_Powell1114529310@nickia.com', 2)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (35, 1, N'Team Guard SRL', 47630, CAST(N'2020-01-31' AS Date), 2, N'251691789', N'716521252', 19, N'Vivian_Brock20895281@nimogy.biz', 6)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (36, 1, N'Coca-Cola Company', NULL, CAST(N'2020-04-22' AS Date), 5, N'294846026', N'697020773', 91, N'Karla_Shaw225590503@acrit.org', 5)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (37, 1, N'Global Print', NULL, CAST(N'2020-04-03' AS Date), 5, N'234515537', N'995440064', 86, N'Gil_Ulyatt688146109@nickia.com', 14)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (38, 1, N'Facebook', NULL, CAST(N'2020-03-09' AS Date), 3, N'548192886', N'616752899', NULL, N'Karen_Windsor1245486510@hourpy.biz', 9)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (39, 1, N'Metro Cash&Carry', 47430, CAST(N'2020-03-18' AS Date), 1, N'298787685', N'905807918', 77, N'Joseph_Stone 736400947@eirey.tech', 16)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (40, 1, N'21st Century Fox', NULL, CAST(N'2020-05-22' AS Date), 3, N'663188469', N'459499959', 81, N'Adina_Burge496619501@supunk.biz', 4)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (41, 1, N'Team Guard SRL', 47630, CAST(N'2020-04-10' AS Date), 2, N'267739028', N'104394124', 34, N'Alan_Russell1031615880@bauros.biz', 3)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (42, 1, N'CarMax', NULL, CAST(N'2020-04-08' AS Date), 3, N'563695120', N'627648697', 68, N'Martin_Patel1029947647@irrepsy.com', 14)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (43, 1, N'Boeing', NULL, CAST(N'2020-03-25' AS Date), 5, N'600623405', N'961101900', 87, N'Laila_Rosenbloom1973668086@dionrab.com', 12)
INSERT [ClubeVideo].[TERCEIRO] ([Cod_terceiro], [Cod_empresa], [Nome_terceiro], [CAE], [Data_c_registo], [Cod_relacao_ter_emp], [Telefone], [NIF], [Cod_morada], [E_mail], [Cod_lista_precos]) VALUES (44, 1, N'Metro Cash&Carry', 47630, CAST(N'2020-04-03' AS Date), 2, N'429318653', N'848218305', 99, N'Owen_Mooney1128020791@zorer.org', 13)
INSERT [ClubeVideo].[TipoDocumento] ([nTipoDoc], [empresa], [descricao]) VALUES (1, 1, N'Entrada de produtos')
INSERT [ClubeVideo].[TipoDocumento] ([nTipoDoc], [empresa], [descricao]) VALUES (2, 1, N'Fatura')
INSERT [ClubeVideo].[TipoDocumento] ([nTipoDoc], [empresa], [descricao]) VALUES (3, 1, N'Nota de Crédito')
INSERT [ClubeVideo].[TipoDocumento] ([nTipoDoc], [empresa], [descricao]) VALUES (4, 1, N'Aluguer')
INSERT [ClubeVideo].[TipoDocumento] ([nTipoDoc], [empresa], [descricao]) VALUES (5, 1, N'Entrega de Aluguer')
INSERT [ClubeVideo].[TipoDocumento] ([nTipoDoc], [empresa], [descricao]) VALUES (6, 1, N'Término de aluguer por compra')
INSERT [ClubeVideo].[TipoIVA] ([nIVA], [percentagem], [descricao]) VALUES (1, 23, N'normal')
INSERT [ClubeVideo].[TipoIVA] ([nIVA], [percentagem], [descricao]) VALUES (2, 12, N'intermedio')
INSERT [ClubeVideo].[TipoIVA] ([nIVA], [percentagem], [descricao]) VALUES (3, 6, N'reduzido')
INSERT [ClubeVideo].[TipoIVA] ([nIVA], [percentagem], [descricao]) VALUES (4, 0, N'sem IVA')
INSERT [ClubeVideo].[TipoStock] ([nStock], [descricao]) VALUES (1, N'simples')
INSERT [ClubeVideo].[TipoStock] ([nStock], [descricao]) VALUES (2, N'não movimenta stocks (ex.: caução, desconto)')
INSERT [ClubeVideo].[TipoStock] ([nStock], [descricao]) VALUES (3, N'serviços')
SET ANSI_PADDING ON
GO
/****** Object:  Index [NOMEUNICO]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[Artigo] ADD  CONSTRAINT [NOMEUNICO] UNIQUE NONCLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Empresa__2A16D97FFD439E55]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[Empresa] ADD UNIQUE NONCLUSTERED 
(
	[telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Empresa__C7DEC330872346D5]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[Empresa] ADD UNIQUE NONCLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Empresa__FA8E9C162362185C]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[Empresa] ADD UNIQUE NONCLUSTERED 
(
	[endEletronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__FUNCIONA__31660442D5EAFD59]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[FUNCIONARIO] ADD UNIQUE NONCLUSTERED 
(
	[E_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__FUNCIONA__6A83993CF86A374B]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[FUNCIONARIO] ADD UNIQUE NONCLUSTERED 
(
	[No_doc_identificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__FUNCIONA__C7DEC330288E43AD]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[FUNCIONARIO] ADD UNIQUE NONCLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__FUNCIONA__CD2924D54E20FD00]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[FUNCIONARIO] ADD UNIQUE NONCLUSTERED 
(
	[Telemovel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Funcionario]    Script Date: 11/06/2020 15:42:54 ******/
CREATE NONCLUSTERED INDEX [idx_Funcionario] ON [ClubeVideo].[FUNCIONARIO]
(
	[Cod_empresa] ASC,
	[Nome_Funcionario] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 85) ON [PRIMARY]
GO
/****** Object:  Index [idx_ListaPrecos]    Script Date: 11/06/2020 15:42:54 ******/
CREATE NONCLUSTERED INDEX [idx_ListaPrecos] ON [ClubeVideo].[LISTA_PRECOS]
(
	[Cod_empresa] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 85) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LOJA__31660442EE521B05]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[LOJA] ADD UNIQUE NONCLUSTERED 
(
	[E_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LOJA__4EC504B61746E481]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[LOJA] ADD UNIQUE NONCLUSTERED 
(
	[Telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Loja]    Script Date: 11/06/2020 15:42:54 ******/
CREATE NONCLUSTERED INDEX [idx_Loja] ON [ClubeVideo].[LOJA]
(
	[Cod_empresa] ASC,
	[ativa] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [idx_Produto]    Script Date: 11/06/2020 15:42:54 ******/
CREATE NONCLUSTERED INDEX [idx_Produto] ON [ClubeVideo].[Produto]
(
	[loja] ASC,
	[artigo] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 65) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TERCEIRO__31660442942A7091]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[TERCEIRO] ADD UNIQUE NONCLUSTERED 
(
	[E_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TERCEIRO__4EC504B69997F513]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[TERCEIRO] ADD UNIQUE NONCLUSTERED 
(
	[Telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TERCEIRO__C7DEC330D918E690]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[TERCEIRO] ADD UNIQUE NONCLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__TipoIVA__037916C62D8F6CF4]    Script Date: 11/06/2020 15:42:54 ******/
ALTER TABLE [ClubeVideo].[TipoIVA] ADD UNIQUE NONCLUSTERED 
(
	[percentagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [ClubeVideo].[Artigo] ADD  DEFAULT ((1)) FOR [IVA]
GO
ALTER TABLE [ClubeVideo].[Artigo] ADD  DEFAULT ((1)) FOR [stock]
GO
ALTER TABLE [ClubeVideo].[Artigo] ADD  DEFAULT ((0)) FOR [quantStock]
GO
ALTER TABLE [ClubeVideo].[Artigo] ADD  DEFAULT ((0)) FOR [quantDispLojas]
GO
ALTER TABLE [ClubeVideo].[Artigo] ADD  DEFAULT ((0)) FOR [quantAlugLojas]
GO
ALTER TABLE [ClubeVideo].[Artigo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [ClubeVideo].[Documento] ADD  DEFAULT (NULL) FOR [valorTotal]
GO
ALTER TABLE [ClubeVideo].[Documento] ADD  DEFAULT (NULL) FOR [valorTotalIVA]
GO
ALTER TABLE [ClubeVideo].[Documento] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] ADD  DEFAULT ((0)) FOR [desconto]
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [ClubeVideo].[LOJA] ADD  DEFAULT ((1)) FOR [ativa]
GO
ALTER TABLE [ClubeVideo].[Produto] ADD  DEFAULT ((1)) FOR [disponibilidade]
GO
ALTER TABLE [ClubeVideo].[Produto_LinhaDocumento] ADD  DEFAULT (NULL) FOR [dataDevolucao]
GO
ALTER TABLE [ClubeVideo].[Artigo]  WITH CHECK ADD  CONSTRAINT [FKIVA] FOREIGN KEY([IVA])
REFERENCES [ClubeVideo].[TipoIVA] ([nIVA])
ON DELETE SET DEFAULT
GO
ALTER TABLE [ClubeVideo].[Artigo] CHECK CONSTRAINT [FKIVA]
GO
ALTER TABLE [ClubeVideo].[Artigo]  WITH CHECK ADD  CONSTRAINT [FKSTOCK] FOREIGN KEY([stock])
REFERENCES [ClubeVideo].[TipoStock] ([nStock])
ON DELETE SET DEFAULT
GO
ALTER TABLE [ClubeVideo].[Artigo] CHECK CONSTRAINT [FKSTOCK]
GO
ALTER TABLE [ClubeVideo].[Documento]  WITH CHECK ADD  CONSTRAINT [FKEMPRESADOC] FOREIGN KEY([empresa], [tipoDoc])
REFERENCES [ClubeVideo].[TipoDocumento] ([empresa], [nTipoDoc])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Documento] CHECK CONSTRAINT [FKEMPRESADOC]
GO
ALTER TABLE [ClubeVideo].[Documento]  WITH CHECK ADD  CONSTRAINT [FKENDERECOENTDOC] FOREIGN KEY([endEntrega])
REFERENCES [ClubeVideo].[Endereco] ([nEndereco])
GO
ALTER TABLE [ClubeVideo].[Documento] CHECK CONSTRAINT [FKENDERECOENTDOC]
GO
ALTER TABLE [ClubeVideo].[Documento]  WITH CHECK ADD  CONSTRAINT [FKENDERECOFACDOC] FOREIGN KEY([endFaturacao])
REFERENCES [ClubeVideo].[Endereco] ([nEndereco])
GO
ALTER TABLE [ClubeVideo].[Documento] CHECK CONSTRAINT [FKENDERECOFACDOC]
GO
ALTER TABLE [ClubeVideo].[Documento]  WITH CHECK ADD  CONSTRAINT [FKEXPEDICAODOC] FOREIGN KEY([fExpedicao])
REFERENCES [ClubeVideo].[Expedicao] ([nExpedicao])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Documento] CHECK CONSTRAINT [FKEXPEDICAODOC]
GO
ALTER TABLE [ClubeVideo].[Documento]  WITH CHECK ADD  CONSTRAINT [FKLOJADOC] FOREIGN KEY([loja])
REFERENCES [ClubeVideo].[LOJA] ([Cod_loja])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Documento] CHECK CONSTRAINT [FKLOJADOC]
GO
ALTER TABLE [ClubeVideo].[Documento]  WITH CHECK ADD  CONSTRAINT [FKTERCEIRODOC] FOREIGN KEY([terceiro])
REFERENCES [ClubeVideo].[TERCEIRO] ([Cod_terceiro])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Documento] CHECK CONSTRAINT [FKTERCEIRODOC]
GO
ALTER TABLE [ClubeVideo].[Documento]  WITH CHECK ADD  CONSTRAINT [FKVENDEDORDOC] FOREIGN KEY([nVendedor])
REFERENCES [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Documento] CHECK CONSTRAINT [FKVENDEDORDOC]
GO
ALTER TABLE [ClubeVideo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FKENDERECOEMP] FOREIGN KEY([Cod_endereco])
REFERENCES [ClubeVideo].[Endereco] ([nEndereco])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[Empresa] CHECK CONSTRAINT [FKENDERECOEMP]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FKEMPRESA] FOREIGN KEY([Cod_empresa])
REFERENCES [ClubeVideo].[Empresa] ([nEmpresa])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [FKEMPRESA]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FKENDERECO] FOREIGN KEY([Cod_endereco])
REFERENCES [ClubeVideo].[Endereco] ([nEndereco])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [FKENDERECO]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FKPAGAMENTO] FOREIGN KEY([Cod_tipo_pagamento])
REFERENCES [ClubeVideo].[PAGAMENTO] ([Cod_Pagamento])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [FKPAGAMENTO]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FKPROFISSAO] FOREIGN KEY([Cod_profissao])
REFERENCES [ClubeVideo].[PROFISSAO] ([Cod_Profissao])
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [FKPROFISSAO]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FKSITUACAO] FOREIGN KEY([Cod_Situacao])
REFERENCES [ClubeVideo].[SITUACAO] ([Cod_Situacao])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [FKSITUACAO]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIOS_EM_LOJAS]  WITH CHECK ADD  CONSTRAINT [FKFUNCIONARIOFUNC] FOREIGN KEY([Cod_funcionario])
REFERENCES [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] CHECK CONSTRAINT [FKFUNCIONARIOFUNC]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIOS_EM_LOJAS]  WITH CHECK ADD  CONSTRAINT [FKLOJAFUNC] FOREIGN KEY([Cod_loja])
REFERENCES [ClubeVideo].[LOJA] ([Cod_loja])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIOS_EM_LOJAS] CHECK CONSTRAINT [FKLOJAFUNC]
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento]  WITH CHECK ADD  CONSTRAINT [FKARTIGOLINHA] FOREIGN KEY([artigo])
REFERENCES [ClubeVideo].[Artigo] ([nArtigo])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] CHECK CONSTRAINT [FKARTIGOLINHA]
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento]  WITH CHECK ADD  CONSTRAINT [FKDOCUMENTOLINHA] FOREIGN KEY([empresa], [tipoDoc], [documento])
REFERENCES [ClubeVideo].[Documento] ([empresa], [tipoDoc], [nDocumento])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] CHECK CONSTRAINT [FKDOCUMENTOLINHA]
GO
ALTER TABLE [ClubeVideo].[LISTA_PRECOS]  WITH CHECK ADD  CONSTRAINT [FKEMPRESALPRECOS] FOREIGN KEY([Cod_empresa])
REFERENCES [ClubeVideo].[Empresa] ([nEmpresa])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[LISTA_PRECOS] CHECK CONSTRAINT [FKEMPRESALPRECOS]
GO
ALTER TABLE [ClubeVideo].[Login]  WITH CHECK ADD  CONSTRAINT [FKCODFUNCIONARIOLOGIN] FOREIGN KEY([Cod_func])
REFERENCES [ClubeVideo].[FUNCIONARIO] ([Cod_Funcionario])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Login] CHECK CONSTRAINT [FKCODFUNCIONARIOLOGIN]
GO
ALTER TABLE [ClubeVideo].[LOJA]  WITH CHECK ADD  CONSTRAINT [FKEMPRESALOJA] FOREIGN KEY([Cod_empresa])
REFERENCES [ClubeVideo].[Empresa] ([nEmpresa])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[LOJA] CHECK CONSTRAINT [FKEMPRESALOJA]
GO
ALTER TABLE [ClubeVideo].[LOJA]  WITH CHECK ADD  CONSTRAINT [FKENDERECOLOJA] FOREIGN KEY([Cod_endereco])
REFERENCES [ClubeVideo].[Endereco] ([nEndereco])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[LOJA] CHECK CONSTRAINT [FKENDERECOLOJA]
GO
ALTER TABLE [ClubeVideo].[PRECO_ARTIGO]  WITH CHECK ADD  CONSTRAINT [FKARTIGOPRECO] FOREIGN KEY([Cod_artigo])
REFERENCES [ClubeVideo].[Artigo] ([nArtigo])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[PRECO_ARTIGO] CHECK CONSTRAINT [FKARTIGOPRECO]
GO
ALTER TABLE [ClubeVideo].[PRECO_ARTIGO]  WITH CHECK ADD  CONSTRAINT [FKLISTAPRECOSPRECO] FOREIGN KEY([Cod_lista_precos])
REFERENCES [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[PRECO_ARTIGO] CHECK CONSTRAINT [FKLISTAPRECOSPRECO]
GO
ALTER TABLE [ClubeVideo].[Produto]  WITH CHECK ADD  CONSTRAINT [FKARTIGOPROD] FOREIGN KEY([artigo])
REFERENCES [ClubeVideo].[Artigo] ([nArtigo])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Produto] CHECK CONSTRAINT [FKARTIGOPROD]
GO
ALTER TABLE [ClubeVideo].[Produto]  WITH CHECK ADD  CONSTRAINT [FKDISPONIBILIDADE] FOREIGN KEY([disponibilidade])
REFERENCES [ClubeVideo].[Disponibilidade] ([nDisponibilidade])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[Produto] CHECK CONSTRAINT [FKDISPONIBILIDADE]
GO
ALTER TABLE [ClubeVideo].[Produto]  WITH CHECK ADD  CONSTRAINT [FKLOJAPROD] FOREIGN KEY([loja])
REFERENCES [ClubeVideo].[LOJA] ([Cod_loja])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Produto] CHECK CONSTRAINT [FKLOJAPROD]
GO
ALTER TABLE [ClubeVideo].[Produto_LinhaDocumento]  WITH CHECK ADD  CONSTRAINT [FKLINHAPROD] FOREIGN KEY([empresa], [tipoDoc], [documento], [linha])
REFERENCES [ClubeVideo].[LinhaDocumento] ([empresa], [tipoDoc], [documento], [nLinha])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[Produto_LinhaDocumento] CHECK CONSTRAINT [FKLINHAPROD]
GO
ALTER TABLE [ClubeVideo].[Produto_LinhaDocumento]  WITH CHECK ADD  CONSTRAINT [FKPRODUTOPROD] FOREIGN KEY([artigo], [produto])
REFERENCES [ClubeVideo].[Produto] ([artigo], [nProduto])
GO
ALTER TABLE [ClubeVideo].[Produto_LinhaDocumento] CHECK CONSTRAINT [FKPRODUTOPROD]
GO
ALTER TABLE [ClubeVideo].[PROFISSAO]  WITH CHECK ADD  CONSTRAINT [FKPERTENCE] FOREIGN KEY([Cod_pertence])
REFERENCES [ClubeVideo].[PROFISSAO_PERTENCE] ([Cod])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[PROFISSAO] CHECK CONSTRAINT [FKPERTENCE]
GO
ALTER TABLE [ClubeVideo].[TERCEIRO]  WITH CHECK ADD  CONSTRAINT [FKEMPTERCEIRO] FOREIGN KEY([Cod_empresa])
REFERENCES [ClubeVideo].[Empresa] ([nEmpresa])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[TERCEIRO] CHECK CONSTRAINT [FKEMPTERCEIRO]
GO
ALTER TABLE [ClubeVideo].[TERCEIRO]  WITH CHECK ADD  CONSTRAINT [FKENDERECOTER] FOREIGN KEY([Cod_morada])
REFERENCES [ClubeVideo].[Endereco] ([nEndereco])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[TERCEIRO] CHECK CONSTRAINT [FKENDERECOTER]
GO
ALTER TABLE [ClubeVideo].[TERCEIRO]  WITH CHECK ADD  CONSTRAINT [FKLISTAPRECOTERCEIRO] FOREIGN KEY([Cod_lista_precos])
REFERENCES [ClubeVideo].[LISTA_PRECOS] ([Cod_lista_precos])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[TERCEIRO] CHECK CONSTRAINT [FKLISTAPRECOTERCEIRO]
GO
ALTER TABLE [ClubeVideo].[TERCEIRO]  WITH CHECK ADD  CONSTRAINT [FKRELTEREMP] FOREIGN KEY([Cod_relacao_ter_emp])
REFERENCES [ClubeVideo].[RELACAO_TER_EMP] ([Cod_natureza])
ON DELETE SET NULL
GO
ALTER TABLE [ClubeVideo].[TERCEIRO] CHECK CONSTRAINT [FKRELTEREMP]
GO
ALTER TABLE [ClubeVideo].[TipoDocumento]  WITH CHECK ADD  CONSTRAINT [FKEMPRESATPDOC] FOREIGN KEY([empresa])
REFERENCES [ClubeVideo].[Empresa] ([nEmpresa])
ON DELETE CASCADE
GO
ALTER TABLE [ClubeVideo].[TipoDocumento] CHECK CONSTRAINT [FKEMPRESATPDOC]
GO
ALTER TABLE [ClubeVideo].[Artigo]  WITH CHECK ADD  CONSTRAINT [CHECKALOJAS] CHECK  (([quantAlugLojas]>=(0)))
GO
ALTER TABLE [ClubeVideo].[Artigo] CHECK CONSTRAINT [CHECKALOJAS]
GO
ALTER TABLE [ClubeVideo].[Artigo]  WITH CHECK ADD  CONSTRAINT [CHECKDLOJAS] CHECK  (([quantDispLojas]>=(0)))
GO
ALTER TABLE [ClubeVideo].[Artigo] CHECK CONSTRAINT [CHECKDLOJAS]
GO
ALTER TABLE [ClubeVideo].[Artigo]  WITH CHECK ADD  CONSTRAINT [CHECKSTOCKMAX] CHECK  (([stockMax]>=(0)))
GO
ALTER TABLE [ClubeVideo].[Artigo] CHECK CONSTRAINT [CHECKSTOCKMAX]
GO
ALTER TABLE [ClubeVideo].[Artigo]  WITH CHECK ADD  CONSTRAINT [CHECKSTOCKMIN] CHECK  (([stockMin]>=(0)))
GO
ALTER TABLE [ClubeVideo].[Artigo] CHECK CONSTRAINT [CHECKSTOCKMIN]
GO
ALTER TABLE [ClubeVideo].[Artigo]  WITH CHECK ADD  CONSTRAINT [CHECKSTOCKQT] CHECK  (([quantStock]>=(0)))
GO
ALTER TABLE [ClubeVideo].[Artigo] CHECK CONSTRAINT [CHECKSTOCKQT]
GO
ALTER TABLE [ClubeVideo].[Empresa]  WITH CHECK ADD  CONSTRAINT [CHECKANO] CHECK  ((len([ano])=(4)))
GO
ALTER TABLE [ClubeVideo].[Empresa] CHECK CONSTRAINT [CHECKANO]
GO
ALTER TABLE [ClubeVideo].[Empresa]  WITH CHECK ADD  CONSTRAINT [CHECKCAE] CHECK  (([CAE]>=(0) AND [CAE]<=(99999)))
GO
ALTER TABLE [ClubeVideo].[Empresa] CHECK CONSTRAINT [CHECKCAE]
GO
ALTER TABLE [ClubeVideo].[Empresa]  WITH CHECK ADD  CONSTRAINT [CHECKNIF] CHECK  ((len([NIF])=(9)))
GO
ALTER TABLE [ClubeVideo].[Empresa] CHECK CONSTRAINT [CHECKNIF]
GO
ALTER TABLE [ClubeVideo].[Empresa]  WITH CHECK ADD  CONSTRAINT [CHECKTELE] CHECK  ((len([telefone])=(9)))
GO
ALTER TABLE [ClubeVideo].[Empresa] CHECK CONSTRAINT [CHECKTELE]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [CHECKNIBFUN] CHECK  ((len([NIB])=(21)))
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [CHECKNIBFUN]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [CHECKNIFFUN] CHECK  ((len([NIF])=(9)))
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [CHECKNIFFUN]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [CHECKSEXOFUN] CHECK  (([Sexo]='F' OR [Sexo]='M'))
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [CHECKSEXOFUN]
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [CHECKTELEFUN] CHECK  ((len([Telemovel])=(9)))
GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] CHECK CONSTRAINT [CHECKTELEFUN]
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento]  WITH CHECK ADD  CONSTRAINT [CHECKDESCONTOLINHA] CHECK  (([desconto]>=(0) AND [desconto]<=(100)))
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] CHECK CONSTRAINT [CHECKDESCONTOLINHA]
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento]  WITH CHECK ADD  CONSTRAINT [CHECKIVALINHA] CHECK  (([taxaIVA]>=(0) AND [taxaIVA]<=(100)))
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] CHECK CONSTRAINT [CHECKIVALINHA]
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento]  WITH CHECK ADD  CONSTRAINT [CHECKQTLINHA] CHECK  (([quantidade]>(0)))
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] CHECK CONSTRAINT [CHECKQTLINHA]
GO
ALTER TABLE [ClubeVideo].[LOJA]  WITH CHECK ADD  CONSTRAINT [CHECKTELELOJA] CHECK  ((len([Telefone])=(9)))
GO
ALTER TABLE [ClubeVideo].[LOJA] CHECK CONSTRAINT [CHECKTELELOJA]
GO
ALTER TABLE [ClubeVideo].[TERCEIRO]  WITH CHECK ADD  CONSTRAINT [CHECKTELETERCEIRO] CHECK  ((len([Telefone])=(9)))
GO
ALTER TABLE [ClubeVideo].[TERCEIRO] CHECK CONSTRAINT [CHECKTELETERCEIRO]
GO
ALTER TABLE [ClubeVideo].[TipoIVA]  WITH CHECK ADD CHECK  (([percentagem]>=(0) AND [percentagem]<=(100)))
GO
/****** Object:  StoredProcedure [ClubeVideo].[aux]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[aux] (@Cod_lista_precos INT, @Descricao VARCHAR(100), @Cod_empresa INT)
AS
	--INSERT INTO ClubeVideo.LISTA_PRECOS VALUES 
	--(@Cod_lista_precos, @Descricao, @Cod_empresa);


	-- criar preços para todos os artigos

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
/****** Object:  StoredProcedure [ClubeVideo].[pr_ADICIONAR_LOGIN]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_ADICIONAR_LOGIN] @Cod_funcionario INT, @Passe NVARCHAR(50), @Msg_resposta NVARCHAR(250) = '' OUTPUT
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

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_Artigo]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Artigo] (@nArtigo INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_ArtigosListasPrecos_load]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_ArtigosListasPrecos_load] (@Cod_lista_precos INT) 
AS
	SELECT * FROM ClubeVideo.PRECO_ARTIGO WHERE Cod_lista_precos=@Cod_lista_precos;		
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_atualizarEmpresa]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_atualizarEmpresa] @nEmpresa INT = NULL, @sigla VARCHAR(10) = NULL, @descricao VARCHAR(90) = NULL,
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
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_criarEmpresa]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_criarEmpresa] @nEmpresa INT = NULL, @sigla VARCHAR(10) = NULL, @descricao VARCHAR(90) = NULL,
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
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_CriarEndereco]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_CriarEndereco] @nEndereco INT = null, @morada VARCHAR(20) = null, @codigoPostal VARCHAR(10) = null,
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

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_criarFuncionario]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_criarFuncionario] (@Cod_Funcionario INT, @Nome_Funcionario VARCHAR(40), @Data_Nascimento DATE, @Nacionalidade VARCHAR(30),
@Sexo VARCHAR(1), @Estado_Civil VARCHAR(20), @Telemovel VARCHAR(9), @E_mail VARCHAR(256), @Vencimento MONEY, @Data_Admissao DATE, @Cod_endereco INT, 
@Cod_Situacao INT, @Cod_profissao INT, @Cod_tipo_pagamento INT, @NIF VARCHAR(9), @NIB VARCHAR(21), @No_doc_identificacao VARCHAR(14), @Cod_empresa INT)
AS
	INSERT INTO ClubeVideo.FUNCIONARIO VALUES
	(@Cod_Funcionario, @Nome_Funcionario, @Data_Nascimento, @Nacionalidade, @Sexo, @Estado_Civil, @Telemovel, @E_mail, @Vencimento, 
	@Data_Admissao, @Cod_endereco, @Cod_Situacao, @Cod_profissao, @Cod_tipo_pagamento, @NIF, @NIB, @No_doc_identificacao, @Cod_empresa);

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_criarListasPrecos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_criarListasPrecos] (@Cod_lista_precos INT, @Descricao VARCHAR(100), @Cod_empresa INT)
AS
	INSERT INTO ClubeVideo.LISTA_PRECOS VALUES 
	(@Cod_lista_precos, @Descricao, @Cod_empresa);


	-- criar preços para todos os artigos

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
/****** Object:  StoredProcedure [ClubeVideo].[pr_DeleteDocumento]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_DeleteDocumento] (@nDocumento INT, @tipoDoc INT, @empresa INT)
AS
	DECLARE @estado AS BIT;
	SELECT @estado = estado
	FROM ClubeVideo.Documento
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@nDocumento;

	-- Só faz delete se o estado do documento = 0

	IF (@estado=1)
	BEGIN
		RAISERROR('O Documento não pode ser eliminado', 16, 1);
		return;
	END
	ELSE
		DELETE ClubeVideo.Documento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND nDocumento=@nDocumento;
		
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_deleteFuncionarioLoja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_deleteFuncionarioLoja] (@Cod_loja INT, @Cod_funcionario INT)
AS

	DELETE ClubeVideo.FUNCIONARIOS_EM_LOJAS 
	WHERE Cod_loja=@Cod_loja AND Cod_funcionario=@Cod_funcionario;
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_deleteLinha]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_deleteLinha] (@nLinha INT, @documento INT, @tipoDoc INT, @empresa INT)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;

	-- Não permitir DELETE da linha se estado do documento = 1
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_deleteProdutoLinha]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_deleteProdutoLinha] (@produto INT, @artigo INT, @linha INT, @documento INT, @tipoDoc INT, @empresa INT)
AS
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;

	-- Não permitir DELETE da linha se estado do documento = 1
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Disponibilidade]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ClubeVideo].[pr_Disponibilidade] (@nDisponibilidade INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Documentos_load]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Documentos_load] (@empresa INT, @loja INT, @nVendedor INT = null, @tipoDoc INT) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_EMPRESAOULOJA]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_EMPRESAOULOJA] @Cod_funcionario INT, @outputt INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	SET @outputt = -1;

	SELECT @outputt = Cod_pertence FROM ClubeVideo.PROFISSAO WHERE Cod_Profissao = (
		SELECT Cod_profissao FROM ClubeVideo.FUNCIONARIO WHERE Cod_Funcionario = @Cod_funcionario);
END

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_Expedicao]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Expedicao] (@nExpedicao INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Funcionario]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Funcionario] (@Cod_empresa INT, @Cod_Funcionario INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Funcionario_load]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Funcionario_load] (@Cod_loja INT = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_FuncionarioLojas_load]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_FuncionarioLojas_load] (@Cod_funcionario INT)
AS
	SELECT LL.Cod_loja, LL.Nome_loja, LL.E_mail, LL.Telefone, LL.Cod_endereco, LL.Cod_empresa, LL.ativa
	FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
	JOIN ClubeVideo.LOJA AS LL ON L.Cod_loja=LL.Cod_loja
	WHERE F.Cod_Funcionario=@Cod_funcionario;
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_FuncionarioNLojas_load]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_FuncionarioNLojas_load] (@Cod_funcionario INT)
AS

	SELECT LLL.Cod_loja, LLL.Nome_loja, LLL.E_mail, LLL.Telefone, LLL.Cod_endereco, LLL.Cod_empresa, LLL.ativa
	FROM ClubeVideo.LOJA AS LLL
	EXCEPT (SELECT LL.Cod_loja, LL.Nome_loja, LL.E_mail, LL.Telefone, LL.Cod_endereco, LL.Cod_empresa, LL.ativa
				FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
				JOIN ClubeVideo.LOJA AS LL ON L.Cod_loja=LL.Cod_loja
				WHERE F.Cod_Funcionario=@Cod_funcionario);
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_insertFuncionarioLoja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_insertFuncionarioLoja] (@Cod_loja INT, @Cod_funcionario INT)
AS

	INSERT INTO ClubeVideo.FUNCIONARIOS_EM_LOJAS VALUES 
	(@Cod_loja, @Cod_funcionario);
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_InsertInArtigos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_InsertInArtigos] @nArtigo INT = null, @nome VARCHAR(50) = null, @stockMin BIGINT = null, @stockMax BIGINT = null, @precoStock MONEY = null,
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

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_ListasPrecos_load]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_ListasPrecos_load] (@Cod_empresa INT) 
AS
	SELECT * FROM ClubeVideo.LISTA_PRECOS WHERE Cod_empresa=@Cod_empresa;		
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_Loja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Loja] (@Cod_empresa INT, @Cod_loja INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Lojas]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Lojas] (@Cod_empresa INT, @Cod_funcionario INT = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_NOMEEMPFUN]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_NOMEEMPFUN] @nrEmpresa INT, @nrFuncionario INT, @nomeEmpresa VARCHAR(30) OUTPUT, @nomeFuncionario VARCHAR(40) OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	SET @nomeEmpresa = 'Erro!! Empresa não existe na bd';
	SET @nomeFuncionario = 'Erro!! Funcionario não existe na bd';

	SELECT @nomeEmpresa = descricao FROM ClubeVideo.Empresa WHERE nEmpresa = @nrEmpresa;
	SELECT @nomeFuncionario = Nome_Funcionario FROM ClubeVideo.FUNCIONARIO WHERE Cod_Funcionario = @nrFuncionario;

END
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_NovaLinha]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_NovaLinha] (@nLinha INT, @documento INT, @tipoDoc INT, @empresa INT, @artigo INT, @quantidade INT, @dataEntrega DATE, @desconto INT = null)
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



	-- Não permitir Insert da linha se estado do documento = 1
	DECLARE @estadoD AS BIT;
	SELECT @estadoD = estado
	FROM #Documento_aux;

	-- data de Entrega
	DECLARE @dataEntregaD AS DATE;
	SELECT @dataEntregaD = dataEntrega
	FROM #Documento_aux;

	-- data de Vencimento
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_NovaLoja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_NovaLoja] (@Nome_loja VARCHAR(20), @E_mail VARCHAR(256), @Telefone VARCHAR(9), @Cod_endereco INT, @Cod_empresa INT)
AS
	INSERT INTO ClubeVideo.LOJA (Nome_loja, E_mail, Telefone, Cod_endereco, Cod_empresa) VALUES
	(@Nome_loja, @E_mail, @Telefone, @Cod_endereco, @Cod_empresa)
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_NovoDocumento]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_NovoDocumento] (@tipoDoc INT, @empresa INT, @terceiro INT, @loja INT, @dataEmissao DATE, @dataEntrega DATE, @nVendedor INT, @dataVencimento DATE, @fExpedicao INT, @endEntrega INT, @endFaturacao INT)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;

	DECLARE @estadoL AS BIT; 
	SELECT @estadoL = ativa
	FROM ClubeVideo.LOJA
	WHERE Cod_loja=@loja;

	-- O documento só pode ser emitido por um funcionário da loja
	DECLARE @funcionario AS INT; 
	SELECT @funcionario = F.Cod_Funcionario
	FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario 
	WHERE F.Cod_Funcionario=@nVendedor AND L.Cod_loja=@loja;

	-- Cod_relacao_ter_emp 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_NovoProdutoLinha]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_NovoProdutoLinha] (@produto INT, @artigo INT, @linha INT, @documento INT, @tipoDoc INT, @empresa INT, @dataDevolucao DATE = NULL)
AS

	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRANSACTION;


	-- Não permitir Insert de Produto se estado do documento = 1
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


	-- Não permitir Insert de Produto se estado da linha = 1
	DECLARE @estadoL AS BIT;
	SELECT @estadoL = estado
	FROM #LinhaDocumento_aux2;


	-- Não permitir Insert de Produto de artigo diferente daquele definido na linha
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

		-- disponibilidade do Produto

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

			IF (@tipoDoc!=4) -- não aluguer
			BEGIN

				INSERT INTO ClubeVideo.Produto_LinhaDocumento (empresa, tipoDoc, documento, linha, artigo, produto) VALUES
				(@empresa, @tipoDoc, @documento, @linha, @artigo, @produto);

				COMMIT TRANSACTION;
				return;
			END
			ELSE 
			BEGIN  -- aluguer tem que ter data de devolução

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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Pagamento]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Pagamento] (@Cod_Pagamento INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_ProdutosDisponiveis]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_ProdutosDisponiveis] (@linha INT, @documento INT, @tipoDoc INT, @empresa INT)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Profissao]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Profissao] (@Cod_Profissao INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_RemoverEndereco]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_RemoverEndereco] @nrEndereco INT
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
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_RemoverTerceiro]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_RemoverTerceiro] @codTerceiro INT
AS
	IF NOT EXISTS (SELECT terceiro FROM ClubeVideo.Documento WHERE terceiro = @codTerceiro)
		DELETE FROM ClubeVideo.TERCEIRO WHERE Cod_terceiro = @codTerceiro;
	ELSE
		RAISERROR('Impossível remover pois terceiro em causa está associado a um documento', 16, 1);
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchArtigoListaPrecos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchArtigoListaPrecos] (@Cod_lista_precos INT, @Cod_artigo INT = null, @Preco MONEY = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchDocumento]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchDocumento] (@empresa INT, @nDocumento INT = null, @tipoDoc INT, @terceiro INT = null, @loja INT = null, @dataEmissao DATE = null, @dataEntrega DATE = null, @nVendedor INT = null, @dataVencimento DATE = null, @fExpedicao INT = null, @endEntrega INT = null, @endFaturacao INT = null, @valorTotal MONEY = null,	@valorTotalIVA MONEY = null, @estado BIT = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchFuncionarioLoja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchFuncionarioLoja] (@Cod_empresa INT, @Cod_loja INT = null, @Cod_Funcionario INT = null, @Nome_Funcionario VARCHAR(40) = null, @Data_Nascimento DATE = null, @Nacionalidade VARCHAR(30) = null, @Sexo VARCHAR(1) = null, @Estado_Civil VARCHAR(20) = null, @Telemovel VARCHAR(9) = null, @E_mail VARCHAR(256) = null, @Vencimento MONEY = null, @Data_Admissao DATE = null, @Cod_endereco INT = null, @Cod_Situacao INT = null, @Cod_profissao INT = null, @Cod_tipo_pagamento INT = null, @NIF VARCHAR(9) = null, @NIB VARCHAR(21) = null, @No_doc_identificacao VARCHAR(14) = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchLinha]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchLinha] (@empresa INT, @nLinha INT = null, @documento INT, @tipoDoc INT, @artigo INT = null, @quantidade INT = null, @precoUnit MONEY = null, @taxaIVA INT = null, @dataEntrega DATE = null, @valorMov MONEY = null, @valorIVA MONEY = null, @valorTotalIVA MONEY = null, @desconto INT = null, @estado BIT = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchListaPrecos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchListaPrecos] (@Cod_empresa INT, @Cod_lista_precos INT = null, @Descricao VARCHAR(100) = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchLoja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchLoja] (@Cod_empresa INT, @Cod_funcionario INT = null, @Cod_loja INT = null, @Nome_loja VARCHAR(20) = null, @E_mail VARCHAR(256) = null, @Telefone VARCHAR(9) = null, @Cod_endereco INT = null, @ativa BIT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchLoja1]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchLoja1] (@Cod_empresa INT, @Cod_funcionario INT = null, @Cod_loja INT = null, @Nome_loja VARCHAR(20) = null, @E_mail VARCHAR(256) = null, @Telefone VARCHAR(9) = null, @Cod_endereco INT = null, @ativa BIT = null) 
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
		SET @sqlCommand = 'SELECT LL.Cod_loja, LL.Nome_loja, LL.E_mail, LL.Telefone, LL.Cod_endereco, LL.Cod_empresa, LL.ativa FROM ClubeVideo.FUNCIONARIO AS F JOIN ClubeVideo.FUNCIONARIOS_EM_LOJAS AS L ON F.Cod_Funcionario = L.Cod_funcionario  JOIN ClubeVideo.LOJA AS LL ON L.Cod_loja=LL.Cod_loja';
		
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_SearchProdutosLoja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_SearchProdutosLoja] (@loja INT, @nProduto INT = null, @artigo INT = null, @disponibilidade INT = null)
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_Situacao]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Situacao] (@Cod_Situacao INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_submeterTerceiro]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_submeterTerceiro] @codTerceiro INT = null, @codEmpresa INT = NULL, @nomeTerceiro VARCHAR(40) = NULL,
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
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_Terceiro]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_Terceiro] (@Cod_empresa INT, @tipoDoc INT, @Cod_terceiro INT = null) 
AS

	-- Tipo Documento / Cod_relacao_ter_emp
	--(1,1,'Entrada de produtos'), -- 1, 2
	--(2,1,'Fatura'), -- 0
	--(3,1,'Nota de Crédito'),  -- 0
	--(4,1,'Aluguer'), -- 0
	--(5,1,'Entrega de Aluguer'), -- 0
	--(6,1,'Término de aluguer por compra'); -- 0


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
/****** Object:  StoredProcedure [ClubeVideo].[pr_TipoDoc]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_TipoDoc] (@empresa INT, @nTipoDoc INT = null) 
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
/****** Object:  StoredProcedure [ClubeVideo].[pr_todasEmpresas]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_todasEmpresas]
AS
	SELECT * FROM ClubeVideo.Empresa;

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_TodosArtigos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_TodosArtigos]
AS
	SELECT * FROM ClubeVideo.Artigo;

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_TodosEnderecos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_TodosEnderecos]
AS
	SELECT * FROM ClubeVideo.Endereco;

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_TodosTerceiros]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_TodosTerceiros]
AS
	SELECT * FROM ClubeVideo.TERCEIRO;

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateArtigoListasPrecos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateArtigoListasPrecos] (@Cod_artigo INT, @Cod_lista_precos INT, @Preco MONEY)
AS
	UPDATE ClubeVideo.PRECO_ARTIGO
	SET Preco=@Preco 
	WHERE Cod_artigo=@Cod_artigo AND Cod_lista_precos=@Cod_lista_precos;
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateArtigos]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateArtigos] @nArtigo INT = null, @nome VARCHAR(50) = null, @stockMin BIGINT = null, @stockMax BIGINT = null, @precoStock MONEY = null,
	@dataUltAlt DATE = null, @IVA INT = null, @stock INT = null, @estado BIT = null
AS
	IF CHARINDEX('''', @nome) = 0 AND CHARINDEX('"', @nome) = 0
		UPDATE ClubeVideo.Artigo SET nome = @nome, stockMin = @stockMin, stockMax = @stockMax, precoStock = @precoStock,
			dataUltAlt = @dataUltAlt, Iva = @IVA, stock = @stock, estado = @estado WHERE nArtigo = @nArtigo;
	ELSE
		RAISERROR(''' not allowed in field "nome"', 16, 1);

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateDocumento]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateDocumento] (@nDocumento INT, @tipoDoc INT, @empresa INT, @estado BIT)
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

	IF (@tipoDoc!=1) -- se tipoDoc=1 é aceitável existirem linha incompletas
	BEGIN
		SELECT @numLinhasIncompletas = count(*)
		FROM #LinhaDocumento_aux
		WHERE estado=0;
	END

	-- Só atualizar o estado de 0->1 se existem linhas e se estão todas no estado 1

	IF (NOT (@estado_old=0 AND @estado=1 AND @numLinhas>0 AND @numLinhasIncompletas=0))
	BEGIN

		COMMIT TRANSACTION;
		RAISERROR('O Documento não pode atualizar o seu estado', 16, 1);
		return;
	END
	ELSE
	BEGIN

		-- calcular valorTotal (soma de valorMov de todas as linhas)

		DECLARE @valorTotal AS MONEY;
		SELECT @valorTotal = sum(valorMov)
		FROM #LinhaDocumento_aux;

		-- calcular valorTotalIVA (soma de valorTotalIVA de todas as linhas)

		DECLARE @valorTotalIVA AS MONEY;
		SELECT @valorTotalIVA = sum(valorTotalIVA)
		FROM #LinhaDocumento_aux;


		-- atualizar quantidades dos artigos

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

			-- quantStock = quantDispLojas + quantAlugLojas

			IF (@tipoDoc=1 OR @tipoDoc=3) -- entrada de produtos, Nota de crédito
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantStock=quantStock+@quantidade, quantDispLojas=quantDispLojas+@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=2) -- Fatura
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantStock=quantStock-@quantidade, quantDispLojas=quantDispLojas-@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=4) -- Aluguer
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantDispLojas=quantDispLojas-@quantidade, quantAlugLojas=quantAlugLojas+@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=5) -- entrega de Aluguer
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantDispLojas=quantDispLojas+@quantidade, quantAlugLojas=quantAlugLojas-@quantidade
				WHERE nArtigo=@artigo;
			END
			IF (@tipoDoc=6) -- término de Aluguer por compra
			BEGIN

				UPDATE ClubeVideo.Artigo
				SET quantStock=quantStock-@quantidade, quantDispLojas=quantDispLojas-@quantidade, quantAlugLojas=quantAlugLojas-@quantidade
				WHERE nArtigo=@artigo;
			END


			-- atualizar produtos

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
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateEndereco]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateEndereco] @nEndereco INT, @morada VARCHAR(20), @codigoPostal VARCHAR(10), @localidade VARCHAR(20), @distrito VARCHAR(20),
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
		
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateFuncionario]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateFuncionario] (@Cod_Funcionario INT, @Estado_Civil VARCHAR(20), @Telemovel VARCHAR(9), @E_mail VARCHAR(256), @Vencimento MONEY, @Cod_endereco INT, @Cod_Situacao INT, @Cod_profissao INT, @Cod_tipo_pagamento INT, @NIB VARCHAR(21))
AS
	UPDATE ClubeVideo.FUNCIONARIO 
	SET Estado_Civil = @Estado_Civil, Telemovel = @Telemovel, E_mail = @E_mail, Vencimento = @Vencimento, Cod_endereco = @Cod_endereco, Cod_Situacao = @Cod_Situacao, Cod_profissao = @Cod_profissao, Cod_tipo_pagamento = @Cod_tipo_pagamento, NIB = @NIB
	WHERE Cod_Funcionario = @Cod_Funcionario;

GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateLinha]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateLinha] (@nLinha INT, @documento INT, @tipoDoc INT, @empresa INT, @estado BIT)
AS
	UPDATE ClubeVideo.LinhaDocumento
	SET estado=@estado
	WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@nLinha;
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateLoja]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateLoja] (@Cod_loja INT, @ativa BIT)
AS
	UPDATE ClubeVideo.LOJA 
	SET ativa = @ativa 
	WHERE Cod_loja = @Cod_loja
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_UpdateTerceiro]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_UpdateTerceiro] @codTerceiro INT = null, @codEmpresa INT = NULL, @nomeTerceiro VARCHAR(40) = NULL,
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
GO
/****** Object:  StoredProcedure [ClubeVideo].[pr_VERIFICAR_LOGIN]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[pr_VERIFICAR_LOGIN] @Cod_funcionario INT, @Passe NVARCHAR(50), @Msg_resposta NVARCHAR(250)='' OUTPUT
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
GO
/****** Object:  StoredProcedure [ClubeVideo].[teste]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ClubeVideo].[teste] (@loja INT = null)
AS
BEGIN
	DECLARE @sqlCommand nvarchar(1000);
	SET @sqlCommand = 'SELECT * FROM ClubeVideo.Produto';

	IF (NOT (@loja is NULL))
		BEGIN
			DECLARE @v_loja nvarchar(100);
			SET @v_loja = @loja;
			SET @sqlCommand += ' WHERE loja = ' + @v_loja; -- + @loja;
		END

	EXEC (@sqlCommand)
END
GO
/****** Object:  Trigger [ClubeVideo].[retirarLoginDesp]    Script Date: 11/06/2020 15:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ClubeVideo].[retirarLoginDesp] ON [ClubeVideo].[FUNCIONARIO]
AFTER UPDATE
AS
BEGIN
	DECLARE @codSituacao AS INT;
	DECLARE @codFuncionario AS INT;
	
	SELECT @codFuncionario = Cod_Funcionario, @codSituacao = Cod_Situacao FROM INSERTED;

	IF @codSituacao = 4
	BEGIN
		IF EXISTS (SELECT TOP 1 Cod_func FROM ClubeVideo.[Login] WHERE Cod_func = @codFuncionario)
		BEGIN
			DELETE FROM ClubeVideo.[login] WHERE Cod_func = @codFuncionario;
			PRINT 'Funcionário com código ' + CAST(@codFuncionario AS VARCHAR(10)) + ' deixou de ter acesso à empresa';
		END
	END
END

GO
ALTER TABLE [ClubeVideo].[FUNCIONARIO] ENABLE TRIGGER [retirarLoginDesp]
GO
/****** Object:  Trigger [ClubeVideo].[t_criarLinha]    Script Date: 11/06/2020 15:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ClubeVideo].[t_criarLinha] ON [ClubeVideo].[LinhaDocumento]
INSTEAD OF INSERT
AS
BEGIN
	-- if INSERT: 
	--  -> deleted = empty
	--  -> inserted = rows being inserted


	DECLARE @nLinha AS INT;
	SELECT @nLinha=nLinha FROM inserted;

	DECLARE @documento AS INT;
	SELECT @documento=documento FROM inserted;

	DECLARE @tipoDoc AS INT;
	SELECT @tipoDoc=tipoDoc FROM inserted;

	DECLARE @empresa AS INT;
	SELECT @empresa=empresa FROM inserted;

	DECLARE @artigo AS INT;
	SELECT @artigo=artigo FROM inserted;

	DECLARE @quantidade AS INT;
	SELECT @quantidade=quantidade FROM inserted;

	DECLARE @dataEntrega AS DATE;
	SELECT @dataEntrega=dataEntrega FROM inserted;

	DECLARE @desconto AS INT;
	SELECT @desconto=desconto FROM inserted;

	DECLARE @estado AS BIT;
	SELECT @estado=estado FROM inserted;



	DECLARE @terceiro AS INT;
	SELECT @terceiro = D.terceiro 
	FROM ClubeVideo.Documento AS D JOIN inserted AS L ON (D.empresa=L.empresa AND D.tipoDoc=L.tipoDoc AND D.nDocumento=L.documento);


	DECLARE @precoUnit AS MONEY;
	SELECT @precoUnit = Preco
	FROM ClubeVideo.TERCEIRO AS T JOIN ClubeVideo.PRECO_ARTIGO AS P ON T.Cod_lista_precos=P.Cod_lista_precos
	WHERE Cod_terceiro=@terceiro AND Cod_artigo=@artigo;

	
	DECLARE @taxaIVA AS INT;
	SELECT @taxaIVA = percentagem
	FROM ClubeVideo.Artigo JOIN ClubeVideo.TipoIVA ON IVA=nIVA
	WHERE nArtigo=@artigo;


	DECLARE @valorMov AS MONEY;
	SELECT @valorMov = (@quantidade * @precoUnit); 

	DECLARE @per_taxaIVA AS DECIMAL(5,2);
	SELECT @per_taxaIVA = Cast(@taxaIVA AS DECIMAL(5,2))/100;

	DECLARE @valorIVA AS MONEY;
	DECLARE @valorTotalIVA AS MONEY;


		IF (@desconto is null)
		BEGIN

			SELECT @valorIVA = (@valorMov * @per_taxaIVA); 
			SELECT @valorTotalIVA = (@valorMov + @valorIVA); 

			INSERT INTO ClubeVideo.LinhaDocumento (empresa,tipoDoc,documento,nLinha,artigo,quantidade,precoUnit,taxaIVA,dataEntrega,valorMov,valorIVA,valorTotalIVA)
			SELECT empresa,tipoDoc,documento,@nLinha,artigo,quantidade,@precoUnit,@taxaIVA,dataEntrega,@valorMov,@valorIVA,@valorTotalIVA
			FROM inserted;
		END
		ELSE
		BEGIN

			DECLARE @per_desconto AS DECIMAL(5,2);
			SELECT @per_desconto = Cast(@desconto AS DECIMAL(5,2))/100;

			SELECT @valorMov = (@valorMov - @valorMov*@per_desconto); 
			SELECT @valorIVA = (@valorMov * @per_taxaIVA); 
			SELECT @valorTotalIVA = (@valorMov + @valorIVA); 

			INSERT INTO ClubeVideo.LinhaDocumento (empresa,tipoDoc,documento,nLinha,artigo,quantidade,precoUnit,taxaIVA,dataEntrega,valorMov,valorIVA,valorTotalIVA,desconto)
			SELECT empresa,tipoDoc,documento,@nLinha,artigo,quantidade,@precoUnit,@taxaIVA,dataEntrega,@valorMov,@valorIVA,@valorTotalIVA,desconto
			FROM inserted;
		END

END
GO
ALTER TABLE [ClubeVideo].[LinhaDocumento] ENABLE TRIGGER [t_criarLinha]
GO
/****** Object:  Trigger [ClubeVideo].[t_DeleteInsertProdutoLinha]    Script Date: 11/06/2020 15:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ClubeVideo].[t_DeleteInsertProdutoLinha] ON [ClubeVideo].[Produto_LinhaDocumento]
AFTER Delete, Insert
AS
BEGIN

	-- if INSERT: 
	--  -> deleted = empty
	--  -> inserted = rows being inserted

	-- if DELETE: 
	--  -> deleted = rows being deleted
	--  -> inserted = empty


	DECLARE @Insercao AS INT;
	SELECT @Insercao=COUNT(*) FROM deleted;


	DECLARE @produto AS INT;
	DECLARE @artigoLP AS INT;
	DECLARE @tipoDoc AS INT;


	DECLARE @linha AS INT;
	DECLARE @documento AS INT;
	DECLARE @empresa AS INT;
	DECLARE @quantidade AS INT;
	DECLARE @numprodutos AS INT;


	
	IF (@Insercao!=0)  -- se é delete
	BEGIN

		-- atualizar disponibilidade

		SELECT @produto = produto FROM deleted;
		SELECT @artigoLP = artigo FROM deleted;
		SELECT @tipoDoc = tipoDoc FROM deleted;


		IF (@tipoDoc=2 OR @tipoDoc=4) -- se fatura ou aluguer
		BEGIN
			-- (1,'disponível')

			UPDATE ClubeVideo.Produto
			SET disponibilidade=1
			WHERE artigo=@artigoLP AND nProduto=@produto;

		END

		IF (@tipoDoc=3) -- se nota de crédito
		BEGIN
			-- (2,'indisponível devido a compra')
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=2
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END

		IF (@tipoDoc=5 OR @tipoDoc=6) -- se entrega de aluguer ou término de aluguer por compra
		BEGIN
			-- (3,'indisponível devido a aluguer')
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=3
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END


		-- atualizar estado da linha caso já tenha se atingido o nº de produtos pretendido anteriormente


		SELECT @linha = linha FROM deleted;
		SELECT @documento = documento FROM deleted;
		SELECT @empresa = empresa FROM deleted;
		
		SELECT @quantidade = quantidade
		FROM ClubeVideo.LinhaDocumento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@linha;
		
		SELECT @numprodutos = COUNT(*)
		FROM ClubeVideo.Produto_LinhaDocumento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND linha=@linha;


		IF (@numprodutos=(@quantidade-1))
		BEGIN
			UPDATE ClubeVideo.LinhaDocumento
			SET estado=0
			WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@linha;
		END


	END
	ELSE  -- se é insert
	BEGIN

		-- atualizar disponibilidade

		SELECT @tipoDoc = tipoDoc FROM inserted;
		SELECT @artigoLP = artigo FROM inserted;
		SELECT @produto = produto FROM inserted;


		IF (@tipoDoc=1 OR @tipoDoc=3 OR @tipoDoc=5) -- entrada de produtos, nota de crédito, entrega de aluguer
		BEGIN
			-- (1,'disponível')

			UPDATE ClubeVideo.Produto
			SET disponibilidade=1
			WHERE artigo=@artigoLP AND nProduto=@produto;

		END

		IF (@tipoDoc=2 OR @tipoDoc=6) -- fatura, término de aluguer devido a compra
		BEGIN
			-- (2,'indisponível devido a compra')
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=2
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END

		IF (@tipoDoc=4) -- aluguer
		BEGIN
			-- (3,'indisponível devido a aluguer')
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=3
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END


		-- atualizar estado da linha caso já tenha atingido o nº de produtos pretendido

		SELECT @linha = linha FROM inserted;
		SELECT @documento = documento FROM inserted;
		SELECT @empresa = empresa FROM inserted;

		SELECT @quantidade = quantidade
		FROM ClubeVideo.LinhaDocumento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@linha;

		SELECT @numprodutos = COUNT(*)
		FROM ClubeVideo.Produto_LinhaDocumento
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND linha=@linha;


		IF (@quantidade=@numprodutos)
		BEGIN
			UPDATE ClubeVideo.LinhaDocumento
			SET estado=1
			WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND nLinha=@linha;
		END

	END
END
GO
ALTER TABLE [ClubeVideo].[Produto_LinhaDocumento] ENABLE TRIGGER [t_DeleteInsertProdutoLinha]
GO
USE [master]
GO
ALTER DATABASE [p3g8] SET  READ_WRITE 
GO
