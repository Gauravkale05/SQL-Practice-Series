-- Platform: LeetCode
-- Difficulty: Easy
-- Problem: 1280. Students and Examinations


SELECT st.student_id , st.student_name, s.subject_name, count(ex.student_id) as attended_exams
FROM Students st
CROSS JOIN Subjects s 
LEFT JOIN Examinations ex ON st.student_id = ex.student_id 
    AND s.subject_name = ex.subject_name
GROUP BY st.student_id,st.student_name, s.subject_name
ORDER BY st.student_id,st.student_name, s.subject_name;