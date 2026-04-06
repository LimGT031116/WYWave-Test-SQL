SELECT 
    SUM(order_total_quantity) AS total_quantity_sold,
    AVG(order_total_quantity) AS avg_quantity_per_order,
    SUM(order_total_amount) AS total_sales_amount,
    AVG(order_total_amount) AS avg_sales_per_order
FROM (
    SELECT 
        s.order_id, -- Unique order ID (grouping key)
        SUM(s.quantity) AS order_total_quantity, -- Total quantity of items sold in this order (sum of all products in the order)
        MAX(o.total_amount) AS order_total_amount -- Total sales amount for the order (use MAX to avoid duplication after JOIN)
    FROM sales s
    JOIN orders o
        ON s.order_id = o.order_id
    GROUP BY s.order_id
) AS order_summary;