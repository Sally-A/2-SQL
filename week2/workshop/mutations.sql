-- Week 2 Workshop Assignment!
-- Fill in the required SQL statements under each prompt.
-- NOTE: There are multiple ways to answer each prompt. Aim for the most straight-forward solution.

-- Please select fields in the order in which the prompt introduces them.
-- e.g. Prompt: "Get customer ID and city"
-- X BAD:  SELECT city, customer_id from customers;
-- ✓ GOOD: SELECT customer_id, city from customers;

-- You encouraged to write and perform SQL statements in psql or PgAdmin before recording them in this file.
-- This file may be submited for review and feedback.

-- Part 5: Mutations

-- Management has decided it would like to designate employees as experts of zero or more categories, and they
-- want the database to keep track of who is an expert in what. 
-- Q: How will you satisfy this new requirement? 
-- A:
-- Q: What type of relationship is this? (e.g. 1-1, 1-many, or many-to-many?)
-- A: 
-- Feel free to fill in the blanks above with a comment or two.


-- Create Table
-- Write a SQL statement that creates a new table meeting the following criteria:
--   1. It is named employees_categories
--   2. It has a employee_id column of type INTEGER
--   3. It has a category_id column of type INTEGER
--   4. Its primary key is a tuple of (employee_id, category_id) pairs
CREATE TABLE employees_categories 
(
    employee_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY(employee_id, category_id)
);


-- Alter table
-- Write a SQL statement that alters employees_categories to meet the following criteria:
--   1. employee_id is a foreign key which references the employees table
--   2. category_id is a foreign key which references the categories table
ALTER TABLE employees_categories
    ADD CONSTRAINT fk_ec_employees FOREIGN KEY (employee_id) REFERENCES employees,
    ADD CONSTRAINT fk_ec_categories FOREIGN KEY (category_id) REFERENCES categories;


-- Insert records
-- Write a query that inserts the following employee ID, category ID pairs into employees_categories:
-- (1,2) (3,4) (4,3) (4,4) (8,2) (1,8) (1,3) (1,6)
INSERT INTO employees_categories VALUES (1,2), (3,4), (4,3), (4,4), (8,2), (1,8), (1,3), (1,6);


-- Remove records
-- Write query that deletes all rows from employees_categories but does not delete the employees_categories table itself.
TRUNCATE employees_categories;


-- Challenge question: Write a query that assigns all employees of the London office to be experts in the Dairy Products category.
INSERT INTO employees_categories(employee_id, category_id) 
(	
	SELECT employee_id, (SELECT category_id FROM categories WHERE category_name = 'Dairy Products') 
    FROM employees 
    WHERE city = 'London'
);


-- Delete table
-- Write a query to delete the employees_categories table
DROP table employees_categories;
