

CREATE TRIGGER t_criarLinha ON ClubeVideo.LinhaDocumento
INSTEAD OF INSERT
AS
BEGIN

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


CREATE TRIGGER ClubeVideo.t_DeleteInsertProdutoLinha ON ClubeVideo.Produto_LinhaDocumento
AFTER Delete, Insert
AS
BEGIN

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


	
	IF (@Insercao!=0)  
	BEGIN

		SELECT @produto = produto FROM deleted;
		SELECT @artigoLP = artigo FROM deleted;
		SELECT @tipoDoc = tipoDoc FROM deleted;


		IF (@tipoDoc=2 OR @tipoDoc=4) 
		BEGIN

			UPDATE ClubeVideo.Produto
			SET disponibilidade=1
			WHERE artigo=@artigoLP AND nProduto=@produto;

		END

		IF (@tipoDoc=3) 
		BEGIN
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=2
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END

		IF (@tipoDoc=5 OR @tipoDoc=6) 
		BEGIN
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=3
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END

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
	ELSE  
	BEGIN

		SELECT @tipoDoc = tipoDoc FROM inserted;
		SELECT @artigoLP = artigo FROM inserted;
		SELECT @produto = produto FROM inserted;


		IF (@tipoDoc=1 OR @tipoDoc=3 OR @tipoDoc=5) 
		BEGIN

			UPDATE ClubeVideo.Produto
			SET disponibilidade=1
			WHERE artigo=@artigoLP AND nProduto=@produto;

		END

		IF (@tipoDoc=2 OR @tipoDoc=6) 
		BEGIN
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=2
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END

		IF (@tipoDoc=4) 
		BEGIN
			
			UPDATE ClubeVideo.Produto
			SET disponibilidade=3
			WHERE artigo=@artigoLP AND nProduto=@produto;
		END

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


CREATE TRIGGER ClubeVideo.retirarLoginDesp ON ClubeVideo.FUNCIONARIO
AFTER UPDATE					-- retirar um empregado dos logins assim que o mesmo é despedido
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