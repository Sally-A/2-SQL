-- orders drop constraints
-- depends: 20211004_07_sT7Q1-orders-table
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE;
    
