Insert Into Fornecedor
	Values (1, '68.422.419/0001-75', 'Palacio das Ferramentas e Parafusos Ltda', 'Avenida Santos Dumont, 11000 Franca/SP', 21049666)
Go

Insert Into Pecas
	Values (1, '30473', 'Parafusadeira à Bateria 3,6V 2000 110V SKIL', 70, 50, 100, 81),
		   (2, '53865', 'Parafusadeira à Bateria 3,6V com 33 Peças BIVOLT PBN 036 NOVE54', 75, 40, 100, 99),
		   (3, '51797', 'Bateria 14,4V 3,0Ah Lítio GBA LI-ION BOSCH', 90, 50, 80, 358),
		   (4, '32131', 'Furadeira Industrial 1/2 POL 550W BOSCH', 100, 40, 300, 235),
		   (5, '18357', 'Policorte 14 POL GCO 2000W GCO 2000  BOSCH', 30, 60, 200, 110)
Go

Insert Into OrdemCompra
	Values (1, 1, '600', '28-05-2016'),
		   (2, 1, '1900', '12-06-2016')
Go

Insert Into Itens_OrdemCompra
	Values (1, 1, 20, 0, 81),
		   (1, 2, 35, 0, 99),
		   (1, 3, 50, 0, 358),
		   (2, 4, 75, 0, 235)
Go

Insert Into Receptaculo
	Values (1, 1, 1, 20),
		   (2, 1, 2, 35),
		   (3, 1, 3, 60),
		   (4, 1, 4, 55)
Go

Insert Into Cliente
	Values (1, '98.643.219/0004-56', 'Loja SempreAberta', 'Avenida João Cleber, 156', 33551985),
		   (2, '67.749.172/0001-06', 'Soares Acessórios Peças e Serviços', 'Rua Eugênio Ribeiro, 42', 55109890),
		   (3, '19.144.125/0000-01', 'Covrechini Construções', 'Alameda Itu, 1067', 68124542)
Go

Insert Into Pedido
	Values (1, 1, '3240', '25-09-2016'),
		   (2, 3, '4950', '14-08-2016'),
		   (3, 2, '25060', '07-07-2016')
Go

Insert Into Itens_Pedido
	Values (1, 3, 40, 358),
		   (2, 1, 50, 81),
		   (3, 2, 70, 99)
Go