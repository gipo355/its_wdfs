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

