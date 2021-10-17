-- customers date_of_birth not null
-- depends: 20211004_02_AlhA0-customers-date-of-birth
ALTER TABLE customers
    ALTER COLUMN date_of_birth SET NOT NULL;
    
