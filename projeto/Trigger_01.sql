Create Trigger pecasExcluidas On Pecas
    Instead Of Delete 
    As
	Begin
		Declare @cdPeca Int
		Set @cdPeca = (Select cd_Peca From Deleted)
		Print @cdPeca

		If Exists (Select cd_Peca From Deleted Where qt_Estoque = 0)
			Begin
				Declare @dspeca Varchar(30)
				Set @dspeca = (Select ds_Peca From Deleted Where qt_Estoque = 0)

				Insert Into Historico_Pecas_Excluidas
					Values(@cdPeca, @dspeca)

				Delete Pecas Where cd_Peca = @cdPeca
			End
		Else
			Begin
				Declare @cdlog Int
				Set @cdlog = (Select Max(cd_Log) From TentativasLog) + 1
				Set @cdlog = IsNull(@cdlog, 1)
				Print @cdPeca

				Insert Into TentativasLog
					Values(@cdlog, GetDate(), 'Exclusão de Peça', @cdPeca, 'root') 
			End
	End 
