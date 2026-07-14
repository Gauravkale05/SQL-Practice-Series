-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 550. Game Play Analysis IV


SELECT ROUND(COUNT(A1.player_id)/(SELECT COUNT(DISTINCT A2.player_id) FROM Activity A2),2) AS fraction FROM Activity A1
WHERE (A1.player_id, DATE_SUB(A1.event_date, INTERVAL 1 DAY)) IN 
(  SELECT A3.player_id, MIN(A3.event_date) FROM Activity A3 GROUP By A3.player_id);