-- design:

-- ### Database: transport_company

-- #### table: trips
--
-- - Id: Guid
-- - Departure: Varchar(50)
-- - Destination: Varchar(50)
-- - Distance: Int
-- - Duration
--
-- #### table: drivers
--
-- - Id: Guid
-- - Name: Varchar(50)
-- - Surname: Varchar(50)
-- - License: Varchar(50)
--
-- #### table: vehicles
--
-- - Id: Guid
-- - Name: Varchar(50)
-- - Seats: Int
--
-- #### table: Trips_Vehicles_Drivers
--
-- - Id: Guid
-- - Trip_id: Guid
-- - Vehicle_id: Guid
-- - Driver_id: Guid
-- - Departure_date: Date
-- - Departure_time: Date
-- - Duration: default duration

-- resets the database

use master
go

IF EXISTS(SELECT *
          FROM sys.databases
          WHERE name = 'Exam_Transport_Company')
    BEGIN
        DROP DATABASE Exam_Transport_Company
    END
-- ELSE
--     BEGIN
--         CREATE DATABASE Test
--     END
-- go

CREATE DATABASE Exam_Transport_Company
go

-- IF NOT EXISTS(SELECT *
--               FROM sys.databases
--               WHERE name = 'Test')
--     BEGIN
--         CREATE DATABASE Test
--     END

USE Exam_Transport_Company
go

-- create tables

IF OBJECT_ID(N'Trips', N'U') IS NULL
    BEGIN
        CREATE TABLE "Trips"
        (

            Id                   uniqueidentifier primary key default newid(),
            -- duration in mins, used to calculate the arrival time and date
            -- as a virtual prop
            Departure_location   VARCHAR(255) not null,
            Destination_location VARCHAR(255) not null,
            Distance             INT          not null, -- meters
            Duration             INT          not null, -- mins
            Price                MONEY        not null, -- cents
        )
    END
go

IF OBJECT_ID(N'Drivers', N'U') IS NULL
    BEGIN
        CREATE TABLE "Drivers"
        (

            Id      uniqueidentifier primary key default newid(),
            Name    VARCHAR(255) not null,
            Surname VARCHAR(255) not null,
            License VARCHAR(255) not null unique
        )
    END

go

IF OBJECT_ID(N'Vehicles', N'U') IS NULL
    BEGIN
        CREATE TABLE "Vehicles"
        (

            Id    uniqueidentifier primary key default newid(),
            Name  VARCHAR(255) not null,
            Color VARCHAR(255),
            Seats INT          not null,
            Plate VARCHAR(255) not null unique,
        )
    END

IF OBJECT_ID(N'Trips_Vehicles_Drivers', N'U') IS NULL
    BEGIN
        CREATE TABLE "Trips_Vehicles_Drivers"
        (
            Id             uniqueidentifier primary key default newid(),
            Trip_id        uniqueidentifier not null references Trips (Id),
            Vehicle_id     uniqueidentifier not null references Vehicles (Id),
            Driver_id      uniqueidentifier not null references Drivers (Id),
            Departure_date DATETIME         not null,
            Departure_time TIME             not null,
            -- we repeat it here to allow modifications for single trips
            Duration       INT              not null, -- minutes
            Price          MONEY            not null,
        )
        CREATE INDEX IX_Trip_id ON Trips_Vehicles_Drivers (Trip_id, Vehicle_id, Driver_id)
    END
go


-- seed some data

INSERT INTO "Trips" (Departure_location, Destination_location, Distance, Duration, Price)
VALUES ('Bucharest', 'Brasov', 2000, 180, 1000),
       ('Brasov', 'Bucharest', 20000, 190, 1000),
       ('Bucharest', 'Cluj', 400000, 60, 2000),
       ('Cluj', 'Bucharest', 400, 90, 2000),
       ('Bucharest', 'Iasi', 400, 90, 2000),
       ('Iasi', 'Bucharest', 400, 90, 2000),
       ('Bucharest', 'Timisoara', 400, 90, 2000),
       ('Timisoara', 'Bucharest', 400, 90, 2000)
go

INSERT INTO "Drivers" (Name, Surname, License)
VALUES ('John', 'Doe', 'AB123'),
       ('Jane', 'Doe', 'CD456'),
       ('Jack', 'Doe', 'EF789'),
       ('Jill', 'Doe', 'GH012')
go

INSERT INTO "Vehicles" (Name, Seats, Plate)
VALUES ('Vehicle1', 4, 'AB123'),
       ('Vehicle2', 8, 'CD456'),
       ('Vehicle3', 12, 'EF789'),
       ('Vehicle4', 16, 'GH012'),
       ('Vehicle5', 20, 'IJ345')
go

INSERT INTO "Trips_Vehicles_Drivers" (Trip_id, Vehicle_id, Driver_id, Departure_date, Departure_time, Duration, Price)
VALUES ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle1'),
        (SELECT Id FROM Drivers WHERE Name = 'John'),
        '2021-01-01',
        '12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle2'),
        (SELECT Id FROM Drivers WHERE Name = 'Jane'),
        '2021-01-01',
        '12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle3'),
        (SELECT Id FROM Drivers WHERE Name = 'Jack'),
        '2021-01-01',
        '12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle4'),
        (SELECT Id FROM Drivers WHERE Name = 'Jill'),
        '2021-01-01',
        '12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Brasov' AND Destination_location = 'Bucharest'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle4'),
        (SELECT Id FROM Drivers WHERE Name = 'Jill'),
        '2021-01-01',
        '12:00',
        180,
        1000),


       ((SELECT Id FROM Trips WHERE Departure_location = 'Timisoara' AND Destination_location = 'Bucharest'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle3'),
        (SELECT Id FROM Drivers WHERE Name = 'Jack'),
        '2021-01-01',
        '12:00',
        180,
        1000)
go


-- QUERIES

-- Determinare quanto segue:
-- 1. Il numero di viaggi pianificati per ogni singolo autista
-- 2. Il numero di viaggi e il totale di giorni di impegno per ogni mezzo
-- 3. La percentuale di giorni di utilizzo di ogni pulman (su totale viaggi)
-- 4. L’elenco dei viaggi più richiesti con la media di numero di giorni per
--    viaggio
-- 5. Determinare il periodo con maggior numero di viaggi pianificati
-- 6. Creare una funzione che dato il periodo (Partenza/Arrivo) mi determini
--    l’eventuale disponibilità di organizzare il viaggio ( Autista + Mezzo )

-- 1: Il numero di viaggi pianificati per ogni singolo autista

SELECT d.Name, d.Surname, COUNT(*) AS Trips
FROM Trips_Vehicles_Drivers tvd
         JOIN Drivers d ON tvd.Driver_id = d.Id
GROUP BY d.Name, d.Surname

-- 2. Il numero di viaggi e il totale di giorni di impegno per ogni mezzo

SELECT v.Name, COUNT(*) AS Trips, SUM(Duration) AS Total_Duration
FROM Trips_Vehicles_Drivers tvd
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
GROUP BY v.Name

-- 2b. Il numero di viaggi e il totale di giorni di impegno per ogni mezzo
-- il totale di giorni deve essere 1 giorno se inizio e fine viaggio sono lo stesso giorno,
-- altrimenti il numero di giorni tra inizio e fine viaggio

SELECT v.Name,
       COUNT(*)                                                                      AS Trips,
       SUM(DATEDIFF(DAY, Departure_date, DATEADD(MINUTE, Duration, Departure_date))) AS Total_Days_Used
FROM Trips_Vehicles_Drivers tvd
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
GROUP BY v.Name

-- 3. La percentuale di giorni di utilizzo di ogni pulman (su totale viaggi)

SELECT v.Name,
       COUNT(*)                                                                      AS Trips,
       SUM(DATEDIFF(DAY, Departure_date, DATEADD(MINUTE, Duration, Departure_date))) AS Total_Duration,
       (SUM(DATEDIFF(DAY, Departure_date, DATEADD(MINUTE, Duration, Departure_date))) * 100.0) /
       (SELECT SUM(DATEDIFF(DAY, Departure_date, DATEADD(MINUTE, Duration, Departure_date)))
        FROM Trips_Vehicles_Drivers)                                                 AS Percentage
FROM Trips_Vehicles_Drivers tvd
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
GROUP BY v.Name

