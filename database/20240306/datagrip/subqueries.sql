DECLARE @TitoloLibro VARCHAR(50)

SET @TitoloLibro = 'Il nome della Rosa'

-- Voglio sapere se il libro @TitoloLibro è disponibile al prestito

/*
SELECT *,
    (
    SELECT COUNT(*) NrCopiePrestate FROM viewMovimenti
        WHERE DataRientro IS NULL AND Titolo=@TitoloLibro
    ) CopiePrestate

FROM viewLibri
    WHERE Titolo=@TitoloLibro
*/
SELECT Titolo ,
    CASE WHEN NrCopie-CopiePrestate >0 THEN 'Disponibile' ELSE 'NON Disponibile' END Stato
FROM
(
SELECT *,
    (
    SELECT COUNT(*) NrCopiePrestate FROM viewMovimenti
        WHERE DataRientro IS NULL AND Titolo=@TitoloLibro
    ) CopiePrestate

FROM viewLibri
    WHERE Titolo=@TitoloLibro
) AS TBL
