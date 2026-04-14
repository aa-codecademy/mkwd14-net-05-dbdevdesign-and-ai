-- 🤖 Prompt (for beginners):
-- Explain what this script does step by step, including database creation and deletion.

USE [master]
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DemoDb')
	ALTER DATABASE [DemoDb] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [Master]
GO
DROP DATABASE IF EXISTS [DemoDb]
GO
CREATE DATABASE [DemoDb]
GO
USE [DemoDb]
GO

-- 🤖 Prompt (for beginners):
-- Explain what a table is and what each column represents in this CREATE TABLE statement.

-- CREATE
CREATE TABLE [Customer](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
[City] nvarchar(100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

-- 🤖 Prompt (for beginners):
-- Explain what this SELECT query returns and why we choose specific columns.

Select [Name], [City] from dbo.Customer

-- 🤖 Prompt (for beginners):
-- Explain how INSERT works and what happens when we insert multiple rows.

-- INSERT
INSERT INTO [Customer] ([Name], [City])
VALUES  ('Vero Skopje', 'Skopje')

INSERT INTO [Customer] ([Name], [City])
VALUES  ('Tineks Skopje', 'Skopje')

INSERT INTO [Customer] ([Name], [City])
VALUES  ('Vero Strumica', 'Strumica')

INSERT INTO [Customer] ([Name], [City])
VALUES  ('Vero Kumanovo', 'Kumanovo'), ('Vero Tetovo', 'Tetovo'), ('Vero Ohrid', 'Ohrid')

-- 🤖 Prompt (for beginners):
-- Explain the difference between SELECT * and selecting specific columns.
-- Explain how the WHERE clause filters data.

-- SELECT
SELECT * FROM Customer

SELECT ID, Name, City
FROM Customer

SELECT ID, Name, City
FROM Customer
WHERE City = 'Skopje'

-- 🤖 Prompt (for beginners):
-- Explain how UPDATE works and why we need a WHERE condition.

-- UPDATE
--UPDATE Customer SET Name = 'Vero Bitola', City = 'Bitola'
UPDATE Customer SET Name = 'Vero Bitola', City = 'Bitola'
WHERE Name = 'Vero Skopje'

-- 🤖 Prompt (for beginners):
-- Explain how DELETE works and what happens if we remove the WHERE clause.

-- DELETE
DELETE 
FROM Customer
WHERE Name = 'Vero Skopje'

-- 🤖 Prompt (for beginners):
-- Explain what happens when we DROP a table and why this is dangerous.

-- DROP
DROP TABLE Customer