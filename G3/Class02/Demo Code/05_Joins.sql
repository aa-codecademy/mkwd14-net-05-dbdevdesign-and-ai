Select * 
From BusinessEntities be
LEFT JOIN Orders o ON be.Id = o.BusinessEntityId

Select * 
From BusinessEntities be
INNER JOIN Orders o ON be.Id = o.BusinessEntityId

Select * 
From BusinessEntities be
LEFT JOIN Orders o ON be.Id = o.BusinessEntityId
WHERE o.Id IS NULL


Select * 
From Orders o
FULL OUTER JOIN Employees e ON o.EmployeeId = e.Id

Select * From BusinessEntities
Select * From Customers

Select be.[Name], c.[Name]
From BusinessEntities be
Cross Join Customers c


Select o.Id, o.OrderDate, be.Name AS BusinessEntityName, c.Name as CustomerName, e.FirstName, e.LastName
From Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
INNER JOIN Customers c ON o.CustomerId = c.Id
INNER JOIN Employees e ON o.EmployeeId = e.Id