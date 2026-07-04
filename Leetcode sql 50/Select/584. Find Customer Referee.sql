-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 584. Find Customer Referee

SELECT name from Customer where referee_id != 2 OR referee_id is null;