CREATE FUNCTION getAvailability(@startDate DATE, @endDate DATE)
    RETURNS varchar(max)
AS
BEGIN
    -- create a variable to hold the result
    declare @result varchar(max)
    --     declare @startDate DATE
--     declare @endDate DATE
--     SET @StartDate = '2019-01-01'
--     SET @EndDate = '2019-01-31'

--     SET @totDrivers
--     SELECT DISTINCT Id
--     from Drivers
--     where @StartDate between StartDate and EndDate

end

-- generate a function returning a table
create function name(@parameters INT, @parameters2 INT)
    returns @tbl table
                 (
                     column1 INT,
                     column2 INT
                 )
as
begin
    insert into Drivers (name, license) values (1, 2)
    --         return
--         select *
--         from Drivers
    update Drivers set name = 1 where id = 1
    return
end
go

-- PROCEDURES

create procedure myIntProcedure
as
begin
    select * from Drivers
end
go

exec myIntProcedure
go
-- no feedback, exec instructions