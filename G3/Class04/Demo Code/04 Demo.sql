CREATE FUNCTION FullName(@firstName NVARCHAR(100), @lastName NVARCHAR(100), @gender NCHAR(1))
RETURNS NVARCHAR(205)
AS
BEGIN
	DECLARE @fullName NVARCHAR(201);
	SET @fullName = @firstName + ' ' + @lastName;

	DECLARE @prefix NVARCHAR(3);

	IF(@gender = 'M')
		BEGIN
			SET @prefix = 'Mr.'
		END
	ELSE
		BEGIN
			SET @prefix = 'Ms.'
		END

	RETURN @prefix + ' ' + @fullName
END;

Select dbo.FullName('Risto', 'Panchevski', 'M')

Select dbo.FullName(FirstName, LastName, Gender) AS FullName
From Employees