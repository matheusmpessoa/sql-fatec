use Biblioteca

go

-- 3.	Destrua a tabela Autor_Livro

drop table Autor_Livro
go

-- 4.	Adicionar a coluna qt_Edicao na tabela Livro, j� criada essa coluna deve aceitar n�meros inferior a 20.

alter table Livro
	add qt_Edicao int
go

alter table Livro 
	add constraint ck_Edicao -- nome da restri��o
	check(qt_Edicao < 20)
go


-- 5.	Remover a coluna qt_Edicao da tabela Livro
alter table Livro
	drop constraint ck_Edicao
go

alter table Livro
	drop column qt_Edicao
go


-- 6.	Renomear a coluna vl_Livro para vl_VolumeLivro
exec sp_Rename 'Livro.vl_Livro', 
				'vl_VolumeLivro' 
go

-- 7.	Renomear a tabela Autor_Livro para Livro_Autor
exec sp_Rename 'Autor_Livro',
				'Livro_Autor'
go

-- 8.	Incluir uma restri��o de nome ck_autor_datanasc,  
-- na tabela de Autor indicando que a coluna dt_nascimento deve possuir valor anterior a (01 de janeiro de 2007)

alter table Autor
	add constraint ck_autor_datanasc
	check (dt_Nascimento <'01-01-2007')
go

-- 9.	Excluir a restrti��o ck_autor_datanasc, criada na tabela Autor
alter table Autor
	drop constraint ck_autor_datanasc
go

-- 10.	Criar um comando para excluir da tabela Livros 
-- aqueles que possuem o c�digo maior ou igual a 2, que possuem o pre�o maior que 50,00 e j� foram lan�ados.

delete Livro
	where (cd_Livro >= 2) and (vl_VolumeLivro > 50) and (dt_Lancamento <> null)
go

-- 11.	Escreva o comando que mostre as colunas nome, 
-- codigo e endere�o da tabela Autor, para aqueles que possuem a palavra �Jo�o� no nome.

Select nm_Autor, cd_Autor, ds_EnderecoAutor
	From Autor
		Where nm_Autor like '%Jo�o%' 
go

-- 12.	Excluir o Livro cujo o t�tulo � �Banco de Dados Distribu�dos� ou �Banco de Dados Distribu�do�, 
-- somente essas duas op��es devem ser consideradas

Delete Livro
	Where nm_Titulo like 'Banco de Dados Distribu�do_'
go

-- 13.	Selecione o nome e o c�digo de todos os Autores que nasceram ap�s 01 de janeiro de 1990.

Select nm_Autor, cd_Autor
	From Autor
	Where (dt_Nascimento > '01-01-1990')
go
-- 14.	Atualiza para zero o valor de todos o Livros onde a data de lan�amento for nula ou onde seu valor atual for inferior a 5,00.

Update Livro
	Set vl_VolumeLivro = 0
	Where (dt_Lancamento = null OR vl_VolumeLivro < 5.00)
go


-- 15.	Exclua todos os livros onde o assunto for diferente de �S�, �P� ou �B�.

Delete Livro
	Where sg_Assunto NOT IN ('S', 'P', 'B')
go

-- 16.	Escreva o comando para contar quantos s�o os autores cadastrados na tabela Autor
Select COUNT(*)
	From Autor
go

-- 17.	Apresente o comando para gerar uma listagem dos c�digos dos livros que possuem ao menos dois autores
Select cd_Livro 
	From Autor_Livro
	Where cd_Autor in
		(Select cd_Autor, Count(*) Conta
			From Autor_Livro 
			Group by cd_Autor
			Having Count(*)>=2)
		
go

-- 18.	Escreva o comando para apresentar o pre�o m�dio dos livros por c�digo de editora. 
-- Considere somente aqueles que custam mais de 45,00.
Select cd_Editora, AVG(vl_VolumeLivro) Media
	From Livro
		Group by cd_Editora
		Having vl_VolumeLivro > 45
go

-- 19.	Apresente o pre�o m�ximo, o pre�o m�nimo e o pre�o m�dio dos livros cujos assuntos s�o �S�, �P� ou �B� para cada c�digo de editora
Select MAX(vl_VolumeLivro) Maior, MIN(vl_VolumeLivro) Menor, AVG(vl_VolumeLivro) Media, cd_Editora
	From Livro
	Group by cd_Editora
	Having sg_Assunto IN ('S', 'P', 'B')
go