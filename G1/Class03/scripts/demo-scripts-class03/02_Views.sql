-- Views 


-- Create View

CREATE OR ALTER VIEW [Total amount of orders per business entity] AS
select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.Name
go



select * from Orders

select * from [Total amount of orders per business entity]
where TotalPricePerEntity > 630000