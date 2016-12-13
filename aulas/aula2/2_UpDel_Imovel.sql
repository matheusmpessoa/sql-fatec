use Imovel
go

--ex8

update Imovel
	set vl_Imovel = vl_Imovel * 1.10
go

--ex9

update Imovel
	set vl_Imovel = vl_Imovel * 0.95
		where cd_Vendedor = 1
go

-- ex10

update Oferta
	set vl_oferta = vl_oferta * 1.05
		where cd_Comprador = 2
go

-- ex11

update Comprador
	set ds_Endereco = 'R. ANANÁS, 45', sg_Estado = 'RJ'
		where cd_Comprador = 3
go

-- ex12

update Oferta
	set vl_oferta = 101000
		where cd_Comprador = 2 and cd_Imovel = 4
go

-- ex13

delete Oferta
	where cd_Comprador = 3 and cd_Imovel = 1
go

-- ex14

delete Cidade
	where cd_Cidade = 3 and sg_Estado = 'SP'
go


-- ex15
insert into Faixa_Imovel
	(cd_Faixa, nm_Faixa, vl_Minimo, vl_Maximo)
	values (1, 'BAIXO', 0, 105000),
	(2, 'MÉDIO', 105001, 180000),
	(3, 'ALTO', 180001, 999999)
go