use master

IF EXISTS(SELECT *
          FROM sys.databases
          WHERE name = 'Test')
    BEGIN
        DROP DATABASE Test
    END

-- USE Test

-- IF OBJECT_ID(N'Sales', N'U') IS NOT NULL
--     BEGIN
--         DROP TABLE Sales
--     END
--
--
-- IF OBJECT_ID(N'Sales', N'U') IS NOT NULL
--     IF NOT EXISTS(SELECT *
--                   FROM sys.databases
--                   WHERE name = 'Test')
--         BEGIN
--             CREATE DATABASE Test
--         END
