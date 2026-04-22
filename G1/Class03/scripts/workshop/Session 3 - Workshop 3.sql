CREATE OR ALTER VIEW vv_CustomerOrders
AS
select c.Id, c.Name, sum(o.TotalPrice) as TotalOrderCount
from Orders o
join Customers c on o.CustomerId = c.Id
group by c.Id, c.Name
GO

select * from vv_CustomerOrders
order by TotalOrderCount desc




CREATE OR ALTER VIEW vv_EmployeeOrders
AS
select e.FirstName + ' ' + e.LastName as Employee, p.Name as ProductName, sum(od.Quantity) as TotalQuantity
from Orders o
join Employees e on e.Id = o.EmployeeId
join OrderDetails od on od.OrderId = o.Id
join Products p on p.Id = od.ProductId
join BusinessEntities be on be.Id = o.BusinessEntityId
where be.Region = 'Skopski'
group by e.FirstName + ' ' + e.LastName, p.Name
GO

select * from vv_EmployeeOrders

