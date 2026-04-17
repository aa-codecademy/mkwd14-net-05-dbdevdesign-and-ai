use [master]
go


drop database if exists [SEDC]
go


create database [SEDC]
go


use [SEDC]
go


-- Make sure no tables exists before creating them

-- 🤖 Prompt (for beginners):
-- Explain why we drop tables before creating them again.

drop table if exists [dbo].[OrderDetails]
drop table if exists [dbo].[Orders]
drop table if exists [dbo].[Customers]
drop table if exists [dbo].[Employees]
drop table if exists [dbo].[BusinessEntities]
drop table if exists [dbo].[Products]



create table Customers (
	[Id] int identity(1,1) not null,
	[Name] nvarchar(100) not null,
	[AccountNumber] nvarchar(100) null,
	[City] nvarchar(100) null,
	[RegionName] nvarchar(100) null,
	[CustomerSize] nvarchar(10) null,
	[PhoneNumber] nvarchar(20) null,
	[IsActive] bit not null,
constraint [PK_Customer] primary key (Id)
)

create table Employees (
	[Id] int identity(1,1) not null,
	[FirstName] nvarchar(100) not null,
	[LastName] nvarchar(100) not null,
	[DateOfBirth] date null,
	[Gender] nchar(1) null,
	[HireDate] date null,
	[NationalIdNumber] nvarchar(20) null, 
constraint [PK_Employee] primary key (Id)
)


create table Products (
	[Id] int identity(1,1) not null,
	[Code] nvarchar(50) null,
	[Name] nvarchar(100) null,
	[Description] nvarchar(max) null,
	[Weight] decimal(18,2) null,
	[Price] decimal(18,2) null,
	[Cost] decimal(18,2) null,
constraint [PK_Product] primary key (Id)
)


create table Orders (
	[Id] bigint identity(1,1) not null,
	[OrderDate] date null,
	[Status] smallint null,
	[BusinessEntityId] int null,
	[CustomerId] int null,
	[EmployeeId] int null,
	[TotalPrice] decimal(18, 2) null,
	[Comment] nvarchar(max) null,
constraint [PK_Order] primary key (Id)
)


create table OrderDetails ( 
	[Id] int identity(1,1) not null,
	[OrderId] bigint null,
	[ProductId] int null,
	[Quantity] int null,
	[Price] decimal(18, 2) null,
constraint [PK_OrderDetail] primary key (Id)
)


create table BusinessEntities (
	[Id] int identity(1,1) not null,
	[Name] nvarchar(100) null,
	[Region] nvarchar(1000) null,
	[Zipcode] nvarchar(10) null,
	[Size] nvarchar(10) null,
constraint [PK_BusinessEntity] primary key (Id)
)

