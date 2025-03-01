-- CTE
-- CTE (Common Table Expression)
-- a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement
-- Use Case: When we need to simplify complex queries by breaking them into readable parts.
-- Exists for one query

WITH CTE_Example as
(
SELECT gender,
AVG(salary) as avg_salary, 
MAX(salary) as max_salary, 
MIN(salary) as min_salary, 
COUNT(salary) as count_salary
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT ROUND(AVG(avg_salary), 2) as total_average
FROM CTE_Example
;

WITH CTE_Example (Gender, Avg_Salary, Max_Salary, Min_Salary, Count_Salary) as -- overwritting the names
(
SELECT gender,
AVG(salary) as avg_salary, 
MAX(salary) as max_salary, 
MIN(salary) as min_salary, 
COUNT(salary) as count_salary
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;

-- Multiple CTE
WITH CTE_Example As
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS -- with bad
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id;
