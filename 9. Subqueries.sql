-- Subqueries
-- a query inside another query
-- sometimes join diyeo same kaj kora jay

-- SQ in WHERE Clause

-- Employee who works for parks_and_rec...

Select *
From parks_departments;

SELECT *
FROM employee_salary;

-- SQ in WHERE Clause

-- select everything from demographic table where employee works in park_and_reccc

SELECT employee_demographics.first_name, employee_demographics.employee_id
FROM employee_demographics
JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
WHERE employee_salary.dept_id = 1;

-- using subqueries
SELECT first_name, employee_id
FROM employee_demographics
WHERE employee_id IN (
				SELECT employee_id -- eikhane kebol ekta column deya jabe
                from employee_salary
                WHERE dept_id = 1
);


-- Use subqueries if you need to compare values against aggregates.
-- salary and average salary
SELECT salary,
CASE
	WHEN salary >= (SELECT AVG(salary) FROM employee_salary) THEN 'Above Average'
    else 'Below Average'
    
END as 'Label'
FROM employee_salary;

-- SQ in SELECT statements
SELECT salary,
(SELECT ROUND(AVG(salary), 2)
FROM employee_salary 
) as avg_salary
FROM employee_salary;

-- SQ in FROM statements

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY Gender;

-- max age er avg, min age er avg ei table theke ber kora jab e na

SELECT AVG(max_age)
FROM(
SELECT gender,
AVG(age) as avg_age,
MAX(age) as max_age,
MIN(age) as min_age,
COUNT(age) as count_age
FROM employee_demographics
GROUP BY gender) as AGG_table;





