
-- LEN()
select FirstName, LEN(LastName) as LastNameLength
from Employees


select Code, SUBSTRING(Code, 1, 3) as ShortCode 
from Products


-- REPLACE()

select FirstName, LastName, REPLACE(Gender, 'M', 'Male') as GenderFullName
from Employees


select GETDATE()


select UPPER(FirstName) as FirstNamesToUpperCase, LOWER(LastName) as LastNamesToLowerCase
from Employees