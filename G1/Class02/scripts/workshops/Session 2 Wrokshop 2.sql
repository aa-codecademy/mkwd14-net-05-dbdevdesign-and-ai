--WORKSHOP 02


--Find all Employees with FirstName = Aleksandar ordered by Last Name
select *
from Employees
where FirstName = 'Aleksandar' 
order by LastName


--List all Employees ordered by FirstName
select *
from Employees
order by FirstName

--Find all Male employees ordered by HireDate (latest first)
select *
from Employees
where Gender = 'M'
order by HireDate desc
