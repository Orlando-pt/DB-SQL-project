

CREATE FUNCTION ClubeVideo.f_EmpresaFuncionario (@Cod_funcionario INT) RETURNS Table
AS
	RETURN(SELECT Cod_empresa FROM ClubeVideo.FUNCIONARIO WHERE Cod_Funcionario = @Cod_funcionario)
GO


CREATE FUNCTION ClubeVideo.f_EnderecoCompleto (@nEndereco INT) RETURNS Table
AS
	RETURN(SELECT * FROM ClubeVideo.Endereco WHERE nEndereco=@nEndereco)
GO


CREATE FUNCTION ClubeVideo.f_Linhas (@documento INT, @tipoDoc INT, @empresa INT) RETURNS Table
AS
	RETURN(SELECT * FROM ClubeVideo.LinhaDocumento WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento)
GO


CREATE FUNCTION ClubeVideo.f_ProdutosEmLoja (@loja INT) RETURNS Table
AS
	RETURN(SELECT * FROM ClubeVideo.Produto WHERE loja = @loja)
GO


CREATE FUNCTION ClubeVideo.f_ProdutosLinha (@linha INT, @documento INT, @tipoDoc INT, @empresa INT) RETURNS Table
AS
	RETURN(SELECT * FROM ClubeVideo.Produto_LinhaDocumento 
		WHERE empresa=@empresa AND tipoDoc=@tipoDoc AND documento=@documento AND linha=@linha)
GO


