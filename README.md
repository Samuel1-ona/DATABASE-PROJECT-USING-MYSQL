
# DATA MANAGEMENT PROJECT IN SQL

This readme file provides a brief overview of SQL and its syntax for creating a database, creating a table, altering a table, inserting data into a table, creating a stored procedure, and using the LAG and LEAD functions.

Creating a Database
To create a database in SQL, use the CREATE DATABASE statement followed by the database name. Here's the syntax:


CREATE DATABASE database_name;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
Creating a Table
To create a table in SQL, use the CREATE TABLE statement followed by the table name and the columns and their data types. Here's the syntax:


CREATE TABLE table_name (
   column1 datatype,
   column2 datatype,
   column3 datatype,
   ...
);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Altering a Table
To alter a table in SQL, use the ALTER TABLE statement followed by the table name and the alteration you want to make. Here's the syntax:


ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE table_name
DROP COLUMN column_name;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Inserting Data into a Table

To insert data into a table in SQL, use the INSERT INTO statement followed by the table name and the values you want to insert. Here's the syntax:


INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Creating a Stored Procedure
To create a stored procedure in SQL, use the CREATE PROCEDURE statement followed by the procedure name and the SQL code you want to execute. Here's the syntax:


CREATE PROCEDURE procedure_name
AS
BEGIN
   SQL code
END;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
LAG and LEAD Functions
The LAG and LEAD functions are used to access data from a previous or subsequent row in the same result set. Here's the syntax for both functions:


LAG(column_name, offset, default_value) OVER (ORDER BY column_name)
LEAD(column_name, offset, default_value) OVER (ORDER BY column_name)

The column_name is the name of the column you want to access data from, the offset is the number of rows to offset, and the default_value is the value to return if there is no previous or subsequent row. The ORDER BY clause is used to specify the column used to sort the result set.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Conclusion
SQL is a powerful language for managing and manipulating data in relational databases. Understanding its syntax for creating a database, creating a table, altering a table, inserting data into a table, creating a stored procedure, and using the LAG and LEAD functions is essential for effective database management.





