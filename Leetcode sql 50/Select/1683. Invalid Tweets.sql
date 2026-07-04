-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1683. Invalid Tweets

select tweet_id 
from Tweets 
where length(content) > 15;