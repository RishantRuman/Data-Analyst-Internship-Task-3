
-- 1. Find all customers from Bihar
SELECT * FROM Customers
WHERE state = 'Bihar'
ORDER BY created_at DESC;

-- 2. Total orders by each customer
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- 3. Get order details with customer name
SELECT o.order_id, c.name, o.order_date, o.total_amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- 4. List all orders with product names
SELECT o.order_id, p.product_name, oi.quantity
FROM Orders o
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
LEFT JOIN Products p ON oi.product_id = p.product_id;

-- 5. Customers who placed more than 1 order
SELECT * FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);

-- 6. Average revenue per user
SELECT ROUND(SUM(total_amount)/COUNT(DISTINCT customer_id), 2) AS avg_revenue_per_user
FROM Orders;

-- 7. Create a view for customer order summary
CREATE VIEW Customer_Order_Summary AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 8. Add index to optimize query
CREATE INDEX idx_customer_id ON Orders(customer_id);
