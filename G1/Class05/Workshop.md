# Workshop – Database Design: Pizza Ordering App 🍕

## Agenda

- Designing Databases
- Database Relationships
- SQL Implementation
- Workshop (Hands-on)

---

## Designing Databases

### Steps of Designing a Database

1. Determine the purpose of your database  
2. Find and organize the required information  
3. Divide the information into tables  
4. Turn information items into columns  
5. Specify primary keys  
6. Set up relationships between tables  
7. Normalize the database (avoid duplication)

---

## 🧪 Workshop Task

### 🎯 Goal

Design and implement a **Pizza Ordering Application Database**

The system should support:

- Users placing orders
- Ordering multiple pizzas
- Adding multiple toppings per pizza
- Pizza sizes
- Delivered / Undlevered orders
- Reporting using Views and Functions

---

# System Requirements

The database should include the following entities:

- Users
- Pizzas
- Pizza Sizes
- Toppings
- Orders
- Order Details
- Order Detail Toppings

Optional (Advanced):
- Pizza Toppings (default pizza recipe)

---

# Important Technical Requirements

## Table Rules

### Every table must have:

```sql
Id INT IDENTITY(1,1) PRIMARY KEY
```

declared directly inside the `CREATE TABLE` statement.

---

## Foreign Keys Rule

### IMPORTANT:

All foreign keys must be created later using:

```sql
ALTER TABLE
ADD CONSTRAINT
FOREIGN KEY
```

NOT inside `CREATE TABLE`

---


## ⚙️ Extra Requirements

- Create a function that concatenates First and Last Name of a user  
- Create a view for all **undelivered pizzas** with user full names  
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

# Deliverables

Students must submit:

- Database schema
- Relationships explanation
- CREATE TABLE scripts
- ALTER TABLE FK scripts
- INSERT scripts
- Function implementation
- Views implementation
- Test SELECT queries
