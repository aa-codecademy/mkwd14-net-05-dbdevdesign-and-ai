CREATE OR ALTER PROCEDURE Test
AS
BEGIN
	SELECT Id, FirstName, LastName From Employees
END


EXECUTE dbo.Test