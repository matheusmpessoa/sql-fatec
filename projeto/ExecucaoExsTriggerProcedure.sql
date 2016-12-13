-- Procedure Ex 1
EXEC receberEstoque 1,2,50

-- Procedure Ex 2
EXEC arquivarPedido 07,2016

-- Procedure Ex 3
EXEC compararEstoque 5

-- Trigger Ex 1
Delete Pecas
	Where cd_Peca = 4

-- Trigger Ex 2
Update Pecas
	Set vl_Peca = vl_Peca * 1.2
		Where cd_Peca = 3
