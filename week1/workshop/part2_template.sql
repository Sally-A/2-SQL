DROP DATABASE IF EXISTS week1_workshop;
CREATE DATABASE week1_workshop;
-- connect via psql
\c week1_workshop

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;


---
--- CREATE tables
---

CREATE TABLE products (
    product_id SERIAL,
    product_name TEXT NOT NULL,
    discontinued INT NOT NULL,
    supplier_id INT,
    category_id INT,
    PRIMARY KEY(product_id)
);


CREATE TABLE categories (
    category_id SERIAL,
    category_name TEXT NOT NULL,
    category_description TEXT,
    picture TEXT,
    PRIMARY KEY (category_id)
);


CREATE TABLE suppliers (
    supplier_id SERIAL,
    company_name TEXT NOT NULL,
    PRIMARY KEY(supplier_id)
);


CREATE TABLE orders (
    order_id SERIAL,
    order_date DATE, 
    customer_id INT,
    employee_id INT,
    ship_via INT,
    PRIMARY KEY(order_id)
);


CREATE TABLE orders_products (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    discount NUMERIC NOT NULL, 
    PRIMARY KEY(order_id, product_id)
);


CREATE TABLE customers (
    customer_id SERIAL,
    company_name TEXT NOT NULL,
    PRIMARY KEY(customer_id)
);


CREATE TABLE shippers (
    shipper_id SERIAL,
    company_name TEXT NOT NULL,
    phone TEXT,
    PRIMARY KEY(shipper_id)
);


CREATE TABLE employees (
    employee_id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    reports_to INT,
    PRIMARY KEY(employee_id)
);


CREATE TABLE territories (
    territory_id SERIAL,
    territory_description TEXT NOT NULL,
    region_id INT NOT NULL,
    PRIMARY KEY(territory_id)
);


CREATE TABLE employees_territories (
    employee_id INT NOT NULL,
    territory_id INT NOT NULL,
    PRIMARY KEY(employee_id, territory_id)
);


CREATE TABLE regions (
    region_id SERIAL,
    region_description TEXT NOT NULL,
    PRIMARY KEY(region_id)
);


CREATE TABLE us_states (
    state_id SERIAL,
    state_name TEXT NOT NULL,
    state_abbr CHARACTER(2) NOT NULL,
    PRIMARY KEY(state_id)
);

---
--- Add foreign key constraints
---

-- Orders

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers 
FOREIGN KEY (customer_id) 
REFERENCES customers;


ALTER TABLE orders
ADD CONSTRAINT fk_orders_employees 
FOREIGN KEY (employee_id) 
REFERENCES employees;


ALTER TABLE orders
ADD CONSTRAINT fk_orders_shippers 
FOREIGN KEY (ship_via) 
REFERENCES shippers;

-- Products

ALTER TABLE products
ADD CONSTRAINT fk_products_categories 
FOREIGN KEY (category_id) 
REFERENCES categories;


ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers 
FOREIGN KEY (supplier_id) 
REFERENCES suppliers;


-- Orders-Products

ALTER TABLE orders_products
ADD CONSTRAINT fk_orders_products_products 
FOREIGN KEY (product_id) 
REFERENCES products;


ALTER TABLE orders_products
ADD CONSTRAINT fk_orders_products_orders 
FOREIGN KEY (order_id) 
REFERENCES orders;


-- Employees

ALTER TABLE employees
ADD CONSTRAINT fk_employees_employees 
FOREIGN KEY (reports_to) 
REFERENCES employees;


-- Territories

ALTER TABLE territories
ADD CONSTRAINT fk_territories_region 
FOREIGN KEY (region_id) 
REFERENCES regions;


-- Employees-Territories

ALTER TABLE employees_territories
ADD CONSTRAINT fk_employees_territories_territories 
FOREIGN KEY (territory_id) 
REFERENCES territories;


ALTER TABLE employees_territories
ADD CONSTRAINT fk_employees_territories_employees 
FOREIGN KEY (employee_id) 
REFERENCES employees;
