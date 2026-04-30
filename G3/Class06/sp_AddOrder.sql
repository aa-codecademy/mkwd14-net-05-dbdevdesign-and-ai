CREATE OR ALTER PROCEDURE sp_AddOrder (
	@UserId INT,
	@Comment NVARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO dbo.Orders(UserId, Comment)
	VALUES (@UserId, @Comment)
END

--Usage
EXECUTE dbo.sp_AddOrder @UserId = 1, @Comment = N'Ve molam ako moze povekje kecap'