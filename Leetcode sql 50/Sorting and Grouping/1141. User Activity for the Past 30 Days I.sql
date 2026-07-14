-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1141. User Activity for the Past 30 Days I


SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users FROM Activity
WHERE activity_date >  DATE_SUB('2019-07-27', INTERVAL 1 MONTH) AND activity_date <=  '2019-07-27'
GROUP BY activity_date;