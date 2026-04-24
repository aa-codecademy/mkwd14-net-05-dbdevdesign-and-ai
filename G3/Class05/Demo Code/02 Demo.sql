CREATE OR ALTER PROCEDURE dbo.sp_DeleteBusinessEntity(@BusinessEntityId INT)
AS
BEGIN
	DELETE
	FROM OrderDetails
	Where Id IN 
	(
		Select od.Id 
		From OrderDetails od
		INNER JOIN Orders o ON od.OrderId = o.Id
		Where BusinessEntityId = @BusinessEntityId
	)

	DELETE
	FROM Orders
	WHERE BusinessEntityId = @BusinessEntityId

	DELETE
	FROM BusinessEntities
	WHERE Id = @BusinessEntityId
END

EXECUTE dbo.sp_DeleteBusinessEntity @BusinessEntityId = 6