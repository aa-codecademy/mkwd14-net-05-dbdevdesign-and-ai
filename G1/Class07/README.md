# Error Handling and Administration 🛡️

## Agenda

- Error handling
- Basic administration
- Backups
- Permissions

---

## Error Handling

### Using TRY and CATCH

In SQL Server, TRY...CATCH is used to handle runtime errors in a controlled way.

```sql
BEGIN TRY
    -- SQL statements
END TRY
BEGIN CATCH
    -- Error handling logic
END CATCH
```

It is especially useful when:

- a script can fail because of invalid data
- you want to show meaningful error information
- you want to catch errors inside stored procedures
- you want to debug problems more easily

TRY...CATCH is commonly used in:

- Stored procedures
- Triggers
- Insert / update workflows

---

## 🤖 AI Prompt Examples

- Explain TRY...CATCH in SQL Server with a simple example for beginners
- What kinds of errors can be handled with TRY...CATCH?
- Why is TRY...CATCH especially useful inside stored procedures?
- What happens if an error occurs outside TRY block?

---

## Retrieving Error Information

Inside the CATCH block, SQL Server provides system functions:

- ERROR_NUMBER()
- ERROR_SEVERITY()
- ERROR_STATE()
- ERROR_PROCEDURE()
- ERROR_LINE()
- ERROR_MESSAGE()

### Notes

- Severity levels 11–16 are usually caused by user errors
- These functions return NULL outside a CATCH block

---

## 🤖 AI Prompt Examples

- Explain the difference between ERROR_NUMBER, ERROR_SEVERITY, and ERROR_MESSAGE
- Which error function is most useful when debugging and why?
- Show a SQL example that returns all error details
- When would ERROR_LINE be useful?

---

## Example: Returning All Error Information

```sql
CREATE PROCEDURE usp_ExampleProc
AS
    SELECT 1/0;
GO

BEGIN TRY
    EXECUTE usp_ExampleProc;
END TRY
BEGIN CATCH
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO
```

---

## 🤖 AI Prompt Examples

- Explain this example step by step
- What error will occur and why?
- Why do we execute the procedure inside TRY?
- What would happen if we removed CATCH?

---

## Basic Administration

### Database Backup

A database backup is a saved copy of the database.

Students should understand:

- why backups are important
- when backups are used
- what risks they protect from
- what happens if there is no backup

---

## 🤖 AI Prompt Examples

- Explain database backup in simple terms
- Why are backups critical in real systems?
- Give an example of data loss scenario
- What types of backups exist?

---

### Database Restore

Database restore is the process of rebuilding a database from a backup.

Students should understand:

- when restore is needed
- how restore helps after failures
- why backup and restore go together

---

## 🤖 AI Prompt Examples

- Explain the difference between backup and restore
- Give a real-world example where restore is needed
- What happens if restore fails?
- Can we restore partial data?

---

### Permissions Basics

Permissions define who can access and modify data.

Concepts:

- Logins (server-level access)
- Users (database-level access)
- Roles (group permissions)

Students should understand:

- how to create a login
- how to map a user
- how to assign roles

---

## 🤖 AI Prompt Examples

- Explain SQL Server permissions for beginners
- What is the difference between login and user?
- Why is access control important in production?
- What risks exist if everyone has full access?

---

## Summary

### Core Concepts

- Databases store and organize data
- SQL Server manages databases
- Tables store structured data
- Queries manipulate data

### CRUD

- CREATE
- READ (SELECT)
- UPDATE
- DELETE

### Relationships

- Primary Keys
- Foreign Keys
- One-to-Many
- Many-to-Many
- JOIN operations

### Logic

- Functions
- Stored Procedures
- Error Handling

### Administration

- Backups
- Restore
- Permissions

---

## 🤖 AI Prompt Examples

- Summarize the SQL course for a beginner
- Ask 10 questions to test SQL knowledge
- Explain difference between functions, procedures, and views
- Give a real-world database example using all concepts

---

## ⚠️ Using AI

AI can help you:

- understand SQL concepts
- debug errors
- explain queries
- validate your logic

AI should NOT:

- replace your thinking
- be blindly copied
- be used without understanding the result

Always:

- test your code
- explain your solution
- understand every query
