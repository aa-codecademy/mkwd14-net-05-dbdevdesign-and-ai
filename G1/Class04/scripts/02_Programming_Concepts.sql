declare 
	@FirstName nvarchar(100),
	@LastName nvarchar(100)

set @FirstName = 'Martin'
set @LastName = 'Panovski'

select @FirstName as FirstName, @LastName as LastName


declare @FullName nvarchar(100)

set @FullName = @FirstName + ' ' + @LastName

select @FullName as FullName


select @FirstName = 'Viktor', @LastName = 'Stojanovski'

select * 
from Employees 
where FirstName = @FirstName and LastName = @LastName


select @FirstName = 'ana'

if(len(@FirstName) > 3)
	select 'Correct name'
else
	select 'Name too short!'





	-- Created by GitHub Copilot in SSMS - review carefully before executing
DECLARE @FName NVARCHAR(100) = 'Martin';
DECLARE @LName  NVARCHAR(100) = 'Panovski';
DECLARE @Gender CHAR(1) = NULL;

SELECT
    @FName AS FirstName,
    @LName  AS LastName,
    CASE
        WHEN UPPER(LTRIM(RTRIM(@Gender))) = 'M' THEN 'Male'
        WHEN UPPER(LTRIM(RTRIM(@Gender))) = 'F' THEN 'Female'
        WHEN @Gender IS NULL THEN 'Unknown'
        ELSE 'Other'
    END AS GenderFullName;