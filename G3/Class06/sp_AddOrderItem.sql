CREATE OR ALTER PROCEDURE sp_AddOrderItem (
	@OrderId INT,
	@PizzaSizeId INT,
	@Quantity INT,
	@Toppings NVARCHAR(100) --1, 2, 3 (we expect the toppings to arrive as string list split with ,)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @orderItemId INT;
		DECLARE @Item INT;
		DECLARE @Pos INT;

		INSERT INTO OrderItems (PizzaSizeId, Quantity, OrderId)
		VALUES (@PizzaSizeId, @Quantity, @OrderId)

		SET @orderItemId = SCOPE_IDENTITY();

		SET @Toppings = REPLACE(@Toppings, ' ', '') --1,2,3

		CREATE TABLE #Toppings (Value INT)

		-- Split by comma and insert into temp table
		WHILE LEN(@Toppings) > 0
		BEGIN
			SET @Pos = CHARINDEX(',', @Toppings)

			IF @Pos > 0
			BEGIN
				SET @Item = CAST(LEFT(@Toppings, @Pos - 1) AS INT)
				SET @Toppings = SUBSTRING(@Toppings, @Pos + 1, LEN(@Toppings))
			END
			ELSE
			BEGIN
				SET @Item = CAST(@Toppings AS INT)
				SET @Toppings = ''
			END

			INSERT INTO #Toppings (Value) VALUES (@Item)
		END

		-- Loop through each element
		DECLARE @Current INT
		DECLARE cur CURSOR FOR SELECT Value FROM #Toppings

		OPEN cur
		FETCH NEXT FROM cur INTO @Current

		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO OrderItemToppings(OrderItemId, ToppingId)
			VALUES(@orderItemId, @Current)

			FETCH NEXT FROM cur INTO @Current
		END

		CLOSE cur
		DEALLOCATE cur

		DROP TABLE #Toppings

		--CALCULATE PRICES
		DECLARE @pizzaPrice decimal(18,2);
		DECLARE @toppingsPrice decimal(18,2);

		SELECT @pizzaPrice = (ps.Price * @Quantity)
		FROM PizzaSizes ps 
		WHERE Id = @PizzaSizeId

		SELECT @toppingsPrice = SUM(t.Price) * @Quantity
		FROM OrderItemToppings oit
		INNER JOIN Toppings t ON oit.ToppingId = t.Id
		WHERE oit.OrderItemId = @orderItemId

		DECLARE @orderItemPrice decimal(18,2);
		SET @orderItemPrice = @pizzaPrice + @toppingsPrice;

		UPDATE OrderItems SET Price = @orderItemPrice WHERE Id = @orderItemId

		DECLARE @orderTotalPrice decimal(18,2);

		SELECT @orderTotalPrice = SUM(Price)
		FROM OrderItems
		WHERE OrderId = @OrderId

		UPDATE Orders SET TotalPrice = @orderTotalPrice WHERE Id = @OrderId
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END

--USAGE:
EXECUTE sp_AddOrderItem @OrderId = 2, @PizzaSizeId = 3, @Quantity = 2, @Toppings = '1, 2' -- 500 x 2 + (50 + 30) x 2 = 1160
EXECUTE sp_AddOrderItem @OrderId = 2, @PizzaSizeId = 9, @Quantity = 1, @Toppings = '3' -- 380 + 70