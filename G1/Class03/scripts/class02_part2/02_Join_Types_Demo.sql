use master 
go

create database DemoJoinDb
go

use DemoJoinDb
go


create table TableA (IdA int)
go

create table TableB (IdB int)
go



insert into TableA values (1), (2), (3)
insert into TableB values (2), (3), (4)


-- left join

select * 
from TableA left join TableB 
on IdA = IdB


-- right join

select *
from TableA right join TableB
on IdA = IdB

select * 
from TableA inner join TableB
on IdA = IdB


-- full join 

select * 
from TableA full join TableB
on IdA = IdB


-- cross join

select * 
from TableA cross join TableB
order by idA, idB



