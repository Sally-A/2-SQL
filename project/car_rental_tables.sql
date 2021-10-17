--Creating customers data table
CREATE TABLE customers (
custormer_id SERIAL,
ssn INT NOT NULL,
driver_license VARCHAR(25) NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
cust_addr VARCHAR(45) NOT NULL,
cust_city VARCHAR(45) NOT NULL,
cust_state VARCHAR(45) NOT NULL,
country VARCHAR(45) NOT NULL,
phone VARCHAR(45) NOT NULL,
email VARCHAR(45),
PRIMARY KEY(custormer_id) 
);

--Creating office_tel data table
CREATE TABLE office_tel(
default_tel BIGINT NOT NULL,
tel1 BIGINT DEFAULT NULL,
tel2 BIGINT DEFAULT NULL,
tel3 BIGINT DEFAULT NULL,
PRIMARY KEY(default_tel)
);

--Creating crc_office data table
CREATE TABLE crc_office(
location_id VARCHAR(3) NOT NULL,
crc_addr VARCHAR(45) NOT NULL,
crc_city VARCHAR(45) NOT NULL,
crc_state VARCHAR(45) NOT NULL,
crc_country VARCHAR(45) NOT NULL,
default_tel INT NOT NULL,
PRIMARY KEY(location_id),
FOREIGN KEY(default_tel) REFERENCES office_tel(default_tel)
);

--Creating car_type data table
CREATE TABLE car_type(
type_id VARCHAR(4) NOT NULL,
type_label VARCHAR(45) NOT NULL,
type_descr VARCHAR(45) DEFAULT NULL,
PRIMARY KEY(type_id)     
);

--Creating car data table
CREATE TABLE car(
car_id SERIAL,
currentlocation_id VARCHAR(3) NOT NULL,
type_id VARCHAR(4) NOT NULL,
color VARCHAR(45) NOT NULL,
brand VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL,
description VARCHAR(45) DEFAULT NULL,
purch_date DATE NOT NULL,
PRIMARY KEY(car_id),
FOREIGN KEY(currentlocation_id) REFERENCES crc_office(location_id),
FOREIGN KEY(type_id) REFERENCES car_type(type_id)
);

--Creating reservation data table
CREATE TABLE reservation(
reservation_id SERIAL,
amount DOUBLE PRECISION NOT NULL,
pickup_date DATE NOT NULL,
return_date DATE NOT NULL,
pickuplocation_id VARCHAR(3) NOT NULL,
returnlocation_id VARCHAR(3) NOT NULL,
custormer_id INT NOT NULL,
car_id INT NOT NULL,
PRIMARY KEY(reservation_id),
FOREIGN KEY(pickuplocation_id) REFERENCES crc_office(location_id),
FOREIGN KEY(custormer_id) REFERENCES customers(custormer_id),
FOREIGN KEY(car_id) REFERENCES car(car_id)
);


DROP TABLE office_tel
--INSERT INTO table_name (col1, col2, col3) VALUES (val1, val2, val3);

INSERT INTO table_name (ssn, col2, col3) VALUES (val1, val2, val3);

INSERT INTO customers (ssn, driver_license, first_name, last_name, cust_addr, cust_city, cust_state, country, phone, email)
VALUES (111223333, RT12-36D, Bill, Smith, 111 No Where Lane, Salem, OH, USA, 111-222-3333, bill.smith@gmail.com);

INSERT INTO office_tel (default_tel, tel1, tel2, tel3)
VALUES (1112220000, 1112220001, 1112220002, 1112220003);


INSERT INTO customers (ssn, driver_license, first_name, last_name, cust_addr, cust_city, cust_state, country, phone, email)
VALUES (111223333, 'RT12-36D', 'Bill', 'Smith', '111 No Where Lane', 'Salem', 'OH', 'USA', '111-222-3333', 'bill.smith@gmail.com');

INSERT INTO customers (ssn, driver_license, first_name, last_name, cust_addr, cust_city, cust_state, country, phone, email)
VALUES (123456789, 'RT12-345G', 'Jane', 'Doe', '555 Some Where Lane', 'Cleveland', 'OH', 'USA', '222-222-2222', 'jane.doe@gmail.com');

INSERT INTO customers (ssn, driver_license, first_name, last_name, cust_addr, cust_city, cust_state, country, phone, email)
VALUES (987654321, 'AA54-555S', 'John', 'Johnson', '123 Main Street', 'Pittsburgh', 'PA', 'USA', '333-333-3333', 'john.johnson@gmail.com');

INSERT INTO office_tel (default_tel, tel1, tel2, tel3)
VALUES (1112220000, 1112220001, 1112220002, 1112220003);

INSERT INTO office_tel (default_tel, tel1, tel2, tel3)
VALUES (2222220000, 2222220001, 2222220002, 2222220003);

INSERT INTO office_tel (default_tel, tel1, tel2, tel3)
VALUES (3332220000, 3332220001, 3332220002, 3332220003);

INSERT INTO crc_office (location_id, tel1, tel2, tel3)
VALUES (3332220000, 3332220001, 3332220002, 3332220003);


INSERT INTO crc_office (location_id, crc_addr, crc_city, crc_state, crc_country, default_tel)
VALUES (CLE, 100 Rental Lane, Cleveland, OH, USA,1112220000);

INSERT INTO crc_office (location_id, crc_addr, crc_city, crc_state, crc_country, default_tel)
VALUES (AKR, 200 Rental Lane, Akron, OH, USA,2222220000);

INSERT INTO crc_office (location_id, crc_addr, crc_city, crc_state, crc_country, default_tel)
VALUES (PIT, 300 Rental Lane, Pittsburgh, PA, USA,3332220000);


INSERT INTO crc_office (location_id, crc_addr, crc_city, crc_state, crc_country, default_tel)
VALUES (PIT, 300 Rental Lane, Pittsburgh, PA, USA,3332220000);



INSERT INTO car_type (type_id, type_label, type_descr)
VALUES('SUBC', 'Subcompact', '');

INSERT INTO car_type (type_id, type_label, type_descr)
VALUES('COMP', 'Compact', '');

INSERT INTO car_type (type_id, type_label, type_descr)
VALUES('FULL', 'Full Size', '');

INSERT INTO car (currentlocation_id, type_id, color, brand, model, description, purch_date)
VALUES('AKR','SUBC','red','Ford', 'Taurus', 'new', DATE '2021-08-01');

INSERT INTO car (currentlocation_id, type_id, color, brand, model, description, purch_date)
VALUES('CLE','COMP','blue','Chevy', 'Equinox', 'new', DATE '2021-06-05');

INSERT INTO car (currentlocation_id, type_id, color, brand, model, description, purch_date)
VALUES('PIT','FULL','black','Chevy', 'Lumina', 'new', DATE '2021-04-22');


INSERT INTO reservation (amount, pickup_date, return_date, pickuplocation_id, returnlocation_id, custormer_id, car_id)
VALUES (150.86, DATE '2021-08-24', DATE '2021-08-28', 'AKR', 'AKR', 1,  1);

INSERT INTO reservation (amount, pickup_date, return_date, pickuplocation_id, returnlocation_id, custormer_id, car_id)
VALUES (250.86, DATE '2021-09-10', DATE '2021-09-22', 'CLE', 'CLE', 2,  2);

INSERT INTO reservation (amount, pickup_date, return_date, pickuplocation_id, returnlocation_id, custormer_id, car_id)
VALUES (350.86, DATE '2021-09-12', DATE '2021-09-18', 'PIT', 'PIT', 3,  3);



