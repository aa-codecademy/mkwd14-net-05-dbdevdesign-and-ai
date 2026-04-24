CREATE OR ALTER PROCEDURE dbo.FindProduct
(
	@SearchCriteria NVARCHAR(100),
	@ProductCount INT OUTPUT
)
AS
BEGIN
	SELECT *
	FROM Products
	WHERE [Name] LIKE '%' + @SearchCriteria + '%'

	SET @ProductCount = @@ROWCOUNT

	--SELECT @ProductCount = Count(*)
	--FROM Products
	--WHERE [Name] LIKE '%' + @SearchCriteria + '%'
END

--Usage
DECLARE @total INT = 0

EXECUTE dbo.FindProduct @SearchCriteria = 'bar', @ProductCount = @total OUTPUT

SELECT @total
--
