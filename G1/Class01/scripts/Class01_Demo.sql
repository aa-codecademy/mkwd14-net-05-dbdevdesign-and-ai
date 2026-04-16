USE [master]
GO

--IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DemoDb')
--	ALTER DATABASE [DemoDb] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
--GO

--USE [Master]
--GO

--DROP DATABASE IF EXISTS [DemoDb]
--GO

CREATE DATABASE [DemoDb]
GO


USE [DemoDb]
GO

-- CREATE TABLE

CREATE TABLE [Customer]
(
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[City] nvarchar(50) NULL,
	CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO



-- INSERT

insert into Customer ([Name], [City])
values ('Vero Skopje', 'Skopje')

insert into Customer ([Name], [City])
values ('Tineks Skopje', 'Skopje')

insert into Customer ([Name], [City])
values ('Vero Strumica', 'Strumica')


insert into Customer ([Name], [City])
values ('Vero Kumanovo', 'Kumanovo'), 
('Vero Tetovo', 'Tetovo'),
('Vero Ohrid', 'Ohrid')


-- SELECT

select * from Customer

select [Name] from Customer

select Id, City from Customer

select Id, [Name]
from Customer
where [City] = 'Skopje'


-- UPDATE
update Customer set [Name] = 'Vero Taftalidze', City = 'Skopje'
where [Name] = 'Vero Kumanovo'


ALTER TABLE Customer
ADD PhoneNumber nvarchar(20)


update Customer set PhoneNumber = '070/245-678'
where Id = 2


-- DELETE
delete 
from Customer
where [Name] = 'Vero Skopje'



-- DROP 
DROP TABLE Customer