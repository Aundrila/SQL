SELECT first_name, salary
FROM parks_and_recreation.employee_salary
WHERE salary > 60000;

SELECT distinct dept_id
FROM parks_and_recreation.employee_salary;

-- Logical Operator AND OR 
-- same table
SELECT first_name, salary, occupation
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
AND occupation = 'Office Manager';

-- Multiple tables using join
SELECT employee_demographics.first_name, employee_salary.salary, employee_demographics.gender
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id
WHERE salary > 50000 AND gender = 'Female';

-- PEMDAS
SELECT first_name, salary, occupation
FROM parks_and_recreation.employee_salary
WHERE (salary > 60000 AND occupation = 'Office Manager') OR first_name = 'TOM';

-- LIKE statement - not case sensistive
-- % means aanything, _ any specifica values
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'JE%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'; -- starting with an a, and 2 characters after a

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___';

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%';
