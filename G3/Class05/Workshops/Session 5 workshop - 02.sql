--Create procedure CreateOrderDetail
--Take price from Product table
--Insert order detail
--Update TotalPrice in Orders
--Return ProductName + TotalPrice per product

CREATE OR ALTER PROCEDURE sp_CreateOrderDetail
(
@OrderId INT,
@Product NVARCHAR(100),
@Quantity INT
)
AS
BEGIN
	DECLARE @productId INT,
			@productPrice DECIMAL(18,2),
			@orderTotalPrice DECIMAL(18,2),
			@productName NVARCHAR(100)

	SELECT @productId = Id, @productPrice = Price, @productName = [Name]
	FROM Products
	WHERE [Name] = @Product

	INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price)
	VALUES (@OrderId, @productId, @Quantity, @productPrice * @Quantity)

	SELECT @orderTotalPrice = SUM(Price)
	FROM OrderDetails
	WHERE OrderId = @OrderId

	UPDATE Orders SET TotalPrice = @orderTotalPrice WHERE Id = @OrderId

	SELECT @productName + ' x ' + CAST(@Quantity AS NVARCHAR(50)) + ' = ' + CAST((@productPrice * @Quantity) AS NVARCHAR(100))
	--PRINT @productName + ' x ' + CAST(@Quantity AS NVARCHAR(50)) + ' = ' + CAST((@productPrice * @Quantity) AS NVARCHAR(100))
END

EXECUTE sp_CreateOrderDetail @OrderId = 4208, @Product = 'Crunchy', @Quantity = 2

--Online Shopping Cart #1
-- Bar x 5 = 100
-- Musli x 2 = 200
-- Crunchy x 3 = 600
--Total 900
