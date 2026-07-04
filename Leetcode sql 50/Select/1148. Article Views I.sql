-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1148. Article Views I

select DISTINCT author_id as id from  Views Where viewer_id = author_id order by id ASC;