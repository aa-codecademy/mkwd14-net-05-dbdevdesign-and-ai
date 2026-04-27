-- =========================
-- INSERT DATA
-- =========================

-- USERS
INSERT INTO Users (FirstName, LastName, Address, Phone)
VALUES
('Martin', 'Panovski', 'Skopje Center', '070111222'),
('Angela', 'Stojanova', 'Karposh', '071222333'),
('Petar', 'Petrovski', 'Aerodrom', '072333444'),
('Elena', 'Nikolova', 'Kisela Voda', '073444555'),
('Bojan', 'Trajkovski', 'Centar', '075555666'),
('Sara', 'Mitreva', 'Gjorce Petrov', '076666777'),
('Filip', 'Jovanovski', 'Vlae', '077777888'),
('Ivana', 'Ristevska', 'Novo Lisiche', '078888999'),
('Stefan', 'Georgiev', 'Debar Maalo', '079999000'),
('Marija', 'Kostova', 'Butel', '070123456');


-- PIZZA SIZES
INSERT INTO PizzaSizes (Name)
VALUES
('Small'),
('Medium'),
('Large'),
('Family'),
('Extra Large'),
('Kids'),
('Party'),
('Thin Crust Medium'),
('Deep Dish Large'),
('Gluten Free Medium');


-- PIZZAS
INSERT INTO Pizzas (Name, Price, Description, SizeId)
VALUES
('Margherita', 300, 'Tomato sauce, mozzarella, basil', 2),
('Pepperoni', 420, 'Tomato sauce, mozzarella, pepperoni', 3),
('Capricciosa', 450, 'Ham, mushrooms, cheese', 3),
('Vegetarian', 390, 'Vegetables and cheese', 2),
('Quattro Formaggi', 500, 'Four cheese pizza', 3),
('BBQ Chicken', 520, 'Chicken, BBQ sauce, onion', 3),
('Tuna Pizza', 430, 'Tuna, onion, cheese', 2),
('Hawaiian', 460, 'Ham, pineapple, cheese', 3),
('Mexican', 480, 'Spicy beef, peppers, onion', 3),
('Prosciutto', 550, 'Prosciutto, mozzarella, rocket', 3);


-- TOPPINGS
INSERT INTO Toppings (Name, Price)
VALUES
('Extra Cheese', 60),
('Mushrooms', 40),
('Olives', 35),
('Pepperoni', 70),
('Ham', 60),
('Bacon', 80),
('Onion', 25),
('Peppers', 30),
('Chicken', 90),
('Corn', 30);


-- PIZZA DEFAULT TOPPINGS
INSERT INTO PizzaToppings (PizzaId, ToppingId)
VALUES
(1, 1), -- Margherita + Extra Cheese
(2, 4), -- Pepperoni + Pepperoni
(3, 5), -- Capricciosa + Ham
(3, 2), -- Capricciosa + Mushrooms
(4, 2), -- Vegetarian + Mushrooms
(4, 8), -- Vegetarian + Peppers
(5, 1), -- Quattro Formaggi + Extra Cheese
(6, 9), -- BBQ Chicken + Chicken
(7, 7), -- Tuna + Onion
(8, 5); -- Hawaiian + Ham


-- ORDERS
INSERT INTO Orders (UserId, IsDelivered, TotalPrice)
VALUES
(1, 1, 850),
(2, 0, 610),
(3, 1, 980),
(4, 0, 420),
(5, 1, 1120),
(6, 0, 520),
(7, 1, 585),
(8, 0, 505),
(9, 1, 1000),
(10, 0, 500);


-- ORDER DETAILS
-- Price = Pizza Base Price + Selected Toppings Price
INSERT INTO OrderDetails (PizzaId, OrderId, Quantity, Price)
VALUES
(1, 1, 1, 360), -- Margherita 300 + Extra Cheese 60
(2, 1, 1, 490), -- Pepperoni 420 + Pepperoni 70

(6, 2, 1, 610), -- BBQ Chicken 520 + Chicken 90

(3, 3, 2, 490), -- Capricciosa 450 + Mushrooms 40

(4, 4, 1, 420), -- Vegetarian 390 + Peppers 30

(5, 5, 2, 560), -- Quattro Formaggi 500 + Extra Cheese 60

(8, 6, 1, 520), -- Hawaiian 460 + Ham 60

(10, 7, 1, 585), -- Prosciutto 550 + Olives 35

(9, 8, 1, 505), -- Mexican 480 + Onion 25

(2, 9, 2, 500), -- Pepperoni 420 + Bacon 80

(1, 10, 1, 500); -- Example custom order


-- ORDER DETAIL TOPPINGS
INSERT INTO OrderDetailToppings (OrderDetailId, ToppingId)
VALUES
(1, 1), -- Extra Cheese

(2, 4), -- Pepperoni

(3, 9), -- Chicken

(4, 2), -- Mushrooms

(5, 8), -- Peppers

(6, 1), -- Extra Cheese

(7, 5), -- Ham

(8, 3), -- Olives

(9, 7), -- Onion

(10, 6), -- Bacon

(11, 1), -- Extra Cheese
(11, 2), -- Mushrooms
(11, 3); -- Olives