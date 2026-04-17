--Set default price in Products table
--Prevent inserting price > 2x cost
--Ensure unique product names

alter table Products
add constraint DF_Product_Price DEFAULT 0 for Price


alter table Products with check
add constraint UC_Product_Name UNIQUE (Name)
