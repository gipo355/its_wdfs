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
-- - Departure: DateTime
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
            Id         uniqueidentifier primary key default newid(),
            Trip_id    uniqueidentifier not null references Trips (Id),
            Vehicle_id uniqueidentifier not null references Vehicles (Id),
            Driver_id  uniqueidentifier not null references Drivers (Id),
            Departure  DATETIME         not null,
            -- we repeat it here to allow modifications for single trips
            Duration   INT              not null, -- minutes
            Price      MONEY            not null,
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

INSERT INTO "Trips_Vehicles_Drivers" (Trip_id, Vehicle_id, Driver_id, Departure, Duration, Price)
VALUES ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle1'),
        (SELECT Id FROM Drivers WHERE Name = 'John'),
        '2021-01-01 12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle1'),
        (SELECT Id FROM Drivers WHERE Name = 'John'),
        '2021-01-01 12:00',
           -- 2 days in minutes
        60 * 24 * 2,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle2'),
        (SELECT Id FROM Drivers WHERE Name = 'Jane'),
        '2021-01-01 12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle3'),
        (SELECT Id FROM Drivers WHERE Name = 'Jack'),
        '2021-01-02 12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Timisoara' AND Destination_location = 'Bucharest'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle3'),
        (SELECT Id FROM Drivers WHERE Name = 'Jack'),
        '2021-01-05 12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Timisoara' AND Destination_location = 'Bucharest'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle3'),
        (SELECT Id FROM Drivers WHERE Name = 'Jack'),
        '2021-01-07 12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Bucharest' AND Destination_location = 'Brasov'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle4'),
        (SELECT Id FROM Drivers WHERE Name = 'Jill'),
        '2021-01-01 12:00',
        180,
        1000),

       ((SELECT Id FROM Trips WHERE Departure_location = 'Brasov' AND Destination_location = 'Bucharest'),
        (SELECT Id FROM Vehicles WHERE Name = 'Vehicle4'),
        (SELECT Id FROM Drivers WHERE Name = 'Jill'),
        '2021-01-03 12:00',
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
go

-- 2. Il numero di viaggi e il totale di giorni di impegno per ogni mezzo

SELECT v.Name,
       COUNT(*)                                                                AS Trips,
       SUM(DATEDIFF(DAY, Departure, DATEADD(MINUTE, Duration, Departure)) + 1) AS Total_Days_Used
FROM Trips_Vehicles_Drivers tvd
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
GROUP BY v.Name
go


-- 3. La percentuale di giorni di utilizzo di ogni pulman (su totale viaggi)

SELECT v.Name,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Trips_Vehicles_Drivers) AS Percentage
FROM Trips_Vehicles_Drivers tvd
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
GROUP BY v.Name
go

-- 4. L’elenco dei viaggi più richiesti con la media di numero di giorni per viaggio,
-- order by average days

SELECT t.Departure_location,
       t.Destination_location,
       AVG(DATEDIFF(DAY, tvd.Departure, DATEADD(MINUTE, tvd.Duration, tvd.Departure)) + 1) AS Avg_Days
--        COUNT(*)                                                                            AS Num_Trips
FROM Trips_Vehicles_Drivers tvd
         JOIN Trips t ON tvd.Trip_id = t.Id
GROUP BY t.Departure_location, t.Destination_location
ORDER BY Avg_Days DESC
go

-- 4b. L’elenco dei viaggi più richiesti con la media di numero di giorni per viaggio,
--     order by number of trips

SELECT t.Departure_location,
       t.Destination_location,
       AVG(DATEDIFF(DAY, tvd.Departure, DATEADD(MINUTE, tvd.Duration, tvd.Departure)) + 1) AS Avg_Days,
       COUNT(*)                                                                            AS Num_Trips
FROM Trips_Vehicles_Drivers tvd
         JOIN Trips t ON tvd.Trip_id = t.Id
GROUP BY t.Departure_location, t.Destination_location
ORDER BY Num_Trips DESC
go

-- 4c. L’elenco dei viaggi più richiesti con la media di numero di giorni per viaggio,
--     order by number of trips. Add the trip ID

SELECT t.Id                                                                                AS Trip_id,
       t.Departure_location,
       t.Destination_location,
       AVG(DATEDIFF(DAY, tvd.Departure, DATEADD(MINUTE, tvd.Duration, tvd.Departure)) + 1) AS Avg_Days,
       COUNT(*)                                                                            AS Num_Trips
FROM Trips_Vehicles_Drivers tvd
         JOIN Trips t ON tvd.Trip_id = t.Id
GROUP BY t.Id, t.Departure_location, t.Destination_location
ORDER BY Num_Trips DESC
go

-- 5. Determinare il periodo con maggior numero di viaggi pianificati

SELECT DATEPART(YEAR, tvd.Departure)  AS Year,
       DATEPART(MONTH, tvd.Departure) AS Month,
       COUNT(*)                       AS Num_Trips
FROM Trips_Vehicles_Drivers tvd
GROUP BY DATEPART(YEAR, tvd.Departure), DATEPART(MONTH, tvd.Departure)
ORDER BY Num_Trips DESC
go

-- 6. Creare una funzione che dato il periodo (Partenza/Arrivo) mi determini
--    l’eventuale disponibilità di organizzare il viaggio ( Autista + Mezzo )
-- create a function that returns the availability of a vehicle and driver for a given period

-- we start by creating a function that returns all occupied vehicles and drivers in trips
-- we can the filter by period and check which drivers and vehicles are not present in the list

IF OBJECT_ID(N'GetOccupied', N'FN') IS NOT NULL
    BEGIN
        DROP FUNCTION GetOccupied
    END
go

CREATE FUNCTION GetOccupied(@Departure DATETIME, @Duration INT)
    RETURNS TABLE
        AS
        RETURN
        SELECT t.Departure_location,
               t.Destination_location,
               tvd.Departure,
               tvd.Duration,
               t.Id           as Trip_id,
               v.Name         AS Vehicle,
               d.Name         AS Driver,
               tvd.Driver_id  AS Driver_id,
               tvd.Vehicle_id AS Vehicle_id
        FROM Trips_Vehicles_Drivers tvd
                 JOIN Trips t ON tvd.Trip_id = t.Id
                 JOIN Vehicles v ON tvd.Vehicle_id = v.Id
                 JOIN Drivers d ON tvd.Driver_id = d.Id
-- filter by period
        WHERE tvd.Departure >= @Departure
          AND tvd.Departure <= DATEADD(MINUTE, @Duration, @Departure)
go

-- test the function

SELECT *
FROM GetOccupied('2021-01-01 12:00', 180)
go

-- 6a

-- create a function that checks the availability using the previous function GetOccupied
-- we want to list all vehicles not in the occupied list,
-- then all drivers not in the occupied list
-- join at the end the two lists to make a table with all available vehicles and drivers


-- step 1, get drivers available

IF OBJECT_ID(N'GetDriversAvailability', N'FN') IS NOT NULL
    BEGIN
        DROP FUNCTION GetDriversAvailability
    END
go

CREATE FUNCTION GetDriversAvailability(@Departure DATETIME, @Duration INT)
    RETURNS TABLE
        AS
        RETURN
        SELECT d.Name AS Driver,
               d.Id   AS Driver_id
        FROM Drivers d
        WHERE d.Id NOT IN (SELECT Driver_id
                           FROM GetOccupied(@Departure, @Duration))
go


SELECT *
FROM GetDriversAvailability('2021-01-09 12:00', 180)
go

-- step 2, get vehicles available

IF OBJECT_ID(N'GetVehiclesAvailability', N'FN') IS NOT NULL
    BEGIN
        DROP FUNCTION GetVehiclesAvailability
    END
go

CREATE FUNCTION GetVehiclesAvailability(@Departure DATETIME, @Duration INT)
    RETURNS TABLE
        AS
        RETURN
        SELECT v.Name AS Vehicle,
               v.Id   as Vehicle_id
        FROM Vehicles v
        WHERE v.Id NOT IN (SELECT Vehicle_id
                           FROM GetOccupied(@Departure, @Duration))
go


SELECT *
FROM GetVehiclesAvailability('2021-01-09 12:00', 180)
go

-- step 3, show the available vehicles and drivers ( combination of all )

IF OBJECT_ID(N'GetAvailability', N'FN') IS NOT NULL
    BEGIN
        DROP FUNCTION GetAvailability
    END
go

CREATE FUNCTION GetAvailability(@Departure DATETIME, @Duration INT)
    RETURNS TABLE
        AS
        RETURN
        SELECT v.Vehicle AS Vehicle,
               d.Driver  AS Driver
        FROM GetVehiclesAvailability(@Departure, @Duration) v
                 JOIN GetDriversAvailability(@Departure, @Duration) d ON 1 = 1
go


SELECT *
FROM GetAvailability('2021-01-09 12:00', 180)
go

-- ### TESTS to make it work

SELECT v.Name AS Vehicle,
       d.Name AS Driver
FROM Trips_Vehicles_Drivers tvd
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
         JOIN Drivers d ON tvd.Driver_id = d.Id
WHERE tvd.Departure > '2021-01-07 12:00'
  AND tvd.Departure < DATEADD(MINUTE, 180, '2021-01-07 12:00')
go

-- this function returns all occupied vehicles and drivers in trips,
-- together with the departure time and duration of the trip
-- we can use it to check if a vehicle and a driver are available for a given period

-- we want to list all drivers and vehicles not present in a filtered list

SELECT t.Departure_location,
       t.Destination_location,
       tvd.Departure,
       tvd.Duration,
       t.Id   as Trip_id,
       v.Name AS Vehicle,
       d.Name AS Driver
FROM Trips_Vehicles_Drivers tvd
         JOIN Trips t ON tvd.Trip_id = t.Id
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
         JOIN Drivers d ON tvd.Driver_id = d.Id
-- filter by period, test adding filter
WHERE tvd.Departure >= '2021-01-01 12:00'
  AND tvd.Departure <= DATEADD(MINUTE, 180, '2021-01-07 12:00')
go

-- 6b. create a function that returns all the trips

IF OBJECT_ID(N'GetTrips', N'FN') IS NOT NULL
    BEGIN
        DROP FUNCTION GetTrips
    END
go

CREATE FUNCTION GetTrips()
    RETURNS TABLE
        AS
        RETURN
        SELECT t.Departure_location,
               t.Destination_location,
               tvd.Departure,
               tvd.Duration,
               t.Id   as Trip_id,
               v.Name AS Vehicle,
               d.Name AS Driver
        FROM Trips_Vehicles_Drivers tvd
                 JOIN Trips t ON tvd.Trip_id = t.Id
                 JOIN Vehicles v ON tvd.Vehicle_id = v.Id
                 JOIN Drivers d ON tvd.Driver_id = d.Id
go


SELECT *
FROM GetTrips()
go
