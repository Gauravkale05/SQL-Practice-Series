-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1661. Average Time of Process per Machine


SELECT a.machine_id , ABS(ROUND(AVG(a.timestamp-b.timestamp),3)) as processing_time
FROM ACTIVITY a
JOIN Activity b ON  a.machine_id = b.machine_id AND a.process_id = b.process_id AND a.activity_type = 'start' AND b.activity_type = 'end'
GROUP BY a.machine_id;