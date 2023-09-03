-- Querys para populacionar o banco de dados
-- sempre terá 10 de cada e assim será feitos os testes para confirmar se tudo funciona conforme esperado

-- Confirmando se estamos em ecommerce e inserindo de dados e queries
use oficina;

-- verificando as tabelas do banco
show tables;
INSERT INTO Customers (FirstName, LastName, Address, Phone, Email, VehiclePlate)
VALUES
    ('João', 'Silva', 'Rua A, 123', '123-456-7890', 'joao@example.com', 'ABC-1234'),
    ('Maria', 'Santos', 'Av. B, 456', '987-654-3210', 'maria@example.com', 'XYZ-5678'),
    ('Pedro', 'Oliveira', 'Rua C, 789', '555-123-4567', 'pedro@example.com', 'DEF-9012'),
    ('Ana', 'Ferreira', 'Av. D, 1010', '111-222-3333', 'ana@example.com', 'GHI-3456'),
    ('Carlos', 'Pereira', 'Rua E, 111', '999-888-7777', 'carlos@example.com', 'JKL-7890'),
    ('Mariana', 'Rocha', 'Av. F, 222', '444-555-6666', 'mariana@example.com', 'MNO-1234'),
    ('José', 'Cavalcanti', 'Rua G, 333', '777-888-9999', 'jose@example.com', 'PQR-5678'),
    ('Isabela', 'Sousa', 'Av. H, 444', '222-333-4444', 'isabela@example.com', 'STU-9012'),
    ('Lucas', 'Lima', 'Rua I, 555', '333-444-5555', 'lucas@example.com', 'VWX-3456'),
    ('Laura', 'Costa', 'Av. J, 666', '666-777-8888', 'laura@example.com', 'YZA-7890');

select * from customers;

INSERT INTO OrderStatus (StatusName)
VALUES
    ('Pendente'),
    ('Em Execução'),
    ('Concluída'),
    ('Cancelada');

select * from OrderStatus;

INSERT INTO Users (Username, Password, UserType, FirstName, LastName, Address, Phone, Email)
VALUES
    ('cliente1', 'senha123', 'Cliente', 'João', 'Cliente', 'Rua A, 123', '123-456-7890', 'joao@example.com'),
    ('cliente2', 'senha123', 'Cliente', 'Maria', 'Cliente', 'Av. B, 456', '987-654-3210', 'maria@example.com'),
    ('cliente3', 'senha123', 'Cliente', 'Pedro', 'Cliente', 'Rua C, 789', '555-123-4567', 'pedro@example.com'),
    ('mecanico1', 'senha456', 'Mecânico', 'Ana', 'Mecânico', 'Av. D, 1010', '111-222-3333', 'ana@example.com'),
    ('mecanico2', 'senha456', 'Mecânico', 'Carlos', 'Mecânico', 'Rua E, 111', '999-888-7777', 'carlos@example.com'),
    ('mecanico3', 'senha456', 'Mecânico', 'Mariana', 'Mecânico', 'Av. F, 222', '444-555-6666', 'mariana@example.com'),
    ('mecanico4', 'senha456', 'Mecânico', 'José', 'Mecânico', 'Rua G, 333', '777-888-9999', 'jose@example.com'),
    ('mecanico5', 'senha456', 'Mecânico', 'Isabela', 'Mecânico', 'Av. H, 444', '222-333-4444', 'isabela@example.com'),
    ('mecanico6', 'senha456', 'Mecânico', 'Lucas', 'Mecânico', 'Rua I, 555', '333-444-5555', 'lucas@example.com'),
    ('mecanico7', 'senha456', 'Mecânico', 'Laura', 'Mecânico', 'Av. J, 666', '666-777-8888', 'laura@example.com');

INSERT INTO Orders (CustomerID, IssueDate, CompletionDate, TotalValue, Status, AuthorizationStatus, StatusID, AssignedTo)
VALUES
    (1, '2023-08-01', '2023-08-05', 500.00, 'Concluída', 'Autorizado', 3, 4),
    (2, '2023-08-02', '2023-08-06', 750.00, 'Concluída', 'Autorizado', 3, 5),
    (3, '2023-08-03', NULL, 300.00, 'Em Execução', 'Aguardando Autorização', 1, 6),
    (4, '2023-08-04', NULL, 200.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (5, '2023-08-05', '2023-08-10', 400.00, 'Concluída', 'Autorizado', 3, 7),
    (6, '2023-08-06', NULL, 150.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (7, '2023-08-07', NULL, 100.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (8, '2023-08-08', '2023-08-12', 600.00, 'Concluída', 'Autorizado', 3, 8),
    (9, '2023-08-09', NULL, 450.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (10, '2023-08-10', NULL, 350.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (1, '2023-08-11', NULL, 200.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (1, '2023-08-12', NULL, 300.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (1, '2023-08-13', '2023-08-18', 400.00, 'Concluída', 'Autorizado', 3, 4),
    (2, '2023-08-14', NULL, 250.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (2, '2023-08-15', '2023-08-20', 350.00, 'Concluída', 'Autorizado', 3, 5),
    (2, '2023-08-16', NULL, 180.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (2, '2023-08-17', NULL, 220.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (2, '2023-08-18', NULL, 290.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (3, '2023-08-19', '2023-08-25', 320.00, 'Concluída', 'Autorizado', 3, 4),
    (3, '2023-08-20', NULL, 180.00, 'Pendente', 'Aguardando Autorização', 1, NULL),
    (4, '2023-08-21', NULL, 420.00, 'Pendente', 'Aguardando Autorização', 1, NULL);


-- Esse comando é muito simples e gostei, posso pegar apenas uma parte de um conjunto e assim pesquisar.
SELECT * FROM Customers WHERE Address LIKE '%Rua%';

-- Consulta simples que retorna em forma ascendente pelo sobrenome
SELECT * FROM Customers ORDER BY LastName ASC;

-- Mostra todos que solicitaram mais que 3 pedidos.
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderNumber) AS TotalOrders
FROM
    Customers c
LEFT JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.FirstName, c.LastName
HAVING
    TotalOrders > 3;

-- Lista os clientes e calcula os dias necessários para a manutenção ter ocorrido.
SELECT
    o.OrderNumber,
    o.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS 'Nome',
    c.Address AS Endereco,
    o.IssueDate AS 'Data de emissão',
    o.CompletionDate 'Data de conclusão',
    DATEDIFF(o.CompletionDate, o.IssueDate) AS 'Dia em manutenção'
FROM
    Orders o
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    o.IssueDate IS NOT NULL
    AND o.CompletionDate IS NOT NULL
    AND o.AuthorizationStatus = 'Autorizado';

-- Lista todos os clientes que deixaram os veiculos, situação da manutenção e se já tem um um mecanico ou mecanica atuando no problema
-- Uma estrutura bem comum em python porem não vejo em SQL com frequencia pelo menos quando vou pesquisar um assunto, me baseie pelo site w3cschools
SELECT
    CONCAT(C.FirstName, ' ', C.LastName) AS NomeCompleto,
    C.Phone AS Telefone,
    C.Email AS Email,
    C.VehiclePlate AS PlacaVeiculo,
    S.StatusName,
    CASE
        WHEN OS.AuthorizationStatus = 'Autorizado' THEN DATEDIFF(OS.CompletionDate, OS.IssueDate)
        ELSE ''
    END AS DiasParaManutencao,
    CONCAT(U.FirstName, ' ', U.LastName) AS NomeMecanico,
    U.Phone AS TelefoneMecanico,
    U.Email AS EmailMecanico
FROM
    Customers AS C
JOIN
    Orders AS OS ON C.CustomerID = OS.CustomerID
LEFT JOIN
    Users AS U ON OS.AssignedTo = U.UserID
JOIN
    OrderStatus AS S ON OS.StatusID = S.StatusID;
