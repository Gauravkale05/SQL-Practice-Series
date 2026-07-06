-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 620. Not Boring Movies

select * from Cinema Where id % 2 != 0 AND description !='boring'
Order by rating DESC;