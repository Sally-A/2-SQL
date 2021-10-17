-- orders drop constraints
-- depends: 20211004_07_sT7Q1-orders-table
ALTER TABLE orders
    DROP CONSTRAINT fk_orders_customers;
