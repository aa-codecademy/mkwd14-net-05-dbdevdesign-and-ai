-- WORKSHOP 03


--List all names where we have BusinessEntities and Customers at the same time

select Name
from BusinessEntities
UNION ALL 
select Name
from Customers

select count(*) from BusinessEntities

select count(*) from Customers

--List all regions where we have BusinessEntities and Customers at the same time

select Region
from BusinessEntities
UNION
select RegionName
from Customers

--List all regions where some BusinessEntity is based, or some Customer is based. Remove duplicates

select Region
from BusinessEntities
EXCEPT
--INTERSECT 
select RegionName
from Customers


