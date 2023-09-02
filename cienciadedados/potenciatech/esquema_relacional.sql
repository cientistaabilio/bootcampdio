-- criação do banco de dados para o cenário de E-commerce versão 2.0
-- drop database ecommerce;

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11),
        CNPJ char(14),
        Address varchar(255),
        clientType ENUM('PF','PJ') not null,
        constraint unique_cpf_client unique (CPF),
        constraint unique_cnpj_client unique (CNPJ)
);

alter table clients auto_increment=1;

-- desc clients;
-- criar tabela produto

-- size = dimensão do produto
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(255) not null,
        classification_kids bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        avaliação float default 0,
        size varchar(10)
);

alter table product auto_increment=1;

-- criar tabela pedido
-- drop table orders;
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false, 
    constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
);
alter table orders auto_increment=1;

create table payments(
	idclient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','PIX','Dois cartões','Outro'),
    cartType ENUM('Crédito','Débito','Outro'),
    limitAvailable float,
    primary key(idClient, idPayment, typePayment),
    constraint fk_payments_client foreign key (idClient) references clients(idClient),
    constraint fk_payments_order foreign key (idPayment) references orders(idOrder)
);
-- Alteração das chaves estrageiras
ALTER TABLE payments 
DROP FOREIGN KEY fk_payments_order;

ALTER TABLE payments
ADD COLUMN idOrder INT;

ALTER TABLE payments
ADD CONSTRAINT fk_payments_order_new FOREIGN KEY (idOrder) REFERENCES orders(idOrder);

-- adicionando data a estrutura
ALTER TABLE payments
ADD COLUMN paymentDate DATE;

ALTER TABLE payments
MODIFY COLUMN idclient INT DEFAULT 0;

ALTER TABLE payments MODIFY COLUMN idPayment INT auto_increment;

select * from payments;

-- criar constraints relacionadas ao pagamento

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);
alter table productStorage auto_increment=1;

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(14) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;
ALTER TABLE supplier
ADD COLUMN Address VARCHAR(255);

-- criar tabela vendedor
CREATE TABLE seller (
  idSeller INT NOT NULL AUTO_INCREMENT,
  SocialName VARCHAR(255) NOT NULL,
  AbstName VARCHAR(255) NULL DEFAULT NULL,
  CNPJ CHAR(14) NULL DEFAULT NULL,
  CPF CHAR(11) NULL DEFAULT NULL,
  location VARCHAR(255) NULL DEFAULT NULL,
  contact CHAR(11) NOT NULL,
  sellerType ENUM('PF', 'PJ') NOT NULL,
  PRIMARY KEY (idSeller),
  constraint unique_cnpj_seller unique (CNPJ),
  constraint unique_cpf_seller unique (CPF));

create table deliveries (
    idDelivery int auto_increment primary key,
    idOrder int,
    deliveryStatus enum('Em trânsito', 'Entregue', 'Pendente'),
    trackingCode varchar(50),
    constraint fk_deliveries_order foreign key (idOrder) references orders(idOrder)
);

-- tabelas de relacionamentos M:N
-- Pagamentos dos clientes
CREATE TABLE clientpayment (
    idclient INT,
    idpayment INT,
    PRIMARY KEY (idclient, idpayment),
    CONSTRAINT fk_clientpayment_client FOREIGN KEY (idclient) REFERENCES clients(idclient),
    CONSTRAINT fk_clientpayment_payment FOREIGN KEY (idpayment) REFERENCES payments(idpayment)
);

-- Produtos e pedidos
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int auto_increment,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_product_order_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_order_idPOorder foreign key (idPOorder) references orders(idOrder)

);
alter table productOrder auto_increment=1;

CREATE TABLE orderDelivery (
    idODorder INT,
    idODdelivery INT,
    PRIMARY KEY (idODorder, idODdelivery),
    CONSTRAINT fk_order_delivery_order FOREIGN KEY (idODorder) REFERENCES orders(idOrder),
    CONSTRAINT fk_order_delivery_delivery FOREIGN KEY (idODdelivery) REFERENCES deliveries(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);

CREATE TABLE sellerOrder (
    idSOseller INT,
    idSOorder INT,
    PRIMARY KEY (idSOseller, idSOorder),
    FOREIGN KEY (idSOseller) REFERENCES seller(idSeller),
    FOREIGN KEY (idSOorder) REFERENCES orders(idOrder)
);
