/*

Calculate the total amount per BusinessEntity on all orders in 
the system and filter only total orders greater then 635558

Calculate the total amount per BusinessEntity on all orders in 
the system from Customers with ID < 20 
and filter only total orders less then 100000

Find the Maximal Order amount, and the Average Order amount per BusinessEntity 
on all orders in the system. Filter only records where Total order 
amount is more then 4x bigger then average
List all BusinessEntity names next to the other details

*/
Select BusinessEntityId, be.Name, SUM(TotalPrice) AS TotalSum
From Orders o
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
Group By BusinessEntityId, be.Name
HAVING SUM(TotalPrice) > 635558
GO

Select o.BusinessEntityId, be.Name, SUM(TotalPrice) AS TotalSum
From Orders o
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
Where CustomerId < 20
Group By BusinessEntityId, be.Name
HAVING SUM(TotalPrice) < 100000
GO

SELECT o.BusinessEntityId, be.Name, MAX(TotalPrice) as MaxPrice, AVG(TotalPrice) as AvgPrice, SUM(TotalPrice) as Total
FROM Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY o.BusinessEntityId, be.Name
HAVING SUM(TotalPrice) > 4 * AVG(TotalPrice)
GO

