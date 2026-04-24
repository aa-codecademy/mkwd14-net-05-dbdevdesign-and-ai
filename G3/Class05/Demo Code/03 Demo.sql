CREATE OR ALTER PROCEDURE dbo.NewCustomer
(
	@Name NVARCHAR(100),
	@AccountNumber NVARCHAR(100) = NULL,
	@City NVARCHAR(100),
	@RegionName NVARCHAR(100)
)
AS
BEGIN
	INSERT INTO Customers ([Name], AccountNumber, City, RegionName, IsActive)
	VALUES(@Name, @AccountNumber, @City, @RegionName, 1)

	Select COUNT(*) AS TotalCustomers
	From Customers

	Select COUNT(*) AS TotalCustomersInThatRegion
	From Customers
	Where RegionName = @RegionName
END

EXECUTE dbo.NewCustomer @Name = 'Kam 3', @AccountNumber = '12345', @City = 'Ohrid', @RegionName = 'Ohridski'