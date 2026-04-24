CREATE OR ALTER PROCEDURE dbo.EmployeesByGender
AS
BEGIN
	SELECT *
	FROM Employees
	WHERE Gender = 'M'

	SELECT *
	FROM Employees
	WHERE GENDER = 'F'
END

EXECUTE dbo.EmployeesByGender