use master

-- resets the database
IF EXISTS(SELECT *
          FROM sys.databases
          WHERE name = 'Test')
    BEGIN
        DROP DATABASE Test
    END

IF NOT EXISTS(SELECT *
              FROM sys.databases
              WHERE name = 'Test')
    BEGIN
        CREATE DATABASE Test
    END

USE Test

IF OBJECT_ID(N'Users', N'U') IS NULL
    BEGIN
        CREATE TABLE "Users"
        (

            Id       uniqueidentifier primary key default newid(),
            Name     VARCHAR(100) not null,
            Surname  VARCHAR(100) not null,
            Email    VARCHAR(100) not null,
            Password VARCHAR(100) not null,
            Role     VARCHAR(100) NOT NULL CHECK (Role IN ('Admin', 'User')),
            Token    VARCHAR(100)
        )
    END
go

IF OBJECT_ID(N'Products', N'U') IS NULL
    BEGIN
        CREATE TABLE "Products"
        (

            Id       uniqueidentifier primary key default newid(),
            Name     VARCHAR(100) not null,
            Quantity INT          not null,
            Price    MONEY        not null,
            VAT      FLOAT        not null,
        )
    END

go

IF OBJECT_ID(N'Clients', N'U') IS NULL
    BEGIN
        CREATE TABLE "Clients"
        (

            Id         uniqueidentifier primary key default newid(),
            Name       VARCHAR(100) not null,
            Surname    VARCHAR(100) not null,
            Email      VARCHAR(100) not null,
            VAT_number VARCHAR(100) not null
        )
    END

IF OBJECT_ID(N'Sales', N'U') IS NULL
    BEGIN
        CREATE TABLE "Sales"
        (
            Id        uniqueidentifier primary key default newid(),
            Date      DATE                         DEFAULT GETDATE(),
            Client_id uniqueidentifier not null,
            -- other info like sender etc
            FOREIGN KEY (Client_id) REFERENCES Clients (Id)
        )
    END
go

IF OBJECT_ID(N'Sales_Products', N'U') IS NULL
    BEGIN
        CREATE TABLE "Sales_Products"
        (
            Sale_id    uniqueidentifier,
            Product_id uniqueidentifier,
            Quantity   INT   not null,
            Price      MONEY not null,
            VAT        FLOAT not null,
            FOREIGN KEY (Product_id) REFERENCES Products (Id),
            FOREIGN KEY (Sale_id) REFERENCES Sales (Id)
            -- index both
        )
        CREATE INDEX IX_Sale_id ON Sales_Products (Sale_id, Product_id)
    END
go

-- seed some data
INSERT INTO "Users" (Name, Surname, Email, Password, Role, Token)
VALUES ('John', 'Doe', 'johndoe@example.com', 'password', 'Admin', 'token'),
       ('Jane', 'Doe', 'janedoe@example.com', 'password', 'User', 'token')

INSERT INTO "Products" (Name, Quantity, Price, VAT)
VALUES ('Product1', 10, 100, 0.23),
       ('Product2', 20, 200, 0.23)

INSERT INTO "Clients" (Name, Surname, Email, VAT_number)
VALUES ('Client1', 'Surname1', 'client1@example.com', 'VAT1'),
       ('Client2', 'Surname2', 'client2@example.com', 'VAT2')

INSERT INTO "Sales" (Client_id)
VALUES ( (SELECT Id FROM Clients WHERE Name = 'Client1')), ((SELECT Id FROM Clients WHERE Name = 'Client2'))

INSERT INTO "Sales_Products" (Sale_id, Product_id, Quantity, Price, VAT)
VALUES ((SELECT Id FROM Sales WHERE Client_id = (SELECT Id FROM Clients WHERE Name = 'Client1')),
        (SELECT Id FROM Products WHERE Name = 'Product1'),
        1,
        100,
        0.23),

       ((SELECT Id FROM Sales WHERE Client_id = (SELECT Id FROM Clients WHERE Name = 'Client2')),
        (SELECT Id FROM Products WHERE Name = 'Product2'),
        2,
        200,
        0.23)
