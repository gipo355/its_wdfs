IF NOT EXISTS(SELECT *
              FROM sys.databases
              WHERE name = 'test')
    BEGIN
        CREATE DATABASE [DataBase]
    END
GO
USE [DataBase]
GO
--You need to check if the table exists
-- IF NOT EXISTS (SELECT *
--                FROM sysobjects
--                WHERE name = 'TableName'
--                  and xtype = 'U')
--     BEGIN
--         CREATE TABLE TableName
--         (
--             Id   INT PRIMARY KEY IDENTITY (1, 1),
--             Name VARCHAR(100)
--         )
--     END