-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1378. Replace Employee ID With The Unique Identifier

SELECT uni.unique_id , emp.name from Employees emp
LEFT JOIN EmployeeUNI uni
    ON uni.id = emp.id;
