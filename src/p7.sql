-- Delete all orders of the customer first
DELETE FROM orders
WHERE customer_id = 1;

-- Then delete the customer
DELETE FROM customers
WHERE customer_id = 1;