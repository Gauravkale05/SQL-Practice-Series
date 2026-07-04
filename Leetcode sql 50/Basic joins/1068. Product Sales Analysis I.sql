-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1068. Product Sales Analysis I

SELECT p.product_name , s.year, s.price FROM Sales s
LEFT JOIN Product p 
    ON p.product_id = s.product_id;