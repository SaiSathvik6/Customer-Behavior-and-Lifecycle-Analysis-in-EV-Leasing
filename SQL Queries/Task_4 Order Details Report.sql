-- Comprehensive Order-Payment Report
SELECT 
    co.order_id,
    co.customer_id,
    co.order_date,
    co.order_status,
    co.order_amount,
    p.payment_id,
    p.payment_status,
    p.payment_date,
    p.payment_amount
FROM customer_orders co
LEFT JOIN payments p ON co.order_id = p.order_id;

-- Unpaid Orders Summary
SELECT co.order_id, co.customer_id, co.order_date, co.order_status, co.order_amount
FROM customer_orders co
LEFT JOIN payments p ON co.order_id = p.order_id
WHERE p.order_id IS NULL;

-- Payment vs Order Fulfillment Status Matrix
SELECT p.payment_status,
    SUM(CASE WHEN co.order_status = 'pending' THEN 1 ELSE 0 END) AS Pending,
    SUM(CASE WHEN co.order_status = 'shipped' THEN 1 ELSE 0 END) AS Shipped,
    SUM(CASE WHEN co.order_status = 'delivered' THEN 1 ELSE 0 END) AS Delivered,
    COUNT(*) AS Total_orders
FROM payments p
JOIN customer_orders co ON p.order_id = co.order_id
GROUP BY p.payment_status;

-- Payment Timing Classification Relative to Order Date
SELECT 
  CASE 
    WHEN p.payment_date < co.order_date THEN 'Prepaid'
    WHEN p.payment_date = co.order_date THEN 'Instant Payment'
    WHEN p.payment_date > co.order_date THEN 'Postpaid'
    ELSE 'Missing Data'
  END AS payment_timing,
  COUNT(*) AS count
FROM customer_orders co
JOIN payments p ON co.order_id = p.order_id
WHERE p.payment_date IS NOT NULL
GROUP BY payment_timing;

-- Missing payments per order status:
SELECT order_status, COUNT(*) AS orders_without_payment
FROM customer_orders co
LEFT JOIN payments p ON co.order_id = p.order_id
WHERE p.payment_id IS NULL
GROUP BY order_status;