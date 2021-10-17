-- orders table
-- depends: 20211004_06_RWNSE-customers-rename-column
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    dollar_amount_spent NUMERIC,
    customer_id INT NOT NULL,
    CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON DELETE CASCADE
);
