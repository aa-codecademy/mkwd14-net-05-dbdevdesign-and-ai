-- 🤖 Prompt (for beginners):
-- Explain what this script does step by step and why we recreate the database.

USE [master]
GO

DROP DATABASE IF EXISTS [AvengaAcademy]
GO

CREATE DATABASE [AvengaAcademy]
GO

USE [AvengaAcademy]
GO

-- 🤖 Prompt (for beginners):
-- Explain why we drop tables before creating them again.

DROP TABLE IF EXISTS [dbo].[OrderDetails]
DROP TABLE IF EXISTS [dbo].[Orders]
DROP TABLE IF EXISTS [dbo].[BusinessEntities]
DROP TABLE IF EXISTS [dbo].[Customers]
DROP TABLE IF EXISTS [dbo].[Employees]
DROP TABLE IF EXISTS [dbo].[Products]
GO

-- you can skip PKs in this class and introduce them when learning about constraints

-- 🤖 Prompt (for beginners):
-- Explain what a table represents in a database and how it relates to real-world entities.

CREATE TABLE Customers (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[AccountNumber] nvarchar(100) NULL,
	[City] nvarchar(100) NULL,
	[RegionName] nvarchar(100) NULL,
	[CustomerSize] nvarchar(10) NULL,
	[PhoneNumber] nvarchar(20) NULL,
	[IsActive] bit NOT NULL,
CONSTRAINT [PK_Customers] PRIMARY KEY (Id)
)

-- 🤖 Prompt (for beginners):
-- Explain how this table models employees and what each column represents.

CREATE TABLE Employees (
	[Id] int IDENTITY(1,1) NOT NULL,
	[FirstName] nvarchar(100) NOT NULL,
	[LastName] nvarchar(100) NOT NULL,
	[DateOfBirth] date NULL, 
	[Gender] nchar(1) NULL, -- 'F' / 'M'
	[HireDate] date NULL,
	[NationalIdNumber] nvarchar(20) NULL
CONSTRAINT [PK_Employees] PRIMARY KEY (Id)
)

-- 🤖 Prompt (for beginners):
-- Explain how products are modeled and why we store price and cost separately.

CREATE TABLE Products (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Code] nvarchar(50) NULL,
	[Name] nvarchar(100) NULL,
	[Description] nvarchar(max) NULL,
	[Weight] decimal(18, 2) NULL,
	[Price] decimal(18,2) NULL,
	[Cost] decimal(18,2) NULL,
CONSTRAINT [PK_Products] PRIMARY KEY (Id)
)

-- 🤖 Prompt (for beginners):
-- Explain what an Order represents and how it connects to other tables.

CREATE TABLE Orders(
	[Id] bigint IDENTITY(1,1) NOT NULL,
	[OrderDate] date NULL,
	[Status] smallint NULL,
	[BusinessEntityId] int NULL,
	[CustomerId] int NULL,
	[EmployeeId] int NULL,
	[TotalPrice] decimal(18,2) NULL,
	[Comment] nvarchar(max) NULL
CONSTRAINT [PK_Orders] PRIMARY KEY (Id)
)

-- 🤖 Prompt (for beginners):
-- Explain what OrderDetails represents and why we separate it from Orders.

CREATE TABLE OrderDetails(
	[Id] int IDENTITY(1,1) NOT NULL,
	[OrderId] bigint NULL,
	[ProductId] int NULL,
	[Quantity] int NULL,
	[Price] decimal(18,2) NULL,
CONSTRAINT [PK_OrderDetails] PRIMARY KEY (Id)
)

-- 🤖 Prompt (for beginners):
-- Explain what a BusinessEntity is in this context and how it fits in the system.

CREATE TABLE BusinessEntities(
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NULL,
	[Region] nvarchar(1000) NULL,
	[Zipcode] nvarchar(10) NULL,
	[Size] nvarchar(10) NULL,
CONSTRAINT [PK_BusinessEntities] PRIMARY KEY (Id)
)
GO