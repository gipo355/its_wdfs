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
