use Imovel
go

--ex 1
Select cd_Comprador, nm_Comprador, ds_Email
	From Comprador
go

--ex 2
Select cd_Vendedor, nm_Vendedor, ds_Email
	From Vendedor
	Order by nm_Vendedor asc;
go

-- ex 3
Select cd_Imovel, cd_Vendedor, vl_Imovel
	From Imovel
go

-- ex 4
Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
	From Imovel
	Where vl_Imovel < 150000 and sg_Estado = 'RJ'
go

-- ex 5
Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
	From Imovel
	Where vl_Imovel < 150000 and cd_Vendedor <> 2
go

-- ex 6
Select cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
	From Comprador
	Where sg_Estado is null
go

-- ex 7
Select *
	From Oferta
	Where vl_Oferta between 100000 and 150000
go

-- ex 8
Select *
	From Oferta
	Where dt_Oferta between '01-01-2009' and '01-03-2009'
go

-- ex 09
Select *
	From Vendedor
	Where nm_Vendedor like 'M%'
go

-- ex 10
Select *
	From Vendedor
	Where nm_Vendedor like '_A%'
go

-- ex 11
Select *
	From Comprador
	Where nm_Comprador like '%U%'
go

-- ex 12
Select *
	From Imovel
	Where cd_Imovel in (2,3)
	Order by ds_Endereco
go

-- ex 13
Select *
	From Oferta
	Where cd_Imovel in (2,3) and vl_Oferta > 140000
	Order by dt_Oferta DESC
go

-- ex 14
Select *
	From Imovel
	Where (vl_Imovel between 110000 and 200000) or cd_Vendedor = 1
	Order by qt_AreaUtil
go

-- ex 15
Select max(vl_Oferta) Maior, min(vl_Oferta) Menor, avg(vl_Oferta) Media
	From Oferta
go

-- ex 16
Select max(vl_Imovel) Maior, min(vl_Imovel) Menor, sum(vl_Imovel) Soma, avg(Vl_Imovel) Media
	From Imovel
go

-- ex 17
Select cd_Bairro, cd_Cidade, sg_Estado, Max(vl_Imovel) Maior, Min(vl_Imovel) Menor, Sum(vl_Imovel) Soma, Avg(vl_Imovel) Media
	From Imovel
	Group by cd_Bairro, cd_Cidade, sg_Estado
go

-- ex 18
Select sum(vl_Oferta) Soma
	From Oferta
	Where Year(dt_Oferta) between 2008 and 2010
