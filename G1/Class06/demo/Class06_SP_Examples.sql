USE [SEDC]
GO

-- ====> Example 1: Get Employees by Gender and their count

SELECT * FROM dbo.Employee
GO

CREATE OR ALTER PROCEDURE usp_GetEmployeesByGender
(
	@Gender NCHAR = 'M',
	@GenderCount INT OUT
)
AS
BEGIN
	SELECT * FROM dbo.Employee
	WHERE Gender = @Gender

	SELECT @GenderCount = COUNT(Id)
	FROM dbo.Employee
	WHERE Gender = @Gender
END
GO

DECLARE @GenderCountResult INT
EXECUTE usp_GetEmployeesByGender @GenderCount = @GenderCountResult OUT;
SELECT @GenderCountResult as GenderCount


-- ====> Example 2: Find Product Details (Name, Description, Price) for specific Product (by Product Name)
-- Return the Product price and total quantity of the ordered items for the product

SELECT * FROM [dbo].[Product]
SELECT * FROM [dbo].[OrderDetails]
GO

CREATE OR ALTER PROCEDURE usp_FindProductDetailsByName
(
	@ProductName NVARCHAR(100),
	@ProductPrice DECIMAL(18, 2) OUTPUT,
	@TotalQuantity INT OUTPUT
)
AS
BEGIN
	-- Select the product details
	SELECT 
		p.[Name] as ProductName,
		p.[Description] as ProductDescription,
		p.Price as ProductPrice
	FROM dbo.[Product] p
	WHERE p.[Name] = @ProductName

	-- Set ProductPrice output
	SELECT @ProductPrice = p.Price
	FROM dbo.[Product] p
	WHERE p.[Name] = @ProductName

	-- Set Product Quantity output
	SELECT @TotalQuantity = SUM(od.Quantity) FROM dbo.[Product] p
	JOIN dbo.OrderDetails od ON p.Id = od.ProductId
	WHERE p.[Name] = @ProductName

END
GO


DECLARE @ProductPrice DECIMAL (18, 2), @TotalQunatityResult INT, @TotalPrice DECIMAL(18, 2)
EXEC usp_FindProductDetailsByName 
	'Crunchy', 
	@ProductPrice OUTPUT, 
	@TotalQunatityResult OUT

SELECT @ProductPrice as 'Product Price', ISNULL(@TotalQunatityResult, 0) as 'Total Quantity'

SET @TotalPrice = @ProductPrice * @TotalQunatityResult 

SELECT @TotalPrice as 'Total Orders Price'
GO
