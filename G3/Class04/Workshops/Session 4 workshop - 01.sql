--Declare scalar variable for storing FirstName
--Assign value 'Aleksandar'
--Find all Employees with that FirstName

DECLARE @firstName NVARCHAR(100) = 'Aleksandar';

Select *
From Employees
Where FirstName = @firstName

--Declare table variable (EmployeeId, DateOfBirth)
--Fill with all Female employees

DECLARE @FemaleEmployees TABLE (EmployeeId int, DateOfBirth date)

INSERT INTO @FemaleEmployees (EmployeeId, DateOfBirth)
Select Id, DateOfBirth
From Employees
Where Gender = 'F'

Select * From @FemaleEmployees

--Declare temp table (LastName, HireDate)
--Fill with Male employees with FirstName starting with 'A'

CREATE TABLE #MaleEmployees (LastName NVARCHAR(100), HireDate DATE)

INSERT INTO #MaleEmployees(LastName, HireDate)
Select LastName, HireDate
From Employees
Where Gender = 'M' AND FirstName LIKE 'A%'

Select * From #MaleEmployees

DROP TABLE #MaleEmployees

--Retrieve employees with LastName length = 7
Select *
From Employees
Where LEN(LastName) = 7