--Create procedure CreateOrder
--Insert order header only
--Return total orders per customer
--Return total amount per customer + business entity
--Insert few test orders

CREATE OR ALTER PROCEDURE sp_CreateOrder 
(
@BusinessEntity NVARCHAR(100),
@Customer NVARCHAR(100),
@Employee NVARCHAR(100),
@Comment NVARCHAR(MAX)
)
AS
BEGIN
	DECLARE @businessEntityId INT,
			@customerId INT,
			@employeeId INT;

	SELECT @businessEntityId = Id
	FROM BusinessEntities
	WHERE [Name] = @BusinessEntity

	SELECT @customerId = Id
	FROM Customers
	WHERE [Name] = @Customer

	SELECT @employeeId = Id
	FROM Employees
	WHERE (FirstName + ' ' + LastName) = @Employee

	INSERT INTO Orders (OrderDate, [Status], BusinessEntityId, CustomerId, EmployeeId, TotalPrice, Comment)
	VALUES (GETDATE(), 0, @businessEntityId, @customerId, @employeeId, 0, @Comment)

	Select Count(*) as TotalNumberOfOrdersForThatCustomer
	From Orders
	Where CustomerId = @customerId

	Select c.[Name] as Customer, be.[Name] as BusinessEntity, SUM(o.TotalPrice)
	From Orders o
	INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
	INNER JOIN Customers c ON o.CustomerId = c.Id
	Where CustomerId = @customerId
	Group by BusinessEntityId, be.[Name], c.[Name]
END

EXECUTE sp_CreateOrder @BusinessEntity = 'Vitalia Bitola', 
						@Customer = 'Zegin Bitola', 
						@Employee = 'Valentina Zdravevski',
						@Comment = 'My second order'