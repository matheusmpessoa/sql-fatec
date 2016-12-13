Create Procedure arquivarPedido
	@mes Int,
	@ano Int
As
	Declare @cdPedido Int
	
	If Exists(Select cd_Pedido From Pedido Where Month(dt_Pedido) = @mes And Year(dt_Pedido) = @ano)
	Begin	
		While Exists(Select cd_Pedido From Pedido Where Month(dt_Pedido) = @mes And Year(dt_Pedido) = @ano)
		Begin
			Select @cdPedido = Max(cd_Pedido) From Pedido Where Month(dt_Pedido) = @mes And Year(dt_Pedido) = @ano
		
			Insert Into Pedidos_Finalizados
				Select * From Pedido Where cd_Pedido =  @cdPedido
			
			If Exists(Select cd_Peca From Itens_Pedido Where cd_Pedido = @cdPedido)
				While Exists(Select cd_Peca From Itens_Pedido Where cd_Pedido = @cdPedido)
				Begin
					Insert Into Pedidos_Pecas_Finalizados
						Select Top 1 * From Itens_Pedido Where cd_Pedido = @cdPedido

					Delete Itens_Pedido Where cd_Pedido = (Select Top 1 cd_Pedido From Itens_Pedido Where cd_Pedido = @cdPedido)
				End
			Else
				Print 'Atenção: Não existem este Item no Pedido solicitado.'
		
			Delete Pedido Where cd_Pedido =  @cdPedido
		End
	End 
	Else
		Print 'Atenção: Não existe pedido neste período (Mês/Ano)'