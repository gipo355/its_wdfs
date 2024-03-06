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
            Name     VARCHAR(100),
            Surname  VARCHAR(100),
            Email    VARCHAR(100),
            Password VARCHAR(100),
            Role     VARCHAR(100),
            Token    VARCHAR(100)
        )
    END
go

IF OBJECT_ID(N'Products', N'U') IS NULL
    BEGIN
        CREATE TABLE "Products"
        (

            Id       uniqueidentifier primary key default newid(),
            Name     VARCHAR(100),
            Quantity INT,
            Price    MONEY
        )
    END

go

IF OBJECT_ID(N'Clients', N'U') IS NULL
    BEGIN
        CREATE TABLE "Clients"
        (

            Id      uniqueidentifier primary key default newid(),
            Name    VARCHAR(100),
            Surname VARCHAR(100),
            Email   VARCHAR(100),
            Role    VARCHAR(100),
        )
    END

go
