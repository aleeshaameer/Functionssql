alter table persons
add dob date;
use library;
alter table persons
add dob date;
CREATE FUNCTION dbo.CalculateAge (@DOB DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;

    SET @Age = DATEDIFF(YEAR, @DOB, GETDATE());
    
    -- Adjust if birthday has not occurred yet this year
    IF (MONTH(@DOB) > MONTH(GETDATE())) OR 
       (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
    BEGIN
        SET @Age = @Age - 1;
    END

    RETURN @Age;
END;
SELECT 
    PersonID, 
    FirstName, 
    LastName, 
    DOB, 
    dbo.CalculateAge(DOB) AS Age
FROM 
    Persons;
SELECT 
    CountryID, 
    CountryName, 
    LEN(CountryName) AS CountryNameLength
FROM 
    Country;
SELECT 
    CountryID, 
    CountryName, 
    LEFT(CountryName, 3) AS FirstThreeChars
FROM 
    Country;
SELECT 
    CountryID, 
    CountryName, 
    UPPER(CountryName) AS CountryNameUpper,
    LOWER(CountryName) AS CountryNameLower
FROM 
    Country;
