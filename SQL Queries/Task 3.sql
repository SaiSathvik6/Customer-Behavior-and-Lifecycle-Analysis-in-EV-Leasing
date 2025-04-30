-- Total and Average Payment Amount
SELECT ROUND(SUM(payment_amount), 2) AS Total_Amount, 
       ROUND(AVG(payment_amount), 2) AS Average_Amount 
FROM payments;

-- Payment Status Distribution
SELECT payment_status, COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status
ORDER BY total_payments DESC;

-- Payment Completion Rate by Month
SELECT 
    YEAR(payment_date) AS Year,
    MONTHNAME(payment_date) AS Month,
    ROUND(100 * SUM(CASE WHEN payment_status = 'completed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS completion_rate_pct
FROM payments
GROUP BY Year, Month
ORDER BY Year, Month(payment_date);

-- Yearly & Monthly Payment Status Breakdown
SELECT 
    YEAR(payment_date) AS `Year`,
    MONTH(payment_date) AS Month_Number,
    MONTHNAME(payment_date) AS `Month`,
    SUM(CASE WHEN payment_status = 'failed' THEN 1 ELSE 0 END) AS failed_payments,
    SUM(CASE WHEN payment_status = 'pending' THEN 1 ELSE 0 END) AS pending_payments,
    SUM(CASE WHEN payment_status = 'completed' THEN 1 ELSE 0 END) AS successful_payments
FROM payments
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY `Year`, Month_Number;

-- Payment Amount Analysis by Status
SELECT payment_status, round(AVG(payment_amount),2) AS Average_Amount , round(sum(payment_amount),2) as Total_Amount
FROM payments
GROUP BY payment_status;

-- Overall Payment Failure Rate(%)
SELECT 
  ROUND(100.0 * SUM(CASE WHEN payment_status = 'failed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS failure_rate_percent
FROM payments;

-- Payment Failures by Order Status
SELECT co.order_status, COUNT(*) AS payment_failures
FROM payments p
JOIN customer_orders co ON p.order_id = co.order_id
WHERE p.payment_status = 'Failed'
GROUP BY co.order_status;

-- Monthly Payment Failure Rate
SELECT 
    YEAR(payment_date) AS `Year`,
    MONTHNAME(payment_date) AS `Month`,
    ROUND(100.0 * SUM(CASE WHEN payment_status = 'failed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS failure_rate_percent
FROM payments
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY `Year`, MONTH(payment_date);