-- Total Unique Customers
SELECT COUNT(DISTINCT customer_id) AS Total_customers FROM customer_orders;

-- Order Count by Status
SELECT order_status, COUNT(*) AS number_of_orders FROM customer_orders GROUP BY order_status;

-- Monthly Revenue Trend
SELECT 
  YEAR(order_date) AS `Year`, 
  MONTHNAME(order_date) AS `Month`, 
  ROUND(SUM(order_amount), 2) AS revenue
FROM customer_orders
GROUP BY YEAR(order_date), MONTHNAME(order_date)
ORDER BY `Year` ASC;


-- Monthly Revenue Breakdown by Year
SELECT 
    YEAR(order_date) AS `Year`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 1 THEN order_amount ELSE 0 END), 2) AS `January`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 2 THEN order_amount ELSE 0 END), 2) AS `February`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 3 THEN order_amount ELSE 0 END), 2) AS `March`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 4 THEN order_amount ELSE 0 END), 2) AS `April`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 5 THEN order_amount ELSE 0 END), 2) AS `May`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 6 THEN order_amount ELSE 0 END), 2) AS `June`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 7 THEN order_amount ELSE 0 END), 2) AS `July`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 8 THEN order_amount ELSE 0 END), 2) AS `August`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 9 THEN order_amount ELSE 0 END), 2) AS `September`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 10 THEN order_amount ELSE 0 END), 2) AS `October`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 11 THEN order_amount ELSE 0 END), 2) AS `November`,
    ROUND(SUM(CASE WHEN MONTH(order_date) = 12 THEN order_amount ELSE 0 END), 2) AS `December`
FROM customer_orders
GROUP BY `Year`
ORDER BY `Year` ASC;

-- Yearly Order Volume
SELECT YEAR(order_date) AS `year`, COUNT(order_id) AS Total_orders 
FROM customer_orders 
GROUP BY YEAR(order_date)
ORDER BY `year` ASC;


-- Monthly Order Volume Breakdown by Year
SELECT 
    YEAR(order_date) AS `Year`,
    COUNT(CASE WHEN MONTH(order_date) = 1 THEN order_id END) AS `January`,
    COUNT(CASE WHEN MONTH(order_date) = 2 THEN order_id END) AS `February`,
    COUNT(CASE WHEN MONTH(order_date) = 3 THEN order_id END) AS `March`,
    COUNT(CASE WHEN MONTH(order_date) = 4 THEN order_id END) AS `April`,
    COUNT(CASE WHEN MONTH(order_date) = 5 THEN order_id END) AS `May`,
    COUNT(CASE WHEN MONTH(order_date) = 6 THEN order_id END) AS `June`,
    COUNT(CASE WHEN MONTH(order_date) = 7 THEN order_id END) AS `July`,
    COUNT(CASE WHEN MONTH(order_date) = 8 THEN order_id END) AS `August`,
    COUNT(CASE WHEN MONTH(order_date) = 9 THEN order_id END) AS `September`,
    COUNT(CASE WHEN MONTH(order_date) = 10 THEN order_id END) AS `October`,
    COUNT(CASE WHEN MONTH(order_date) = 11 THEN order_id END) AS `November`,
    COUNT(CASE WHEN MONTH(order_date) = 12 THEN order_id END) AS `December`
FROM customer_orders
GROUP BY `Year`
ORDER BY `Year` ASC;

-- Yearly Order Status Distribution
SELECT 
  YEAR(order_date) AS `Year`,
  COUNT(CASE WHEN order_status = 'pending' THEN 1 END) AS `Pending`,
  COUNT(CASE WHEN order_status = 'delivered' THEN 1 END) AS `Delivered`,
  COUNT(CASE WHEN order_status = 'shipped' THEN 1 END) AS `Shipped`
FROM customer_orders
GROUP BY YEAR(order_date)
ORDER BY `Year` ASC;

-- Average Order Value per month
SELECT 
    YEAR(order_date) AS Year,
    MONTHNAME(order_date) AS Month,
    ROUND(SUM(order_amount) / COUNT(order_id), 2) AS avg_order_value
FROM customer_orders
GROUP BY Year, Month
ORDER BY Year, MONTH(order_date);