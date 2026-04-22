-- Function creation template

--CREATE FUNCTION fn_EmployeeFullName (@EmployeeId int)
--RETURNS nvarchar(100)
--AS
--BEGIN
--END
--GO



CREATE FUNCTION fn_EmployeeFullName (@EmployeeId int)
RETURNS nvarchar(100)
AS
BEGIN
	DECLARE @Result NVARCHAR(100)

	SELECT @Result = FirstName + ' ' + LastName
	FROM Employees
	WHERE Id = @EmployeeId

	RETURN @Result
END


select dbo.fn_EmployeeFullName(1) as FullName

select dbo.fn_EmployeeFullName(10) as FullName

select dbo.fn_EmployeeFullName(12) as FullName

