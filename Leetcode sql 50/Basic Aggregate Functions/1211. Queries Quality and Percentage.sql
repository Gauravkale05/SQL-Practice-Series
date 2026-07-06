-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1211. Queries Quality and Percentage

SELECT query_name , 
ROUND(SUM(rating / position) / COUNT(*),2) AS quality,
ROUND(SUM(
    CASE 
        WHEN rating < 3 THEN 1 ELSE 0
    END    
) * 100 / COUNT(*), 2) as poor_query_percentage
FROM Queries 
GROUP BY query_name;