-- customers date_of_birth set default
-- depends: 20211004_04_UwIOa-customers-date-of-birth-not-null-set-default
ALTER TABLE customers
    ALTER COLUMN date_of_birth DROP DEFAULT;

