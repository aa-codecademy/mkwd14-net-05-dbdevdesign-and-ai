-- COUNT

select COUNT(*) as TotalNumberOfCustomers
from Customers


select COUNT(Id) as TotalNumberOfOrders
from Orders



-- avoid count by column that can have NULL values 
select COUNT(Comment) as TotalNumberOfOrders
from Orders



-- SUM 

select sum(TotalPrice) as TotalPrice
from Orders


select max(TotalPrice) as GreatestOrder
from Orders


select min(TotalPrice) as LowestOrder
from Orders


select be.Name, max(o.TotalPrice) as BiggestOrder, min(o.TotalPrice) as LowestOrder
from BusinessEntities be
inner join Orders o
on be.Id = o.BusinessEntityId
group by be.Name




-- AVG

select AVG(DISTINCT Quantity) AS AverageQuantity
from OrderDetails


-- STRING_AGG

select STRING_AGG(Name, ', ') AS AllCustomers
from Customers


select STRING_AGG(Id, ', ') AS AllCustomersIds
from Customers