-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1731. The Number of Employees Which Report to Each Employee
 
SELECT 
    e.employee_id, 
    e.name, 
    COUNT(em.reports_to) AS reports_count, 
    ROUND(AVG(em.age),0) AS average_age
FROM Employees e
JOIN Employees em ON e.employee_id = em.reports_to
GROUP BY e.employee_id
ORDER BY e.employee_id;