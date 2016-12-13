Create Procedure receberEstoque
	@cdOC Int, 
	@cdPeca Int,
	@qtEntregue Int
As
	Declare @cdEntrega Int, @qtEstoque Int, @maxRecept Int

	Set @cdEntrega = (Select Max(cd_Entrega) From Entrega) + 1
	Set @cdEntrega = IsNull(@cdEntrega, 1)

	Insert Into Entrega
		Values (@cdEntrega,@cdOC, GetDate())

	Insert Into Itens_Entrega
		Values (@cdEntrega, @cdPeca, @qtEntregue)

	Set @qtEstoque = (Select qt_Estoque From Pecas Where cd_Peca = @cdPeca) + @qtEntregue
	
	Print 'Registrou Uma Nova Entrega'

	Update Pecas
		Set qt_Estoque = @qtEstoque
		Where cd_Peca = @cdPeca
	Print 'Atualização Do Numero De Peças Em Estoque'
	
	Update Itens_OrdemCompra
		Set qt_Entregue = @qtEntregue
		Where cd_Peca = @cdPeca
	Print 'Atualização Em Itens Ordem De Compra - Quantidade De Peças Entregues'

	Update Receptaculo
			Set qt_Estocada = qt_Estocada + @qtEntregue
			Where cd_Peca = @cdPeca And
			qt_Estocada = (Select Min(qt_Estocada) From Receptaculo Where cd_Peca = @cdPeca)
		Print 'Atualização Em Quantidade Estocada No Receptaculo'
		
		Select @maxRecept = qt_MaxReceptaculo From Pecas Where cd_Peca = @cdPeca
		If Exists (Select cd_Receptaculo From Receptaculo Where qt_Estocada >= @maxRecept)
		Begin
			Declare @cdRecept Int, @qtExtra Int, @qtNovoRecebimento Int, @cdNovoRecebimento Int, @qtRecept Int
			
			Select @cdRecept = cd_Receptaculo, @qtextra = qt_Estocada From Receptaculo Where qt_Estocada >= @maxRecept
			Set @qtNovoRecebimento = @qtExtra - @maxRecept
			While @qtNovoRecebimento > 0
			
			Begin
				Set @cdNovoRecebimento = (Select Max(cd_Receptaculo) From Receptaculo) + 1
				Set @cdNovoRecebimento = Isnull(@cdNovoRecebimento, 1)

				If @qtNovoRecebimento > @maxRecept
					Set @qtRecept = @maxRecept
				Else 
					Set @qtRecept = @qtNovoRecebimento
					
				Insert Into Receptaculo
					Values (@cdNovoRecebimento, 1, @cdPeca, @qtRecept)
				Print 'Atualização: Utilizando Um Novo Receptaculo'

				Set @qtNovoRecebimento = @qtNovoRecebimento - @qtRecept
			End

			Update Receptaculo
				Set qt_Estocada = @maxRecept
				Where cd_Receptaculo = @cdRecept
		End