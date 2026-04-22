/*
 Create new view (vv_CustomerOrders) that will List all 
 CustomerIds and sum of total Orders per customer
 Change the view to show Customer Names instead of CustomerId
 Change the view to show the results ordered by the customer with biggest total price

 Create new view (vv_EmployeeOrders) that will List all Employees 
 (FirstName and LastName) , 
 Product name and total quantity they sold 

 Alter the view to show only sales from Business entities belonging to region 'Skopski'
 */

CREATE VIEW vv_CustomerOrders AS
SELECT CustomerId, SUM(TotalPrice) as TotalPrice
FROM Orders o
Group By CustomerId

ALTER VIEW vv_CustomerOrders AS
SELECT CustomerId, c.Name, SUM(TotalPrice) as TotalPrice
FROM Orders o
INNER JOIN Customers c ON o.CustomerId = c.Id
Group By CustomerId, c.Name
--Order by SUM(TotalPrice) desc

CREATE VIEW vv_EmployeeOrders AS
SELECT e.FirstName + ' ' + e.LastName as Employee, p.Name as ProductName, SUM(od.Quantity) as TotalQuantity
FROM Orders o
INNER JOIN OrderDetails od ON o.Id = od.OrderId
INNER JOIN Employees e ON o.EmployeeId = e.Id
INNER JOIN Products p ON od.ProductId = p.Id
GROUP BY e.FirstName, e.LastName, e.Id, p.Name

ALTER VIEW vv_EmployeeOrders AS
SELECT e.FirstName + ' ' + e.LastName as Employee, p.Name as ProductName, SUM(od.Quantity) as TotalQuantity
FROM Orders o
INNER JOIN OrderDetails od ON o.Id = od.OrderId
INNER JOIN Employees e ON o.EmployeeId = e.Id
INNER JOIN Products p ON od.ProductId = p.Id
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
INNER JOIN Customers c ON c.Id = o.CustomerId
WHERE c.RegionName = 'Skopski' AND be.Region = 'Skopski'
GROUP BY e.FirstName, e.LastName, e.Id, p.Name