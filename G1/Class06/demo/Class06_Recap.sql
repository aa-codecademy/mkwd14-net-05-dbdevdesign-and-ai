USE [SEDC]
GO

-- =============== RECAP - Scalar Functions ===============

SELECT * FROM [dbo].[Employee]
GO

-- ===> Scalar Functions
SELECT dbo.fn_EmployeeFullName(3) AS 'Full Name'
GO

-- ===> Alter the function to return uppercased full name
CREATE OR ALTER FUNCTION [dbo].[fn_EmployeeFullName](@EmployeeId INT)
    RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @Result NVARCHAR(100)
    SELECT @Result = UPPER(CONCAT(FirstName, ' ', LastName))
    FROM [dbo].[Employee]
    WHERE Id = @EmployeeId

    RETURN @Result 
END
GO

-- ===> Assign the return value to a variable
DECLARE @EmployeeFullName NVARCHAR(100) = dbo.fn_EmployeeFullName(1)
SELECT @EmployeeFullName AS 'First Employee'
GO

DECLARE @EmployeeFullName NVARCHAR(100)
SET @EmployeeFullName = dbo.fn_EmployeeFullName(2)
SELECT @EmployeeFullName AS SecondEmployee
GO


-- ===> Write function to insert new employee (CANNOT BE DONE WITH SCALAR FUNCTIONS!)
CREATE OR ALTER FUNCTION dbo.fn_InsertEmployee
(
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NCHAR,
    @HireDate DATE,
    @NationalIdNumber NVARCHAR(20)
)
RETURNS INT
BEGIN
	-- CANNOT MANIPULATE WITH TABLES DATA OR DEFINITION(STRUCTURE) WITH SCALAR FUNCTIONS !!!
    INSERT INTO dbo.Employee (FirstName, LastName, DateOfBirth, HireDate, Gender, NationalIdNumber)
    VALUES (@FirstName, @LastName, @DateOfBirth, @HireDate, @Gender, @NationalIdNumber)

    RETURN SCOPE_IDENTITY();
END
GO


-- SCOPE_IDENTITY() example
SELECT * FROM dbo.Employee
INSERT INTO dbo.Employee (FirstName, LastName, DateOfBirth, HireDate, Gender, NationalIdNumber)
    VALUES ('Boba', 'Bobsky', GETUTCDATE(), GETUTCDATE(), 'M', '111')
SELECT SCOPE_IDENTITY() AS LastAddedItemId