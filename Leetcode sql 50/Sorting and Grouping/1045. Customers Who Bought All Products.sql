-- Platform: LeetCode
-- Difficulty: Medium
-- Problem: 1045. Customers Who Bought All Products


SELECT DISTINCT customer_id FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product);