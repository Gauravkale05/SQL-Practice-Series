-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1789. Primary Department for Each Employee

SELECT employee_id , department_id FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1
UNION ALL 
SELECT employee_id , department_id FROM Employee
WHERE primary_flag = 'Y';