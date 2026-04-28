# Workshop – Database Design: Pizza Ordering App 🍕

## Agenda

- Designing Databases
- Workshop (Hands-on)

---

## Designing Databases

### Steps of Designing a Database

1. Determine the purpose of your database  
2. Find and organize the information required  
3. Divide the information into tables  
4. Turn information items into columns  
5. Specify primary keys  
6. Set up the table relationships  

---

## 🧪 Workshop Task

### 🎯 Goal

Design a **Pizza Ordering Application Database**

---

## System Requirements

Define the tables and the respective columns

---

## 👤 User Requirements

A user can have **multiple orders**

### Information:
- First Name  
- Last Name  
- Address  
- Phone  

---

## 🍕 Pizza Requirements

A pizza can:

- Have multiple toppings  

---

## 📦 Order Requirements

An order can:

- Have only one user  
- Have multiple pizzas  

### Information:
- Is Delivered  
- Price (delivery price)  

---

## 🧀 Topping Requirements

A topping can:

- Be used in multiple pizzas  

### Information:
- Name  
- Price  

---

## 📏 Pizza Size Requirements

A pizza size can:

- Be used in multiple pizzas  

### Information:
- Name  

---

## ⚙️ Extra Requirements

- Create a function that concatenates First and Last Name of a user  
- Create a view for all **undelivered pizzas** with user full names  
- Create a stored procedure:
  - Input: OrderId  
  - Output: Full price (Delivery + Pizzas + Toppings)  
- Create a view:
  - Pizzas ordered by popularity (most ordered first)  
- Create a view:
  - Toppings ordered by popularity  
- Create a view:
  - Users and total pizzas they ordered  

---

# 🤖 Using AI (IMPORTANT)

AI is **only a helper, not a replacement**.

---

## ✔️ Good Approach

Use AI to:

- Understand requirements  
- Break down the problem  
- Get hints for relationships  
- Validate your solution  

---

## ❌ Bad Approach

- Copy full solution  
- Not understanding queries  
- Skipping design phase  

---

## 🧠 Example Prompts (for beginners)

- Explain how to design a database for a pizza ordering system step by step  
- What tables are needed for a pizza ordering app?  
- Explain relationships between Users, Orders, and Pizzas  
- Should I use a junction table for pizza toppings? Why?  
- Help me design primary and foreign keys for this system  

---

## 💡 Step-by-Step Strategy (for students)

1. Identify entities  
2. Define columns  
3. Add primary keys  
4. Define relationships  
5. Normalize (avoid duplication)  
6. Implement in SQL  
7. Add extra requirements  

---

## ⚠️ Important Rule

👉 If you use AI:
- You must understand every line  
- Be able to explain it  

---

## Deliverables

- Database schema (tables + relationships)  
- SQL scripts  
- Implemented extra requirements  