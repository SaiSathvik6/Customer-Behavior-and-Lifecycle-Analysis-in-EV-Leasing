-- Average Order Value
SELECT ROUND(AVG(order_amount), 2) FROM customer_orders;

-- Average orders per customer
SELECT ROUND(COUNT(order_id) / COUNT(DISTINCT customer_id), 2) AS avg_orders_per_customer
FROM customer_orders;

-- Top 10 Customers by Total Order Value
SELECT customer_id, ROUND(SUM(order_amount), 2) AS total_spent
FROM customer_orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Number of Repeat Customers
WITH repeated_table AS (
    SELECT customer_id, COUNT(order_id) AS orders
    FROM customer_orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
    ORDER BY orders DESC
)
SELECT COUNT(*) AS repeated_customers FROM repeated_table;


-- Customer Segmentation by Order Frequency
SELECT category, COUNT(*) AS count
FROM (
    SELECT customer_id,
           CASE 
               WHEN COUNT(order_id) > 4 THEN 'Loyal Customers'
               WHEN COUNT(order_id) BETWEEN 2 AND 4 THEN 'Returning Customers'
               ELSE 'New Customers'
           END AS category
    FROM customer_orders
    GROUP BY customer_id
) AS classified_customers
GROUP BY category;

-- Monthly Order Volume Trend
SELECT 
    MONTHNAME(order_date) AS `month`,
    MONTH(order_date) AS MonthNumber,
    COUNT(order_id) AS total_orders
FROM customer_orders
GROUP BY MONTH(order_date)
ORDER BY MonthNumber;

-- Monthly New Customer Trend
WITH first_order AS (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
)
SELECT 
    YEAR(first_order_date) AS `Year`,
    MONTHNAME(first_order_date) AS `Month`,
    COUNT(customer_id) AS new_customers
FROM first_order
GROUP BY YEAR(first_order_date), MONTH(first_order_date)
ORDER BY `Year`, MONTH(first_order_date);