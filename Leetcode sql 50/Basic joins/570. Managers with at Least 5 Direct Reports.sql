-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 570. Managers with at Least 5 Direct Reports


SELECT emp1.name FROM Employee emp1 
JOIN Employee emp2
        ON emp1.id = emp2.managerId
GROUP BY emp1.name , emp1.id
HAVING COUNT(emp2.managerId) >= 5;