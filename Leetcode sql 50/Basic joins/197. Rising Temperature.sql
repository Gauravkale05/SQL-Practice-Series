-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 197. Rising Temperature

Select w1.id from Weather w1
JOIN weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
Where w1.temperature > w2.temperature;