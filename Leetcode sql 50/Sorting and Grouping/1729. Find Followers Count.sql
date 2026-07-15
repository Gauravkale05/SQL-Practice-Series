-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1729. Find Followers Count


SELECT user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;