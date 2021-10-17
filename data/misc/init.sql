DROP DATABASE IF EXISTS week2;
CREATE DATABASE week2;

DROP DATABASE IF EXISTS week3;
CREATE DATABASE week3;

\c week2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL, 
    author TEXT NOT NULL, 
    genre TEXT NOT NULL, 
    year INT NOT NULL
);

INSERT INTO books (title, author, genre, year) VALUES
('Frankenstein', 'Mary Shelley', 'Novel', 1818),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Novel', 1925),
('Big Fish', 'Daniel Wallace', 'Magical Realism', 1998),
('Don Quixote', 'Miguel de Cervantes', 'Novel', 1605);

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    code TEXT NOT NULL,
    name TEXT NOT NULL
);

INSERT INTO departments (id, code, name) VALUES
(1, 'EECS', 'Electrical Engineering & Computer Science'),
(2, 'MATH', 'Mathematics'),
(3, 'CHEM', 'Chemistry'),
(4, 'PHYS', 'Physics'),
(5, 'PHIL', 'Philosophy'),
(6, 'ECON', 'Economics');

DROP TABLE IF EXISTS professors;

CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department_id INT,
    CONSTRAINT fk_prof_dept FOREIGN KEY(department_id) REFERENCES departments(id) ON DELETE CASCADE
);

INSERT INTO professors (first_name, last_name, department_id) VALUES
('Adele', 'Goldberg', 1),
('Ada', 'Lovelace', 1),
('Claude', 'Shannon', 2),
('Katherine', 'Johnson', 2),
('Marie', 'Curie', 3),
('John', 'Dalton', 3),
('Ahmed', 'Zewail', 3),
('Albert', 'Einstein', 4),
('Isaac', 'Newton', 4),
('Immanuel', 'Kant', 5),
('Adam', 'Smith', 6);

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    major_department_id INT,
    CONSTRAINT fk_student_dept FOREIGN KEY(major_department_id) REFERENCES departments(id) ON DELETE CASCADE
);

INSERT INTO students (first_name, last_name, major_department_id) VALUES
('Alice', 'Dobbins', 1),
('Bob', 'Smith', NULL),
('Carol', 'Williams', 2),
('Dan', 'Smith', 1),
('Eve', 'Potter', 1),
('Grace', 'Goldman', 3),
('Faythe', 'Fisher', NULL),
('Hannah', 'Hope', 4),
('Ian', 'Ingalls', 6),
('John', 'Johnson', NULL),
('Kelly', 'Kepler', 6);
