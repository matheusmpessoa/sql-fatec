use Imovel

go

-- ex1
Select I.cd_Imovel, I.cd_Vendedor, V.nm_Vendedor, I.sg_Estado
	FROM Imovel as I INNER JOIN Vendedor as V 
		ON I.cd_Vendedor = V.cd_Vendedor 
go

-- ex2
Select O.cd_Comprador, C.nm_Comprador, O.cd_Imovel, O.vl_Oferta
	FROM Comprador as C INNER JOIN Oferta as O
		ON C.cd_Comprador = O.cd_Comprador
	ORDER BY C.nm_Comprador
go

-- ex3
Select I.cd_Imovel, I.vl_Imovel, B.nm_Bairro
	FROM Imovel as I INNER JOIN Bairro as B
		ON I.cd_Bairro = B.cd_Bairro and
		I.cd_Cidade = B.cd_Cidade and
		I.sg_Estado = B.sg_Estado
	WHERE I.cd_Vendedor = 3
go

-- ex4
-- imóveis que tenham ofertas cadastradas
Select I.*,O.vl_Oferta
	FROM Imovel as I INNER JOIN Oferta as O
		ON I.cd_Imovel = O.cd_Imovel
go

-- ex5
-- imóveis e ofertas mesmo que não haja ofertas cadastradas para o imóvel
Select I.*,O.vl_Oferta
	FROM Imovel as I LEFT JOIN Oferta as O
		ON I.cd_Imovel = O.cd_Imovel
go

-- ex6
-- compradores e as respectivas ofertas realizadas por eles
Select C.nm_Comprador, O.vl_Oferta
	FROM Comprador as C INNER JOIN Oferta as O
		ON C.cd_Comprador = O.cd_Comprador
go

-- ex7
-- compradores que ainda não fizeram ofertas para os imóveis
Select C.nm_Comprador, O.vl_Oferta
	FROM Comprador as C LEFT JOIN Oferta as O
		ON C.cd_Comprador = O.cd_Comprador
	WHERE O.vl_oferta is null
go

-- ex8
-- endereço do imóvel, o bairro e nível de preço do imóvel
Select I.ds_Endereco, B.nm_Bairro, I.vl_Imovel, F.nm_Faixa
	FROM Imovel as I, Bairro as B, Faixa_Imovel as F
	WHERE (I.vl_Imovel between F.vl_Minimo and F.vl_Maximo) and
		I.cd_Bairro = B.cd_Bairro and
		I.cd_Cidade = B.cd_Cidade and
		I.sg_Estado = B.sg_Estado
go

-- ex9
-- retorne o total de imóveis por nome de vendedor. Apresente em ordem de total de imóveis.
Select V.nm_Vendedor, count(*) as qt_Imovel
	FROM Vendedor as V INNER JOIN Imovel as I
		ON V.cd_Vendedor = I.cd_Vendedor
	GROUP BY nm_Vendedor
	ORDER BY qt_Imovel
go

-- ex10
-- verifique a diferença de preços entre o maior e o menor imóvel da tabela
-- 'maior' e 'menor' sao para nomear o campo
Select max(vl_imovel) as maior, min(vl_imovel) as menor, 
       (max(vl_imovel) - min(vl_imovel)) as diferenca
   FROM imovel

-- ex11
-- Mostre o código do vendedor e o menor preço de imóvel dele no cadastro. 
-- Exclua da busca os valores de imóveis inferiores a 10 mil.
Select cd_vendedor, min(vl_imovel) as minimo 
   FROM imovel
   WHERE vl_imovel > 10000
   GROUP BY cd_vendedor

-- ex12
-- Mostre o código e o nome do comprador e a média do valor das ofertas e o número de ofertas deste comprador.
Select Comprador.cd_comprador as cod, Comprador.nm_comprador as nome, 
       AVG(Oferta.vl_oferta) as media, count(Oferta.vl_oferta) as qtde_oferta 
   FROM Comprador inner join Oferta
        ON Comprador.cd_comprador = Oferta.cd_comprador
   GROUP BY Comprador.nm_comprador, Comprador.cd_comprador
