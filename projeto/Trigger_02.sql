Create Trigger alteracaoPreco On Pecas
    For Update
    As
	Begin
		If (Select vl_Peca From Inserted) <> (Select vl_Peca From Deleted)
		Begin
			Declare @cdpreco Int, @cdpeca Int, @vlantigo Money, @vlnovo Money
			Set @cdpreco = (Select Max(cd_Preco) From Historico_Precos) + 1
			Set @cdpreco = IsNull(@cdpreco, 1)
			Select @cdpeca = cd_Peca From Inserted
			Select @vlnovo = vl_Peca From Inserted
			Select @vlantigo = vl_Peca From Deleted

			Insert Into Historico_Precos
				Values(@cdpreco, @cdpeca, GetDate(), @vlantigo, @vlnovo, 'root')
		End
	End
