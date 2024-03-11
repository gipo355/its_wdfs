-- 6. Creare una funzione che dato il periodo (Partenza/Arrivo) mi determini
--    l’eventuale disponibilità di organizzare il viaggio ( Autista + Mezzo )

-- we can the filter by period and check which drivers and vehicles are not present in the list

DROP FUNCTION GetOccupied
DROP FUNCTION GetTrips
DROP FUNCTION GetVehiclesAvailability
DROP FUNCTION GetDriversAvailability
DROP FUNCTION GetAvailability
go

-- 6a
-- we want to list all vehicles not in the occupied list,
-- then all drivers not in the occupied list
-- join at the end the two lists to make a table with all available vehicles and drivers

-- step 1
-- we start by creating a function that returns all occupied vehicles and drivers in trips
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


-- step 2, get drivers available using getoccupied
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

-- step 2, get vehicles available
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

-- step 3, show the available vehicles and drivers ( combination of all )
CREATE FUNCTION GetAvailability(@Departure DATETIME, @Duration INT)
    RETURNS TABLE
        AS
        RETURN
        SELECT v.Vehicle AS Vehicle,
               d.Driver  AS Driver
        FROM GetVehiclesAvailability(@Departure, @Duration) v
                 JOIN GetDriversAvailability(@Departure, @Duration) d ON 1 = 1
go

-- 6b. create a function that returns all the trips
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

-- test the functions

SELECT *
FROM GetOccupied('2021-01-01 12:00', 180)
go

SELECT *
FROM GetDriversAvailability('2021-01-09 12:00', 180)
go

SELECT *
FROM GetVehiclesAvailability('2021-01-09 12:00', 180)
go

SELECT *
FROM GetAvailability('2021-01-09 12:00', 180)
go

SELECT *
FROM GetTrips()
go

-- ### TESTS done to make it work, not part of the solution

SELECT v.Name AS Vehicle,
       d.Name AS Driver
FROM Trips_Vehicles_Drivers tvd
         JOIN Vehicles v ON tvd.Vehicle_id = v.Id
         JOIN Drivers d ON tvd.Driver_id = d.Id
WHERE tvd.Departure > '2021-01-07 12:00'
  AND tvd.Departure < DATEADD(MINUTE, 180, '2021-01-07 12:00')
go

-- this returns all occupied vehicles and drivers in trips,
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

