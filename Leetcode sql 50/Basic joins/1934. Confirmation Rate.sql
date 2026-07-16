-- Platform: LeetCode
-- Difficulty: Medium
-- Problem: 1934. Confirmation Rate


SELECT s.user_id , ROUND(IFNULL(SUM(c.action = 'confirmed') / COUNT(s.user_id),0),2) AS confirmation_rate
FROM Signups as s
LEFT JOIN Confirmations AS c
ON s.user_id = c.user_id
GROUP BY s.user_id;
