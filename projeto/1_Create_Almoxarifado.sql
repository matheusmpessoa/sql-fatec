Create Database Almoxarifado
Go

Use Almoxarifado
Go

/* Em uma das extremidades do almoxarifado encontra-se o setor de recep��o de pe�as. L�
chegam as pe�as entregues pelos fornecedores. Quando ocorre a chegada de pe�as, a primeira
atividade � registrar na ordem de compra a chegada das pe�as. Uma c�pia de toda ordem de
compra � sempre enviada ao setor de recep��o. Assim, neste setor sempre sabe-se quais as
pe�as que est�o por ser entregues. As ordens de compra s�o geradas no setor de compras e
apenas repassadas ao almoxarifado */

Create Table Fornecedor(
	cd_Fornecedor Int Not Null,
	cd_CNPJ Varchar(20) Not Null,
	nm_Fornecedor Varchar(60),
	ds_Endereco Varchar(80),
	cd_Telefone Int
)
Go

Create Table Pecas(
	cd_Peca Int Not Null,
	cd_UPC Varchar(20) Not Null,
	ds_Peca Varchar(100),
	qt_Estoque Int Not Null,
	qt_Minima Int Not Null,
	qt_MaxReceptaculo Int Not Null,
	vl_Peca Money
)
Go

Create Table OrdemCompra(
	cd_OC Int Not Null,
	cd_Fornecedor Int Not Null,
	vl_OC Money,
	dt_OC Datetime
)
Go

Create Table Itens_OrdemCompra(
	cd_OC Int Not Null,
	cd_Peca Int Not Null,
	qt_Pedida Int Not Null,
	qt_Entregue Int,
	vl_Peca Money
)
Go

/* Uma entrega corresponde sempre a uma ordem de compra. Em uma entrega podem ser
entregues diferentes quantidades de diferentes pe�as. */ 

Create Table Entrega(
	cd_Entrega Int Not Null,
	cd_OC Int Not Null,
	dt_Entrega Datetime
)
Go

/* Para cada entrega, o setor de recep��o monta uma lista de distribui��o, que instrui o operador
   sobre que pe�as, em quantidade ele deve estocar em que recept�culos. */

Create Table Itens_Entrega(
	cd_Entrega Int Not Null,
	cd_Peca Int Not Null,
	qt_Peca Int
)
Go

/* 
O almoxarifado est� organizado em corredores. Cada corredor possui v�rios recept�culos para
pe�as (um recept�culo � uma bacia retangular de material pl�stico). Os recept�culos s�o todos
do mesmo tamanho. Os corredores s�o numerados e os recept�culos s�o numerados por
corredor. 

As pe�as recebidas s�o colocadas sobre um estrado. Este estrado � ent�o levado para o
almoxarifado por uma empilhadeira e as pe�as s�o distribu�das nos recept�culos. */

Create Table Receptaculo(
	cd_Receptaculo Int Not Null,
	cd_Corredor Int Not Null,
	cd_Peca Int,
	qt_Estocada Int
)
Go


/* A sa�da do almoxarifado se d� contra pedidos de clientes. Um pedido pode solicitar v�rios tipos
de pe�as. Todas pe�as que atendem um pedido s�o juntadas, embaladas e colocadas em uma
rampa de carga onde encosta o caminh�o do cliente.  */

Create Table Pedido(
	cd_Pedido Int Not Null,
	cd_Cliente Int Not Null,
	vl_Pedido Money,
	dt_Pedido Datetime
)
Go

/* Para cada pedido, o setor de sa�da monta uma lista de busca, que instrui o operador sobre que
pe�as, em quantidade ele deve buscar em que recept�culos */

Create Table Itens_Pedido(
	cd_Pedido Int Not Null,
	cd_Peca Int Not Null,
	qt_Peca Int Not Null,
	vl_Peca Money
)
Go

/* O almoxarifado somente atende empresas. � necess�rio manter um cadastro de clientes com
CGC, nome, endere�o e telefone de contato. Para cada pe�a � necess�rio conhecer seu UPC
(�Universal Product Code�), descri��o e n�mero interno � organiza��o. */

Create Table Cliente(
	cd_Cliente Int Not Null,
	cd_Cnpj Varchar(20) Not Null,
	nm_Cliente Varchar(40),
	ds_Endereco Varchar(50),
	cd_Telefone Int
)
Go

-- Tabelas Procedures/Triggers

Create Table Pedidos_Finalizados(
	cd_Pedido Int Not Null,
	cd_Cliente Int Not Null,
	vl_Pedido Money,
	dt_Pedido Datetime
)
Go

Create Table Pedidos_Pecas_Finalizados(
	cd_Pedido Int Not Null,
	cd_Peca Int Not Null,
	qt_Peca Int Not Null,
	vl_Peca Money
)
Go

Create Table Pecas_Requisicao(
	cd_Peca Int Not Null,
	qt_Estoque Int Not Null,
	qt_Comprar Int
)
Go

Create Table Historico_Pecas_Excluidas(
	cd_Peca Int Not Null,
	ds_Peca Varchar(100)
)
Go

Create Table TentativasLog(
	cd_Log Int Not Null,
	dt_Log Datetime,
	ds_Operacao Varchar(60),
	cd_Peca Int,
	nm_Usuario Varchar(50)
)
Go

Create Table Historico_Precos(
	cd_Preco Int Not Null,
	cd_Peca Int Not Null,
	dt_Preco Datetime,
	vl_Preco_Antigo Money,
	vl_Preco_Novo Money,
	nm_Usuario Varchar(50)
)
Go