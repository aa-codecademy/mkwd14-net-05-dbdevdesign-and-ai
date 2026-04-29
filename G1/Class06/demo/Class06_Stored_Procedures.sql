USE SEDC
GO

-- ================ STORED PROCEDURES ================

-- ============== Scalar Functions vs Stored Procedures  ==============

-- *** Scalar Functions ***
-- The only statement that we can use is SELECT 
-- Must return a single value
-- Cannot modify tables data, nor tables definitions (structure)
-- Primarily used for data transformation and calculation within SQL queries

-- *** Stored Procedures ***
-- Can manipulate with both tables data and tables definitions (structure) and even create new db objects 
-- All statements can be used (SELECT, DROP, ALTER, CREATE, DELETE, INSERT, UPDATE etc...)
-- Doesn't need to return value
-- Can return multiple values
-- More suitable for complex operations and *PERFORMANCE IMPROVEMENTS* (important takeaway)


-- ====> Example: Return all Employees

SELECT * FROM dbo.Employee
GO

CREATE OR ALTER PROCEDURE usp_GetAllEmployees
AS 
BEGIN
	SELECT * FROM dbo.Employee
END
GO

-- ===> Caling the procedure [dbo].[usp_GetAllEmployees]
EXECUTE [dbo].[usp_GetAllEmployees]
EXEC [dbo].[usp_GetAllEmployees]
GO

-- ====> Example: Get Employee by Id

CREATE OR ALTER PROCEDURE usp_GetEmployeeById
	@EmployeeId INT
AS
BEGIN
	SELECT * FROM dbo.Employee e
	WHERE @EmployeeId = e.Id
END
GO

-- ===> Calling usp_GetEmployeeById
EXEC usp_GetEmployeeById 10
EXEC usp_GetEmployeeById @EmployeeId = 20

--EXEC usp_GetEmployeeById 10, 30 -- ERROR! Too many arguments


-- ====> Example: Insert new Employee 
CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NCHAR,
    @HireDate DATE,
    @NationalIdNumber NVARCHAR(20)
)
AS
BEGIN
    INSERT INTO dbo.Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
    VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

    SELECT * FROM dbo.Employee
END
GO

EXEC dbo.usp_InsertEmployee 
    @FirstName = 'Sara',
    @LastName = 'Doe',
    @NationalIdNumber = '11111111',
    @Gender = 'F',
    @HireDate = '2020-12-5',
    @DateOfBirth = '1990-10-10' -- when using named arguments, the order doesn't metter
GO
    

-- ====> Alter the usp_InsertEmployee procedure to Return the Id of the new Employee

CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NCHAR,
    @HireDate DATE,
    @NationalIdNumber NVARCHAR(20),
    --@LastEmployeeId INT OUTPUT
    @LastEmployeeId INT OUT
    -- using the OUT(OUTPUT) we set the parameters that we are going to use as return values
)
AS
BEGIN
    INSERT INTO dbo.Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
    VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

    SELECT * FROM dbo.Employee

    SET @LastEmployeeId = SCOPE_IDENTITY();
    --SCOPE_IDENTITY() - Returns the last identity value inserted into an identity column in the same scope. 

    SELECT * FROM dbo.Employee
    WHERE Id = @LastEmployeeId
END
GO


DECLARE @EmployeeIdResult INT
--GO -- BE CAREFUL WHEN SEPARATING THE QUERIES TO BATCHES WITH 'GO' !!!

EXEC dbo.usp_InsertEmployee
    @FirstName = 'Jessica 4',
    @LastName = 'Doe',
    @NationalIdNumber = '11111111',
    @Gender = 'F',
    @HireDate = '2020-12-5',
    @DateOfBirth = '1990-10-10',
    @LastEmployeeId = @EmployeeIdResult OUT

SELECT @EmployeeIdResult AS [Last Employee Id]
GO
