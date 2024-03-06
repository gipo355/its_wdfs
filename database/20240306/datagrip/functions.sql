/*
    CREARE UNA FUNCTION CHE DATO IN INGRESSO IL TITOLO DI UN LIBRO
    CALCOLI I GIORNI MEDI DI PRESTITO DEL LIBRO
*/
ALTER FUNCTION udfAVGPrestito
(
    @Titolo VARCHAR(100)
)
RETURNS DECIMAL(6,2)
AS
BEGIN
    DECLARE @ret DECIMAL(6,2)
    DECLARE @tmpNrCopie INT
    SET @tmpNrCopie = (SELECT NrCopie FROM tblLibri WHERE Titolo=@Titolo)
    IF (@tmpNrCopie IS NULL) SET @tmpNrCopie = 0

    IF @tmpNrCopie > 0
    BEGIN
        SET @ret = (
                SELECT AVG(DATEDIFF(DAY,DataMovimento,DataRientro)) GGMedia
                FROM viewMovimenti
                WHERE Titolo=@Titolo AND NOT DataRientro IS NULL
                )
    END
    ELSE
        SET @ret = 0
    RETURN @ret
END
