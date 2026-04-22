-- Workshop 1 & 2

/*
Calculate the total amount on all orders in the system
Calculate the total amount per BusinessEntity on all orders in the system
Calculate the total amount per BusinessEntity on all orders in the system 
from Customers with ID < 20
Find the Maximal Order amount, and the Average Order amount 
per BusinessEntity on all orders in the system
*/



select sum(TotalPrice) as TotalPrice
from Orders
go


select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.Name


select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be on o.BusinessEntityId = be.Id
where o.CustomerId < 20
group by be.Name


select 
be.Name, 
max(o.TotalPrice) as MaximumTotalPrice, 
avg(distinct o.TotalPrice) as TotalPriceAverage
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.Name




--Calculate total amount per BusinessEntity and filter > 635558
--Calculate total amount per BusinessEntity (CustomerId < 20) and filter < 100000
--Find Max and Avg per BusinessEntity and filter where total > 4x average

select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.Name
having sum(o.TotalPrice) > 635558


select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be on o.BusinessEntityId = be.Id
where o.CustomerId < 20
group by be.Name
having sum(o.TotalPrice) < 100000



select 
be.Name, 
max(o.TotalPrice) as MaximumTotalPrice, 
avg(o.TotalPrice) as TotalPriceAverage
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.Name
having sum(o.TotalPrice) > 4 * avg(o.TotalPrice)



select 4 * avg(distinct TotalPrice)
from Orders