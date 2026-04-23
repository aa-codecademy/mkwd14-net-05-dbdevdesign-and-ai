CREATE TABLE #FemaleEmployees (EmployeeId int not null, FirstName nvarchar(200), LastName nvarchar(200))

--INSERT INTO #FemaleEmployees (EmployeeId, FirstName, LastName)
--VALUES (100, 'Test', 'Test')

--INSERT INTO #FemaleEmployees (EmployeeId, FirstName, LastName)
--VALUES (101, 'Test 1', 'Test 1')

INSERT INTO #FemaleEmployees (EmployeeId, FirstName, LastName)
Select Id, FirstName, LastName
From Employees
Where Gender = 'F'

Select * From #FemaleEmployees

DROP TABLE #FemaleEmployees