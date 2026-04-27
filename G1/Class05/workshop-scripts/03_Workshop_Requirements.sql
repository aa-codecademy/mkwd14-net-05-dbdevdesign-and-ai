
-- =====================================================
-- FUNCTION: Concatenate FirstName and LastName
-- =====================================================

create or alter function dbo.GetUserFullName
(
	@FirstName nvarchar(50),
	@Lastname nvarchar(50)
)
returns nvarchar(101)
as 
begin
	return concat(@FirstName, ' ', @LastName);
end
go

select 
dbo.GetUserFullName(FirstName, LastName) as UserFullName
from Users
go

-- =====================================================
-- VIEW: All undelivered pizzas with user full names
-- =====================================================

create or alter view dbo.vv_UndeliveredPizzas
as
select
	o.Id,
	dbo.GetUserFullName(u.FirstName, u.LastName) as UserFullName,
	p.Name as PizzaName,
	od.Quantity,
	od.Price as SingleItemPrice,
	od.Quantity * od.Price as TotalOrderPrice
from Orders o 
inner join Users u on u.Id = o.UserId
inner join OrderDetails od on od.OrderId = o.Id
inner join Pizzas p on p.Id = od.PizzaId
where o.IsDelivered = 0;
go

select * from vv_UndeliveredPizzas
go

-- =====================================================
-- VIEW: Pizzas ordered by popularity
-- Most ordered first
-- =====================================================

create or alter view dbo.vw_PizzasByPopularity
as
select 
	p.Id,
	p.Name as PizzaName,
	sum(od.Quantity) as TotalQuantity
from Pizzas p
inner join OrderDetails od on od.PizzaId = p.Id
group by p.Id, p.Name
go

select * from vw_PizzasByPopularity
order by TotalQuantity desc

select * from OrderDetails