Select FirstName, LEN(FirstName) as FirstNameLength, SUBSTRING(FirstName, 2, 3) From Employees

Select REPLACE(Region, 'g', 'shki') From BusinessEntities Where Id = 5

Select * From BusinessEntities

Select UPPER(FirstName), LOWER(LastName) From Employees

Select GETDATE()

Select GETUTCDATE()


DECLARE @city NVARCHAR(50) = 'Skopje';

SET @city = 'Skopje';

Select @city

DECLARE @number1 INT,
		@number2 INT;

SET @number1 = 1; 
SET @number2 = 2;

Select @number1, @number2