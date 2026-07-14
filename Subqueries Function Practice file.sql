# --------------------- Level 1 – Basic Subqueries -------------------------------

-- Question 1
-- Find employees whose salary is greater than the average salary.

SELECT emp_id FROM Employee 
Where salary > (SELECT AVG(salary) FROM Employee);

-- Question 2
-- Find the employee(s) who earn the highest salary.

SELECT emp_id FROM employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- Question 3
-- Find employees whose salary is less than the minimum salary in the IT department.

SELECT emp_id FROM Employee 
Where salary < (SELECT MIN(salary) FROM Employee WHERE department_id = 2);


-- Question 4
-- Find employees who work in the same department as Alice.

SELECT emp_id FROM Employee 
Where department_id = (SELECT department_id FROM Employee 
WHERE first_name = 'Alice');

-- Question 5
-- Find employees whose salary is equal to David's salary.

SELECT emp_id FROM Employee
Where salary = (SELECT salary FROM Employee 
WHERE first_name = 'David');

# ------------------------ Level 2 – IN, ANY, ALL Subqueries ---------------------------
-- Q6
-- Find employees who work in departments where at least one employee earns more than 70,000.
-- Hint: Use IN.

SELECT emp_id , first_name , last_name
FROM Employee 
WHERE department_id IN (SELECT department_id FROM Employee WHERE salary > 70000);


-- Q7
-- Find departments that have at least one employee.
-- Hint: Use IN.

SELECT deppartment_name FROM Department 
WHERE department_id IN (SELECT department_id FROM Employee 
GROUP BY department_id 
HAVING COUNT(emp_id) >= 1);

         #  OR

SELECT department_name
FROM Department
WHERE department_id IN (
    SELECT department_id
    FROM Employee
);

-- Q8
-- Find employees whose department is not Finance.
-- Hint: Use NOT IN.

SELECT emp_id , first_name , last_name
FROM Employee 
WHERE department_id NOT IN (SELECT department_id FROM Department WHERE department_name = 'Finance');

-- Q9
-- Find employees earning more than all employees in the HR department.
-- Hint: Use ALL.

SELECT emp_id , first_name , last_name
FROM Employee 
WHERE salary > ALL (SELECT salary FROM Employee Where department_id = 1);

-- Q 10
-- Find employees earning more than any employee in the Finance department.
-- Hint: Use ANY

SELECT emp_id , first_name , last_name
FROM Employee 
WHERE salary > ANY (SELECT salary FROM Employee Where department_id =
	(SELECT department_id FROM Department WHERE department_name = 'Finance'));

# --------------------------Level 3 – Correlated Subqueries---------------------
  
-- Question 11
-- Find employees whose salary is greater than the average salary of their own department.

SELECT e1.emp_id FROM Employee e1
WHERE salary > (SELECT AVG(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

-- Question 12
-- Find the highest-paid employee in each department.

SELECT emp_id , salary FROM Employee e1
WHERE salary = (SELECT MAX(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

-- Question 13
-- Find employees who have the same manager as Alice.

SELECT emp_id , first_name , manager_id FROM Employee
WHERE manager_id = (SELECT manager_id FROM employee WHERE first_name = 'Alice');

-- Question 14
-- Find departments where the average salary is greater than 60,000.

SELECT department_id, AVG(salary) FROM Employee GROUP BY department_id HAVING AVG(salary) > 60000;

-- Question 15
-- Find employees who earn the maximum salary in their department.

SELECT emp_id , salary FROM Employee e1
WHERE salary = (SELECT MAX(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);


#--------------------------------------Level 4 – EXISTS / NOT EXISTS-----------------------------------
-- Question 16
-- Find departments that have employees.

SELECT department_id FROM Department d
WHERE EXISTS (SELECT emp_id FROM Employee e WHERE e.department_id = d.department_id);


-- Question 17
-- Find departments that have no employees.

SELECT department_id FROM Department d
WHERE NOT EXISTS (SELECT emp_id FROM Employee e WHERE e.department_id = d.department_id);

-- Question 18
-- Find employees who manage at least one employee.

SELECT emp_id, first_name FROM Employee e1
WHERE EXISTS (SELECT 1 FROM Employee e2 WHERE e2.manager_id = e1.emp_id);

-- Question 19
-- Find employees who are not managers.

SELECT emp_id, first_name FROM Employee e1
WHERE NOT EXISTS (SELECT 1 FROM Employee e2 WHERE e2.manager_id = e1.emp_id);

-- Question 20
-- Find employees who belong to departments that have more than three employees.

SELECT emp_id, first_name,department_id FROM Employee e1
WHERE EXISTS (SELECT 1 FROM Employee e2 
WHERE e1.department_id = e2.department_id
GROUP BY department_id HAVING count(*) > 3);
#                        OR
SELECT emp_id, first_name,department_id FROM Employee 
WHERE department_id IN (SELECT department_id FROM Employee 
GROUP BY department_id 
HAVING count(*) > 3);
/*
Level 5 – Interview Questions
Question 21

Find the second highest salary using a subquery.

Question 22

Find the third highest salary.

Question 23

Find employees whose salary is above their manager's salary.

Question 24

Find duplicate salaries.

Question 25

Find employees whose salary is greater than the company average but less than the maximum salary.

Level 6 – LeetCode Style
Question 26

Find customers who never placed an order.

(Hint: NOT EXISTS)

Question 27

Find products never sold.

Question 28

Find employees earning more than their department average.

Question 29

Find the manager with the highest number of employees.

Question 30

Find the department with the highest average salary.
*/



