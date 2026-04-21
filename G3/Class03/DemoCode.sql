Select Count(*)
From Customers
Where RegionName = 'Bitolski'

Select SUM(TotalPrice)
From Orders

Select AVG(TotalPrice)
From Orders

Select STRING_AGG(FirstName, ', ')
From Employees

Select STRING_AGG(FirstName, ', ')
FROM (
SELECT DISTINCT FirstName From Employees
) as DistinctNames

Select MIN(TotalPrice)
From Orders

Select MAX(TotalPrice)
From Orders


Select e.FirstName, e.LastName, Count(*) as NumberOfOrders, Avg(o.TotalPrice) as Average, SUM(o.TotalPrice) as TotalSum
From Orders o
INNER JOIN Employees e ON o.EmployeeId = e.Id
Group by o.EmployeeId, e.FirstName, e.LastName
HAVING Avg(o.TotalPrice) > 0--e.FirstName NOT LIKE 'Borce'