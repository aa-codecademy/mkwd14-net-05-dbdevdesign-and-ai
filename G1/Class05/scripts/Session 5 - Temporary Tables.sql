-- Table variable


-- Visible only in the batch where it is DECLARED

declare @FemaleEmployeeList TABLE (
EmployeeID int not null, 
FirstName nvarchar(100) null, 
LastName nvarchar(100))

--insert into @FemaleEmployeeList (EmployeeID, FirstName, LastName)
--values (101, 'Ana', 'Nikolova'),
--	   (102, 'Aleksandra', 'Petrovska'),
--	   (103, 'Bojana', 'Bojanovska')



insert into @FemaleEmployeeList (EmployeeID, FirstName, LastName)
select Id, FirstName, LastName
from Employees
where Gender = 'F'

select * from @FemaleEmployeeList




-- Temprary table

create table #MaleEmployeeTempTable (
	EmployeeID int not null, 
	FirstName nvarchar(100) null,
	LastName nvarchar(100) null)


insert into #MaleEmployeeTempTable (EmployeeID, FirstName, LastName)
select Id, FirstName, LastName
from Employees
where Gender = 'M'



select * from #MaleEmployeeTempTable


