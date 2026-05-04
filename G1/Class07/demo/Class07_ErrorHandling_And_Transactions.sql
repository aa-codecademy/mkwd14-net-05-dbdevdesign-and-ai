-- ====================== ERROR HANDLING ======================

-- TRY...CATCH lets us DETECT and RESPOND to runtime errors instead of letting the script crash.

-- HOW it works:
--   - Code inside BEGIN TRY ... END TRY is the "happy path"
--   - If ANY error occurs there, execution jumps immediately
--     to the BEGIN CATCH ... END CATCH block
--   - Inside CATCH we can read error details with built-in
--     functions like ERROR_MESSAGE(), ERROR_NUMBER(), Rollback the transaction etc.

-- WITHOUT TRY...CATCH, an error simply stops execution and the user sees a raw system error message.


-- ----- Example: Catching a divide-by-zero error -----

SELECT 1/0 AS Result

BEGIN TRY
    -- This will cause an error: division by zero
	SELECT 1/0 AS Result
	PRINT 'Yey, we divided by zero!'
END TRY
BEGIN CATCH
    -- This runs because an error happened above
	PRINT 'An error occured'
    SELECT
	ERROR_NUMBER() AS ErrorNumber,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage
END CATCH
GO


-- ====================== TRANSACTIONS ======================

-- WHAT is a TRANSACTION ?
-- A Transaction is a group of SQL statements that are treated as a single unit of work. 
-- Either ALL statements succeed,or NONE of them are applied to the database.

-- WHY do we use transactions?
--		===> To keep data CONSISTENT. 
--		If we insert an Order and its OrderDetails, we don't want the Order saved but the details lost 
--		because of a failure halfway through.
--		===> To ensure INTEGRITY across related tables.

-- WHEN do we use transactions?
--   - When we need to modify MORE THAN ONE TABLE (or more
--     than one row) and the changes depend on each other.
--   - Inserts that span parent + child tables
--   - Transferring data (e.g. updating stock AND recording a sale)
--   - Any operation where a partial result would be worse
--     than no result at all.

-- KEY COMMANDS:
--   BEGIN TRANSACTION  – starts the transaction
--   COMMIT             – saves all changes permanently
--   ROLLBACK           – undoes all changes since BEGIN TRANSACTION


-- ----- Example 1: Without a transaction -----
-- Each statement is saved IMMEDIATELY and independently.

INSERT INTO Customer (Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
VALUES ('Test Customer A', 'ACC-001', 'Skopje', 'Skopje', 'Small', '070000001', 1);
GO

INSERT INTO Customer (Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
VALUES ('Test Customer B', 'ACC-002', 'Bitola', 'Pelagonia', 'Medium', '070000002');


-- ----- Example 2: With a transaction -----
-- Now both inserts are grouped together.

BEGIN TRANSACTION;

    INSERT INTO Customer (Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
    VALUES ('Test Customer C', 'ACC-003', 'Ohrid', 'Southwest', 'Small', '070000003', 1);

    INSERT INTO Customer (Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
    VALUES ('Test Customer D', 'ACC-004', 'Tetovo', 'Polog', 'Large', '070000004', 1);

COMMIT;
GO
-- If the second INSERT fails, the first one is ALREADY saved.
-- We can't undo it. That might be a problem.



-- ====================== EXAMPLE: PROCEDURE WITH ERROR HANDLING AND TRANSACTION ======================

-- 1) Example: WITHOUT error handling & transaction

-- This version WORKS when everything is correct,
-- but if anything fails, we get raw errors and
-- the database can end up in a broken state
-- (order saved, but no details... or vice versa).

CREATE OR ALTER PROCEDURE usp_CreateOrderWithDetails
(
    @CustomerId INT,
	@BusinessEntityId INT,
	@EmployeeId INT,
    @ProductId INT,
    @Quantity INT,
    @Price DECIMAL(18,2),
    @Comment NVARCHAR(200)
)
AS
BEGIN
    -- Step 1: Create the order
    INSERT INTO [Order] (OrderDate, Status, BusinessEntityId, CustomerId, EmployeeId, TotalPrice, Comment)
    VALUES (GETUTCDATE(), 0, @BusinessEntityId, @CustomerId, @EmployeeId, 0, @Comment)

    DECLARE @LastOrderId INT = SCOPE_IDENTITY();
        
    -- Step 2: Add the details
    INSERT INTO dbo.OrderDetails (OrderId, ProductId, Quantity, Price)
    VALUES (@LastOrderId, @ProductId, @Quantity, @Price)

    -- Step 3: Update total price 
    UPDATE [Order]
    SET TotalPrice = @Quantity * @Price
    WHERE Id = @LastOrderId
END
GO

-- ----- Test: This works fine -----
EXEC usp_CreateOrderWithDetails
    @CustomerId = 1,
    @EmployeeId = 1,
    @BusinessEntityId = 1,
    @ProductId = 1,
    @Quantity = 10,
    @Price = 24.99,
    @Comment = 'This will work !!!!!!!!';
GO

select * from dbo.[Order] 
order by id desc
select * from dbo.[OrderDetails] 
order by id desc

-- ----- Test: This FAILS -----
EXEC usp_CreateOrderWithDetails
    @CustomerId = 1,
    @EmployeeId = 1,
    @BusinessEntityId = 1,
    @ProductId = 9999999,   -- doesn't exist!
    @Quantity = 10,
    @Price = 24.99,
    @Comment = 'This will NOT work !';
GO

-- PROBLEM: The Order WAS inserted (Step 1 succeeded),
-- but OrderDetails failed (Step 2, FK violation).
-- Now we have an Order with NO details in the database!
-- This is BROKEN DATA. No rollback, no error info, nothing.
SELECT * FROM [Order] WHERE Comment = 'This will NOT work !';
GO


-- 2) Example: WITH error handling & transaction

-- ===> THE FIX => Using Try-Catch and Transactions
CREATE OR ALTER PROCEDURE usp_CreateOrderWithDetails
(
    @CustomerId INT,
	@BusinessEntityId INT,
	@EmployeeId INT,
    @ProductId INT,     
    @Quantity INT,
    @Price DECIMAL(18,2),
    @Comment NVARCHAR(200)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION 
            -- Step 1: Create the order
            INSERT INTO [Order] (OrderDate, Status, BusinessEntityId, CustomerId, EmployeeId, TotalPrice, Comment)
            VALUES (GETUTCDATE(), 0, @BusinessEntityId, @CustomerId, @EmployeeId, 0, @Comment)

            DECLARE @LastOrderId INT = SCOPE_IDENTITY();
        
            -- Step 2: Add the details
            INSERT INTO dbo.OrderDetails (OrderId, ProductId, Quantity, Price)
            VALUES (@LastOrderId, @ProductId, @Quantity, @Price)

            -- Step 3: Update total price 
            UPDATE [Order]
            SET TotalPrice = @Quantity * @Price
            WHERE Id = @LastOrderId
        COMMIT
        PRINT 'Order created successfully!'
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Order FAILED successfully!'
    END CATCH
END
GO


-- ----- Test again: This still works -----
EXEC usp_CreateOrderWithDetails
    @CustomerId = 1,
    @EmployeeId = 1,
    @BusinessEntityId = 1,
    @ProductId = 1,
    @Quantity = 10,
    @Price = 24.99,
    @Comment = 'Safe version - works!';


-- ----- Test again: Now failure is SAFE -----
EXEC usp_CreateOrderWithDetails
    @CustomerId = 1,
    @EmployeeId = 1,
    @BusinessEntityId = 1,
    @ProductId = 999999,
    @Quantity = 3,
    @Price = 9.99,
    @Comment = 'Safe version - will rollback cleanly';


-- NOW: No broken Order in the database!
-- If something fails, the TRANSACTION + ROLLBACK
-- would undo everything. The database stays clean.
