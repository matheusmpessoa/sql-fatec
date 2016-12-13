use Imovel

go

-- 1.	Fa�a uma lista de im�veis do mesmo bairro do im�vel 2. Exclua o im�vel 2 da sua busca.

Select cd_Bairro
	From Imovel
		Where cd_Imovel = 2
go

Select cd_Imovel, cd_Bairro
	From Imovel
		Where cd_Bairro = 2 and cd_Imovel != 2
go

Select cd_Imovel, cd_Bairro
	From Imovel
		Where cd_Bairro = 
			(Select cd_Bairro
				From Imovel
				Where cd_Imovel = 2) -- retorna o cod do bairro
			and cd_Imovel <> 2
go

-- 2.	Fa�a uma lista que mostre todos os im�veis que custam mais que a m�dia de pre�o dos im�veis.

Select cd_Imovel, vl_Imovel
	From Imovel 
		Where vl_Imovel >
			(Select AVG(vl_Imovel) 
				From Imovel)
go

-- 3.	Fa�a uma lista com todos os compradores que tenham ofertas cadastradas com o valor superior a 70 mil.

Select cd_Comprador, vl_Oferta
	From Oferta
		Where vl_oferta > 70000
go

-- 4.	Fa�a uma lista com todos os im�veis com oferta superior � m�dia do valor das Ofertas.

Select cd_Imovel, vl_Oferta 
	From Oferta 
		Where vl_Oferta >
			(Select AVG(vl_Oferta)
					From Oferta)
go

-- 5.	Fa�a uma lista com todos os im�veis com pre�o superior � m�dia de pre�o dos im�veis do mesmo bairro.

Select cd_Imovel, vl_Imovel
		From Imovel as I
			Where vl_Imovel > 
				(Select AVG(vl_Imovel)
					From Imovel 
						Where cd_Bairro = I.cd_Bairro)
go
	
 -- 6.	Fa�a uma lista dos im�veis com o maior pre�o agrupado por bairro, cujo maior pre�o seja superior � m�dia de pre�os dos im�veis.

 Select cd_Bairro, MAX(vl_Imovel)
	From Imovel  
		Group by cd_Bairro
			Having MAX(vl_Imovel) >
				(Select AVG(vl_Imovel)
					From Imovel)
go

-- 7.	Fa�a uma lista com os im�veis que tem o pre�o igual ao menor pre�o de cada vendedor

Select cd_Imovel, cd_Vendedor, vl_Imovel
	From Imovel as I
		Where vl_Imovel = 
				(Select MIN(vl_Imovel)
					From Imovel 
						Where cd_Vendedor = I.cd_Vendedor)

go

-- 8.	Fa�a uma lista com os im�veis que t�m o pre�o igual ao menor pre�o de todos os vendedores, exceto os im�veis do pr�prio vendedor.

Select cd_Imovel, cd_Vendedor, vl_Imovel
	From Imovel as I
		Where vl_Imovel =
				(Select MIN(vl_Imovel)
					From Imovel 
						Where cd_Vendedor <> I.cd_Vendedor) 
go

-- 9.	Fa�a uma lista com as ofertas menores que todas as ofertas do comprador 2, exceto os im�veis do pr�prio comparador.

Select cd_Imovel, cd_Comprador, vl_Oferta
	From Oferta
		Where vl_Oferta < 
			(Select max(vl_Oferta)
			From Oferta
			Where cd_Comprador = 2)
		and cd_Comprador <> 2
go

-- 10.	Fa�a uma lista de todos os im�veis cujo Estado e Cidade sejam os mesmos do vendedor 3, exceto os im�veis do vendedor 3.

Select cd_Imovel, cd_Cidade, sg_Estado, cd_Vendedor
		From Imovel
		Where (sg_Estado) in (Select sg_Estado
					From Imovel
					Where cd_Vendedor = 3) and
					(cd_Cidade) in (Select cd_Cidade
						From Imovel
							Where cd_Cidade = 3)
					and cd_Vendedor <> 3

-- 11.	Fa�a uma lista com todos os nomes de bairro cujos im�veis sejam do mesmo Estado, cidade e bairro do im�vel c�digo 5.

Select  nm_Bairro
From Bairro
	Where (sg_Estado) = 
			(Select sg_Estado
				From Imovel
					Where cd_Imovel = 5) and
			(cd_Cidade) =
				(Select cd_Cidade
				From Imovel
					Where cd_Imovel = 5) and
			(cd_Bairro) =
				(Select cd_Cidade
					From Imovel
						Where cd_Imovel = 5)
go