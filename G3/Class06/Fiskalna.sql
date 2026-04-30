DECLARE @OrderId INT;
SET @OrderId = 2;
DECLARE @OrderDetails NVARCHAR(MAX)

SELECT @OrderDetails = 'ID: ' + CAST(Id as NVARCHAR(100)) + CHAR(13)+CHAR(10) + 'DATE: ' + CAST(OrderDate AS NVARCHAR(20)) + CHAR(13)+CHAR(10) + 'TOTAL PRICE: ' + CAST(TotalPrice AS nvarchar(100))
FROM Orders
WHERE Id = @OrderId

PRINT @OrderDetails

DECLARE @OrderItemsDetails NVARCHAR(MAX)

SELECT @OrderItemsDetails = STRING_AGG(p.[Name] + '(' + s.[Name] + ') ' + CAST(ps.Price AS NVARCHAR(100)) + '*' + CAST(oi.Quantity AS NVARCHAR(20)) + '=' + CAST(ps.Price*Quantity AS NVARCHAR(100)), CHAR(13)+CHAR(10))
FROM OrderItems oi
INNER JOIN PizzaSizes ps ON oi.PizzaSizeId = ps.Id
INNER JOIN Pizzas p ON ps.PizzaId = p.Id
INNER JOIN Sizes s on s.Id = ps.SizeId
WHERE oi.OrderId = @OrderId

PRINT '--------Order Items-----------' + CHAR(13)+CHAR(10) + @OrderItemsDetails

DECLARE @OrderItemsToppings NVARCHAR(MAX);

SELECT @OrderItemsToppings = STRING_AGG(t.[Name] + ' ' + CAST(t.Price AS NVARCHAR(100)) + '*' + CAST(oi.Quantity AS NVARCHAR(20)) + '=' + CAST(t.Price*Quantity AS NVARCHAR(100)), CHAR(13)+CHAR(10))
FROM OrderItems oi
INNER JOIN OrderItemToppings oit ON oi.Id = oit.OrderItemId
INNER JOIN Toppings t ON t.Id = oit.ToppingId
WHERE oi.OrderId = @OrderId

PRINT '--------Toppings-----------' + CHAR(13)+CHAR(10) + @OrderItemsToppings