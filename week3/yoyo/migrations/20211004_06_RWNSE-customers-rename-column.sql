-- customers rename column
-- depends: 20211004_05_P7Rlt-customers-date-of-birth-set-default
ALTER TABLE customers
    RENAME COLUMN date_of_birth TO dob;
