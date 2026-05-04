/*
	Create new procedure called CreateOrder
	1) Procedure should create only Order info (in table Order, not Order details) 
	2) Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
	3) Procedure should return second resultset with the total amount of all orders for the customer and business entity on input
*/

select getdate() as today
select * from dbo.[Order]
go

CREATE OR ALTER PROCEDURE dbo.usp_CreateOrder
(
	@CustomerId INT,
	@BusinessEntityId INT,
	@EmployeeId INT,
	@TotalCustomerOrders INT OUT,
	@TotalCustomerBEOrders INT OUT
)
AS
BEGIN
	INSERT INTO dbo.[Order] (OrderDate, Status, BusinessEntityId, CustomerId, EmployeeId)
	VALUES (GETDATE(), 0, @BusinessEntityId, @CustomerId, @EmployeeId);

	SET @TotalCustomerOrders = (SELECT COUNT(*) FROM dbo.[Order] WHERE CustomerId = @CustomerId)

	SET @TotalCustomerBEOrders = (SELECT COUNT(*) FROM dbo.[Order] WHERE CustomerId = @CustomerId AND BusinessEntityId = @BusinessEntityId)
END
GO

DECLARE @TotalCustomerOrders INT, @TotalCustomerBEOrders INT

EXEC dbo.usp_CreateOrder
	@CustomerId = 4,
	@BusinessEntityId = 2343243,
	@EmployeeId = 1,
	@TotalCustomerOrders = @TotalCustomerOrders OUT,
	@TotalCustomerBEOrders = @TotalCustomerBEOrders OUT
	
SELECT @TotalCustomerOrders as TotalCustomerOrders, 
	@TotalCustomerBEOrders as TotalCustomerBEOrders

GO