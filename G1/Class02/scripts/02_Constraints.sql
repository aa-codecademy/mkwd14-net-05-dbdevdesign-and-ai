create table Products_Test (
	[Id] int identity(1,1) not null,
	[Code] nvarchar(50) null,
	[Name] nvarchar(100) null,
	[Description] nvarchar(max) null,
	[Weight] decimal(18,2) null,
	[Price] decimal(18,2) null constraint [DFT_Products_Price] DEFAULT 0,
	[Cost] decimal(18,2) null,
constraint [PK_Product_Test] primary key (Id),
)

insert into Products_Test (Code, Name, Description, Weight, Cost)
values
('P001', 'Product 1', 'Description for Product 1', 1.5, 5.00)




-- UNIQUE constraint for column Code (cannot insert two records with same value for Code)
alter table Products_Test WITH CHECK
ADD CONSTRAINT Products_test_Code_Unique UNIQUE (Code)

insert into Products_Test (Code, Name, Description, Weight, Cost)
values
('P001', 'Product 1', 'Description for Product 1', 1.5, 5.00)


-- DEFAULT Constraint for Weight

alter table Products_Test
add constraint DF_ProductTest_Weight
DEFAULT 100 FOR [Weight]

insert into Products_Test (Code, Name, Description, Cost)
values
('P002', 'Product 2', 'Description for Product 2', 5.00)


select * from Products_Test



-- CHECK Constraint
alter table Products_Test with check 
add constraint CHK_ProductsTest_Price
CHECK (Price >= 0)

insert into Products_Test (Code, Name, Description, Price, Cost)
values
('P004', 'Product 4', 'Description for Product 4', 10, 5.00)