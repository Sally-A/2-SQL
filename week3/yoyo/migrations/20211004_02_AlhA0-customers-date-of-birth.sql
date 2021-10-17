-- customers date_of_birth
-- depends: 20211004_01_cGHvm-customers-table
ALTER TABLE customers
    ADD COLUMN date_of_birth TIMESTAMP;
