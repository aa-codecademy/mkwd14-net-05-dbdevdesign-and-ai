--Create scalar function fn_FormatProductName
--Format:
--Second & third char from Code
--Last 3 chars from Name
--Product Price

CREATE FUNCTION fn_FormatProductName(@code NVARCHAR(50), @name NVARCHAR(100), @price decimal(18,2))
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @codeSubset NVARCHAR(2);
	SET @codeSubset = SUBSTRING(@code,2,2);

	DECLARE @nameSubset NVARCHAR(3);
	SET @nameSubset = RIGHT(@name, 3);

	DECLARE @priceAsString NVARCHAR(10);
	SET @priceAsString = CAST(@price AS NVARCHAR(10))

	RETURN @codeSubset + '-' + @nameSubset + '-' + @priceAsString
	--RETURN SUBSTRING(@code,2,2) + '-' + RIGHT(@name, 3) + '-' + CAST(@price AS NVARCHAR(10))
END

Select *, dbo.fn_FormatProductName(Code, [Name], Price) 
From Products