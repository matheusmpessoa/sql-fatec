Create Procedure compararEstoque
	@cdPeca Int
As
	Declare @estoqueAtual Int, @estoqueMin Int, @qt_Compra Int

	Set @estoqueAtual = (Select qt_Estoque From Pecas Where cd_Peca = @cdPeca)
	Set @estoqueMin = (Select qt_Minima From Pecas Where cd_Peca = @cdPeca)

	Set @qt_Compra = @estoqueMin - @estoqueAtual

	If @estoqueAtual < @estoqueMin
		Insert Into Pecas_Requisicao
			Values (@cdPeca, @estoqueAtual, @qt_Compra)
