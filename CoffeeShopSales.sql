/*
Coffee Shop Sales Analysis
Tables: sales, products, customers, city
Author: Venkat Abhinay Palepu
Date: 2025-10-17
*/

-- 1. Retrieve all sales data
SELECT * FROM sales;

-- 2. Retrieve products with their total sales
SELECT p.product_name, SUM(s.total) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 3. Retrieve top 5 sold products
SELECT p.product_name, SUM(s.total) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 5;

-- 4. Average rating per product
SELECT p.product_name, AVG(s.rating) AS avg_rating
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 5. Customer with highest total purchase
SELECT c.customer_name, SUM(s.total) AS total_purchase
FROM customers c
JOIN sales s ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_purchase DESC
LIMIT 1;

-- 6. Customers with at least 3 purchases
SELECT c.customer_name, COUNT(s.product_id) AS count
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name
HAVING COUNT(s.product_id) >= 3
ORDER BY count ASC;

-- 7. Total revenue per city
SELECT ci.city_name, SUM(s.total) AS total_revenue
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
JOIN city ci ON cu.city_id = ci.city_id
GROUP BY ci.city_name;

-- 8. Products never sold
SELECT p.product_name, COUNT(s.product_id) AS counts
FROM products p
LEFT JOIN sales s ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY counts ASC;

-- 9. City with highest number of customers
SELECT ci.city_name, COUNT(cu.customer_id) AS total_customers
FROM city ci
JOIN customers cu ON ci.city_id = cu.city_id
GROUP BY ci.city_name
ORDER BY total_customers DESC
LIMIT 1;

-- 10. Most frequently purchased product
SELECT p.product_name, COUNT(s.product_id) AS total_count
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_count DESC
LIMIT 1;

-- 11. Month with highest sales revenue
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, SUM(total) AS total_sales
FROM sales
GROUP BY month
ORDER BY total_sales DESC
LIMIT 1;

-- 12. Average selling price per product
SELECT p.product_name, AVG(s.total) AS average_price
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 13. Top 5 cities with highest revenue per customer
SELECT ci.city_name, SUM(s.total)/COUNT(DISTINCT cu.customer_id) AS revenue_per_customer
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
JOIN city ci ON cu.city_id = ci.city_id
GROUP BY ci.city_name
ORDER BY revenue_per_customer DESC
LIMIT 5;

-- 14. Product with highest average rating
SELECT p.product_name, AVG(s.rating) AS average_rating
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY average_rating DESC
LIMIT 1;

-- 15. Customers who purchased only one product
SELECT c.customer_name, COUNT(DISTINCT s.product_id) AS product_count
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING product_count = 1;
