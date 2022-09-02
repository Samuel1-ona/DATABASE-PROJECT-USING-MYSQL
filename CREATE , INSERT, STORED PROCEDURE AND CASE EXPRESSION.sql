-- Creating a database and a table 

-- creating a database or in other words a schema using the 
-- data defination language DDL 
-- This database will contain the right formats to create a table
-- Step 1
-- Create a database using the CREATE function
 
CREATE DATABASE standard_ways_of_creating_tables; 

-- The USE function is to call out the database to be used
USE  standard_ways_of_creating_tables; 

----------------------------------------------------------------------
-- Creating table using the CREATE functions and length datatypes and 
-- also the NOT NULL function to avoid duplicates on the tables
-- using the PRIMARY KEY to uniquely identify the row  in the table 
-- creating the first table having a PRIMARY KEY
-- NOTE the length datatype has a limitation that is the value entered wounld not
-- exceed the length given, so the value needs to be less than equal to the 
-- length value.
-- RECOMMENDATION; Aviod adding length if you desire a flexible value 
-- OR add length that are accurate to your values. 


CREATE TABLE standards
(
ID INT (10) NOT NULL,
NAME CHAR (10) NOT NULL,
productname CHAR(10),
productID INT (10),
PRIMARY KEY (ID)
);
-----------------------------------------------------------------------------------------------
-- To return the table definitions of the columns we can use the EXPLAIN and DESCRIBE commands
DESCRIBE standards;

-----------------------------------------------------------------------------------------------
-- Creating the second table using the foreign key
-- The foreign key reference the primary key at the standard table at the first table
-- The foreign key establish relationship on the two tables

CREATE TABLE standards_table
(
ID INT (10) NOT NULL,
orderID INT (10) NOT NULL,
ordernumber INT (10) NOT NULL,
customerID INT (10),
PRIMARY KEY (orderID),
FOREIGN KEY (ID) REFERENCES standards(ID)
);
----------------------------------------------------------------------------------------------
-- The ALTER command is use to MODIFY, ADD, DROP a column and a table
ALTER TABLE standards_table
MODIFY column ordernumber CHAR(10);
-----------------------------------------------------------------------------------------------
-- To return the table definitions of the columns we can use the EXPLAIN and DESCRIBE commands

DESCRIBE standards_table;

-----------------------------------------------------------------------------------------------
-- Now let see how to insert values into a  table 
-- They different ways to do this but i will focus on the easy way to go 
-- to go about it.
-- So yes let do it.
EXPLAIN ANALYZE
INSERT INTO standards
(ID, Name,productname, productID)
VALUES
(1,"company","phone",123),
(2,"government","computers",124),
(3,"business","equipments",125);

EXPLAIN ANALYZE
INSERT INTO standards_table
(ID, orderID,ordernumber,customerID)
VALUES
(1,2,"vc13",23),
(2,3,"ef15",34);

------------------------------------------------------------------------------------------------
-- Stored procedures are procedures that stores SQL statement on the stored 
-- procedures panel so that the retyping of SQL statement will be limited
-- So lets create a stored precedure that has a SQL statement of selecting 
-- all columns in the database.

-- In mysql database it is required to use DELIMITER to make the stored 
-- procedures to be treated as a statement.
EXPLAIN ANALYZE
DELIMITER //
-- Creating the stored procedure in mysql you are required to create a 
-- procedure name with brackets
CREATE PROCEDURE SELECTINGALLCOLUMNS()
-- Every stored procedures body in mysql has an Execution block that starts with BEGIN before starting 
-- the body.
BEGIN
-- This a simple body in a mysql stored procedure, this query is to show all 
-- the columns in the table 
 Select * from standards;
 
END //
-- The END of the Execution block
DELIMITER ;

-- To call out the procedure that was stored in the mysql database using the CALL FUNCTION
CALL SELECTINGALLCOLUMNS();

-- SECOND PROCEDURE FOR TABLE 2
EXPLAIN ANALYZE
DELIMITER //
CREATE PROCEDURE SELECTINGALLCOLUMN()
BEGIN

Select * from standards_table;

END //

DELIMITER ;

CALL SELECTINGALLCOLUMN();

-----------------------------------------------------------------------------------------------------
-- CASE EXPRESSIONS 
-- CASE EXPRESSIONS are just like the IF ELSE expressions at other programming languages
-- CASE EXPRESSIONS syntaxs goes with WHEN THEN ELSE and END
-- So I will show you how to write a case expressions using the table we created above
-- The CASE returns results when a boolean expression TRUE
-- So lets GO I am going to write a CASE expression that use SEARCHED that is (CASE IN SELECT)
-- 
EXPLAIN ANALYZE
SELECT ID, name, productname,
 CASE WHEN productname = "phone" THEN "High Demands"
      when productname = "computers" THEN "Fixed Demands"
      ELSE "please indicate which"      
 END AS Demands -- To name the new column formed by the CASE
 FROM standards;
---------------------------------------------------------------------------------------------------------------------
--  The unique facts about CASE its has different ways to go with 
--  CASE can be used in conjunction with SUM to return a count of only those items matching a predefined condition
--  The 1's returns for the matching entries
--  The 0's returns for the non-matching entries but its not indicated on the results
--  Its very possible that all the aggregate functions can work with this so you can 
--  you can flexible with it.
EXPLAIN ANALYZE
SELECT 
     COUNT(ID) AS itemscount,
        sum( CASE 
             WHEN productname = "phone" THEN 1
             ELSE 0
           END
         ) AS phone_count
FROM standards;         
-------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS ANALYTICS

-- ANALYTICS FUNCTIONS it's used to determine values based on groups
-- ANALYTICS FUNCTIONS can be used to determine running totals, percentages or the top results within a group

-- So let's start with FIRST_VALUE
-- FIRST_VALUE function determine the first value in ordered result set

SELECT ID, name, productname, productID,
     FIRST_VALUE(productID)
      OVER(ORDER BY name ASC) as Firstvalue
 FROM standards;     
 
 -- The first_value can be used to return the lowest and highest value 
 -- The OVER clause is used to order the name so that it can obtain the desired values
 ------------------------------------------------------------------------------------------------------------
-- The LAST_VALUE function provides the last value in an ordered results set
EXPLAIN ANALYZE
SELECT ID, name, productname, productID,
     LAST_VALUE(productID)
      OVER(ORDER BY name ASC) as Firstvalue
 FROM standards;  
 
 -- The unique facts about LAST_VALUE is that it returns the last value of a repeated rows 
 -------------------------------------------------------------------------------------------------------------
 -- LAG FUNCTION (COMPARISON EXPRESSION)
 -- The LAG function provides data on rows BEFORE the current row in the same result set.
 -- The LAG function are scalar expressions that are used to compare values
 -- The offset parameter is the number of rows before the current row that will be used in the comparison
 -- The default parameter specifies the value that should be returned when the expression at offset has a NULL value.

 -- LEAD FUNCTION (COMPARISON EXPRESSION)
 -- The LEAD function  provides data on rows AFTER the current row in the row set.
 -- The LEAD function are scalar expressions that are used to compare values
 
 SELECT ID,productID,
        LEAD(productID, 1, 0) OVER(ORDER BY ID) AS "LEADS VALUE",
        LAG(productID,  1, 0) OVER(ORDER BY ID) AS "LAG VALUE"
 FROM standards;       
 
---------------------------------------------------------------------------------------------------------------
