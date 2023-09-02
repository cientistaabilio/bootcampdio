use ecommerce;-- Confirmando se estamos em ecommerce e inserindo de dados e queries
show tables;-- verificando AS tabelAS do banco
/*
Há 15 tabelAS, sendo 7 tabelAS de relacionamentos.
*/

-- CadAStro de fornecedor na tabela supplier
insert into supplier (SocialName, CNPJ, contact,Address)
	values
		('Fornecedor A', '12345678901234', '11122223333',"Alameda sem fim 34"),
		('Fornecedora Tech Solutions Ltda', '16666678901235', '11122223334', 'Avenida dAS Inovações, 123'),
		('Fornecedora Global Electronics S.A.', '16666678901236', '11122223335', 'Rua dAS TecnologiAS, 456'),
		('Fornecedora Digital World Inc.', '16666678901237', '11122223336', 'Praça da Informática, 789'),
		('Fornecedora FutureTech Group Ltda', '16666678901238', '11122223337', 'Alameda da Inovação, 1010'),
		('Fornecedora InnovateTech Corp.', '16666678901239', '11122223338', 'Avenida da Eletrônica, 2020'),
		('Fornecedora Advanced Systems S.A.', '16666678901240', '11122223339', 'Rua dos Gadgets, 303'),
		('Fornecedora Tech Innovations Ltda', '16666678901241', '11122223340', 'Avenida dAS Novidades, 505'),
		('Fornecedora Global Solutions Inc.', '16666678901242', '11122223341', 'Praça dAS TecnologiAS, 606'),
		('Fornecedora SmartTech Ltda', '16666678901243', '11122223342', 'Alameda dAS Inovações, 707');

select * from supplier;
update supplier -- atualizando campo em branco, pois foi feita uma adição tardia a tabela, linha 104 do esquema_relacional_sql, com o objetivo de mostrar o uso do update
set Address = 'Rua dos encantos, 777'
where idSupplier = 1;
select * from supplier; -- confirmando se realmente foi alterado

insert into supplier (SocialName, CNPJ, contact,Address)
	values
		('Fornecedor mantles', '16666678901234', '11122223333',"Rua gonçalves");
select * from supplier; -- confirmando se foi adicionado

delete fromsupplier -- o fornecedor foi desvinculado e ASsim será excluido do sistema.
where idSupplier = 11;
select * from supplier; -- confirmando se foi deletado

insert into supplier (SocialName, CNPJ, contact,Address)
	values
		('Fornecedor mantles', '16666678901234', '11122223333',"Rua gonçalves");
-- Note que o indice dele é 11 mAS depois da exclusão o id dele se perde e o próximo registro sempre será o valor acima.
-- Então se for apagado 10, o numero terá um salto de 10 vezes do seu anterior.
select * from supplier; -- confirmando se foi deletado

-- CadAStro de clientes PF na tabela clients (CPF)
insert into clients (Fname, Minit, Lname, CPF, Address, clientType)
	values
		('João', 'S.', 'Silva', '12345678901', 'Rua A, 123', 'PF');

-- CadAStro de clientes PJ na tabela clients (CNPJ)
insert into clients (Fname, Minit, Lname, CNPJ, Address, clientType)
	values
		('Pepsi', '', 'Distribuição', '12345678000123', 'Rua Z, 789', 'PJ');

-- Se a pessoa for PJ é obrigada a colocar o CNPJ, porem se a pessoa for PF, é obrigada a colocar o cpf
-- Também só é possivel 1 único CPF e CNPJ, não pode haver redundancia.
select * from clients;

-- Os valores podem ser manipulados pelos parametros, cASo queira pode solicitar CPF e CNPJ e o qual que não existe deixar como null.alter
-- Tudo depende do propósito, pois se fizer como nAS versões anterior o null será aplicado automaticamente.
insert into clients (Fname, Minit, Lname, CPF, CNPJ, Address, clientType)
values
    ('Fernando', 'A', 'Silva', '22345678901', NULL, 'Rua A, 123', 'PF'),
    ('Maria', 'B', 'Santos', '98765432109', NULL, 'Rua X, 789', 'PF'),
    ('Empresa', '','XYZ', NULL, '98765432109876', 'Avenida Y, 101', 'PJ'),
    ('Carlos', 'C', 'Pereira', '11122233344', NULL, 'Rua Z, 321', 'PF');

select * from clients;

-- CadAStro de vendedores pessoa juridica (PJ) na tabela seller
insert into seller (SocialName, AbstName, CNPJ, location, contact, sellerType)
	values
		('Loja de Eletrônicos XYZ', 'Eletrônicos XYZ Ltda', '12345678000100', 'Avenida Principal, 123', '11122223333', 'PJ'),
        ('Loja de RoupAS ABC', 'RoupAS ABC Ltda', '12345678000101', 'Rua Comercial, 456', '99988887777', 'PJ'),
		('Loja de Brinquedos XYZ', 'Brinquedos XYZ Ltda', '98765432000100', 'Avenida Central, 789', '88877776666', 'PJ'),
		('Supermercado SuperBom', 'SuperBom Supermercados Ltda', '55555555000123', 'Rua dAS ComprAS, 1010', '77766665555', 'PJ'),
		('Loja de Móveis Elegantes', 'Móveis Elegantes Ltda', '77777777000100', 'Avenida dAS Decorações, 111', '66655554444', 'PJ'),
		('Loja de Eletrônicos TechStore', 'TechStore Eletrônicos Ltda', '88888888000111', 'Avenida da Tecnologia, 222', '55544443333', 'PJ');

-- CadAStro de vendedores Pessoa Física (PF) na tabela seller
insert into seller (SocialName, CPF, location, contact, sellerType)
	values
		('João da Silva', '12345678901', 'Rua dos Gadget, 303', '30303030303', 'PF'),
		('Maria Santos', '98765432109', 'Rua dAS Artes, 505', '60606060606', 'PF'),
		('José Oliveira', '11122233344', 'Avenida dos Esportes, 808', '90909090909', 'PF'),
		('Luiz Pereira', '33344455566', 'Rua dAS ComidAS, 303', '10101010101', 'PF'),
		('Fernanda Costa', '55566677788', 'Avenida dos Livros, 202', '20202020202', 'PF'),
		('Rafael Souza', '88899900011', 'Rua dAS Flores, 707', '30303030303', 'PF');

-- Os vendedores coloquei que podem pessoAS fisicAS ou CNPJ tudo depende se tem cadAStro no sistema.

select * from seller;

-- CadAStrando produtos na tabela product
insert into product (Pname, clASsification_kids, category, avaliação, size)
	values
		('Smartphone XYZ', 0, 'Eletrônico', 4.5, '6.2"'),
		('Camiseta Esportiva', 1, 'Vestimenta', 4.0, 'M'),
		('Carrinho de Controle Remoto', 1, 'Brinquedos', 3.8, 'Grande'),
		('Cereal Matinal', 0, 'Alimentos', 4.2, '400g'),
		('Sofá de Couro', 0, 'Móveis', 4.7, '3 Lugares'),
		('Tablet ABC', 1, 'Eletrônico', 4.1, '8"'),
		('Vestido de Festa', 0, 'Vestimenta', 4.4, 'P'),
		('Quebra-Cabeça', 1, 'Brinquedos', 4.6, '500 PeçAS'),
		('Chocolate Amargo', 0, 'Alimentos', 4.3, '100g'),
		('Mesa de Jantar', 0, 'Móveis', 4.8, '6 Lugares'),
        ('porta', 0, 'Móveis', 3.9, '3 metros');

select * from product;

-- cadAStrando em qual parte do estoque estará os produtos.
insert into productStorage (idProdStorage, storageLocation, quantity)
values -- ApenAS para fins de comodidade será comentado abaixo os produtos referêntes
    (1, 'Prateleira 1', 50),-- 'Smartphone XYZ'
    (2, 'Prateleira 2', 30),-- 'Camiseta Esportiva'
    (3, 'Estoque A', 100),-- 'Carrinho de Controle Remoto'
    (4, 'Depósito 1', 20),--  'Cereal Matinal'
    (5, 'Prateleira 3', 80),-- 'Sofá de Couro'
    (6, 'Armazém B', 10),-- 'Tablet ABC'
    (7, 'Estoque C', 40),-- Vestido de Festa'
    (8, 'Prateleira 4', 25),-- 'Quebra-Cabeça'
    (9, 'Depósito 2', 60),-- 'Chocolate Amargo'
    (10, 'Prateleira 5', 90),-- 'Mesa de Jantar'
    (11, 'Armazém A', 15);--  Porta

select * from productStorage;

-- Relação de produto a um fornecedor
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
	values  (1, 1, 100),
			(1, 2, 50),
			(2, 3, 200),
			(2, 4, 75),
			(3, 5, 150),
			(3, 6, 80),
			(4, 7, 100),
			(4, 8, 60),
			(5, 9, 120),
			(5, 10, 90);


select * from productSupplier;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCASh)
values
	(1, 'Confirmado', 'Pedido 1', 100.0, 1),
    (2, 'Em processamento', 'Pedido #2', 15.0, 0),
    (3, 'Confirmado', 'Pedido #3', 20.2, 0),
    (4, 'Em processamento', 'Pedido #4', 12.8, 1),
    (5, 'Cancelado', 'Pedido #5', 18.7, 0),
    (1, 'Confirmado', 'Pedido 1 2 vezes', 75.0, 1);
    	
select * from orders;

-- A mensagem é Disponível ou Sem estoque 
insert into productOrder (idPOorder, idPOproduct, poQuantity, poStatus)
values
    (1, 1, 2, 'Disponível'),  -- o cliente id 1 João silva comprou 2 Smartphone XYZ
    (2, 2, 1, 'Sem estoque'),
    (3, 3, 3, 'Disponível'),
    (4, 4, 1, 'Sem estoque'),
    (5, 5, 2, 'Disponível'),
    (6, 1, 2, 'Disponível');  -- o cliente id 1 João silva comprou 2 Smartphone XYZ
select * from productOrder;

-- Registro da forma de pagamento e data do pagamento , enfim informações básicAS do valor recebido pela empresa
insert into payments (idClient, idPayment, typePayment, cartType, limitAvailable, idOrder, paymentDate)
	values
		(1, 1,'cartão','Crédito',500.0,1,'2023-08-01'),
		(2, 2, 'Cartão', 'Crédito', 500.0, 2, '2023-08-02'),
		(3, 3, 'PIX', NULL, NULL, 3, '2023-08-03'),
		(4, 4, 'Boleto', NULL, NULL, 4, '2023-08-04'),
		(5, 5, 'Cartão', 'Débito', 200.0, 5, '2023-08-05'),
        (1, 6, 'Cartão', 'Débito', 500.0, 6, '2023-08-01');

select * from payments;

-- Criando o status da entrega e disponibilizando o código de rAStreio
-- AS mensagem do status podem ser Em trânsito Entregue ou Pendente
insert into deliveries (idOrder, deliveryStatus, trackingCode)
values
    (1, 'Em trânsito', 'XYZ123'),
    (2, 'Entregue', 'ABC456'),
    (3, 'Em trânsito', 'DEF789'),
    (4, 'Entregue', 'GHI101'),
    (5, 'Pendente', NULL), 
    (6, 'Em trânsito', 'BYTE256'); 

select * from deliveries;

-- ----------------------------------------------------------------------------
-- ---------------------Mostrando AS queries-----------------------------------
-- ----------------------------------------------------------------------------

-- retornando  lista de clientes mostrando CNPJ ou CPF
select
    concat(Fname, ' ', Lname) AS NomeCompleto,
    CPF,
    CNPJ,
    Address,
    ClientType
from clients;

-- Essa é uma versão que pelo que pesquisei funciona com diversos programAS
select
    concat(coalesce(Fname, ''), ' ', coalesce(Lname, '')) AS 'Nome Completo',
    coalesce(CPF, '') AS CPF,
    coalesce(CNPJ, '') AS CNPJ,
    coalesce(Address, '') AS Address,
    coalesce(ClientType, '') AS 'Tipo de cliente'
from clients;

-- Essa é uma versão do MySQL.
select
    concat(IFNULL(Fname, ''), ' ', IFNULL(Lname, '')) AS NomeCompleto,
    IFNULL(CPF, '') AS CPF,
    IFNULL(CNPJ, '') AS CNPJ,
    IFNULL(Address, '') AS Address,
    IFNULL(ClientType, '') AS ClientType
from clients;


-- Ocultando dados sensiveis
select
    concat(Fname, ' ', Lname) AS NomeCompleto,
    Address,
    ClientType
from clients;

-- Lista de fornecedores
select
    SocialName AS NomeSocial,
    CNPJ,
    Address,
    Contact
from supplier;


select
    concat(c.Fname, ' ', c.Lname) AS 'Nome Completo',
    p.Pname AS "Item do Pedido",
    po.poQuantity AS "Quantidade",
    o.orderStatus AS "Status do Pedido",
    o.orderDescription AS "Descrição",
    o.sendValue AS "Valor Efetuado",
    pmt.typePayment AS "Forma de Pagamento",
    pmt.paymentDate AS "Data do Pagamento",
    d.deliveryStatus AS "Status da Entrega",
    d.trackingCode AS "RAStreio"
from
    orders o
INNER JOIN
    clients c ON o.idOrderClient = c.idClient
LEFT JOIN
    productOrder po ON o.idOrder = po.idPOorder
LEFT JOIN
    product p ON po.idPOproduct = p.idProduct
LEFT JOIN
    payments pmt ON o.idOrder = pmt.idOrder
LEFT JOIN
    deliveries d ON o.idOrder = d.idOrder;
    
-- Nome e sobrenome com o nome do produto e código de rAStreio
select 
    c.Fname AS Cliente,
    c.Lname AS Sobrenome,
    p.Pname AS Produto,
    d.trackingCode AS Código_de_RAStreamento
from orders o
JOIN clients c ON o.idOrderClient = c.idClient
JOIN deliveries d ON o.idOrder = d.idOrder
LEFT JOIN productOrder po ON o.idOrder = po.idPOorder
LEFT JOIN product p ON po.idPOproduct = p.idProduct
where o.orderStatus = 'Confirmado';
-- where o.orderStatus = 'Em processamento';
-- where o.orderStatus = 'Cancelado';

-- Quantos pedidos foram feitos por cada cliente? versão pelo CPF
select c.CPF, concat(c.Fname, ' ', c.Lname) AS NomeCompleto, COUNT(o.idOrder) AS TotalOrders
from clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.CPF, NomeCompleto;

-- Quantos pedidos foram feitos por cada cliente? versão pelo ID
select c.idClient AS idOrderClient, concat(c.Fname, ' ', c.Lname) AS Nome_Completo, COUNT(o.idOrder) AS Total_Pedidos
from clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, NomeCompleto;

-- Algum vendedor também é fornecedor?
select s.idSeller, s.SocialName AS SellerSocialName,
       sup.SocialName AS SupplierSocialName
from seller s
INNER JOIN supplier sup ON s.idSeller = sup.idSupplier;

-- Relação de produtos e estoques
select
    p.idProduct AS ProductID,
    p.Pname AS ProductName,
    p.clASsification_kids AS ClASsificationKids,
    p.category AS Category,
    p.avaliação AS Rating,
    p.size AS Size,
    ps.storageLocation AS StorageLocation,
    ps.quantity AS Quantity
from
    product AS p
LEFT JOIN
    productStorage AS ps ON p.idProduct = ps.idProdStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos;
select s.SocialName AS SupplierName, p.Pname AS ProductName
from productSupplier ps
INNER JOIN supplier s ON ps.idPsSupplier = s.idSupplier
INNER JOIN product p ON ps.idPsProduct = p.idProduct;

-- Lista todos os pedidos que tenham 2 ou mais pedidos.

select * from productStorage;

select
	concat(c.Fname, ' ', c.Lname) AS Nome_Completo,
    o.idOrderClient,
    COUNT(*) AS Total_Pedidos
from
    orders o
INNER JOIN
    clients c ON o.idOrderClient = c.idClient
GROUP BY
    o.idOrderClient, c.Fname, c.Lname
HAVING
    COUNT(*) >= 2;
