-- Workshop 1 - Class 02

--Find all Employees with FirstName = Goran

select * 
from Employees
where FirstName = 'Goran'

--Find all Employees with LastName starting With ‘S’

select *
from Employees
where LastName like 'S%'


--Find all Employees with DateOfBirth greater than ‘01.01.1988’

select *
from Employees 
where DateOfBirth > '1988-01-01'


--Find all Male employees
select *
from Employees
where Gender = 'M'

--Find all employees hired in January/1998
select *
from Employees
where HireDate between '1998-01-01' and '1998-02-01'

--Find all Employees with LastName starting With ‘A’ hired in January/2019

select *
from Employees
where LastName like 'A%' and 
HireDate between '2019-01-01' and '2019-02-01'

