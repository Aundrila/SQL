-- Window Functions
-- allow to perform aggregations across a set of rows without collapsing them into a single row, unlike GROUP BY

-- row numbers
-- ranks 
-- dense rank

-- compare gender and salaries in demographics

select gender,
AVG(salary) avg_salary
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id
GROUP BY gender;

-- using window function

select gender,
AVG(salary) OVER()
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id; -- multiple rows dekhate thake

select employee_demographics.first_name,
gender,
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;

select employee_demographics.first_name,
gender,
salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY employee_demographics.employee_id) AS Rolling_total -- cumulative
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;


-- row numbers

select employee_demographics.employee_id,
employee_demographics.first_name,
gender,
salary,
row_number() OVER()
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;

select employee_demographics.employee_id,
employee_demographics.first_name,
gender,
salary,
row_number() OVER(partition by gender ORDER BY salary DESC) as row_num, -- duplicate value ke different number assign kore
RANK() OVER(partition by gender ORDER BY salary DESC) as rank_num, -- duplicate value ke same value assign kore, next number position onujayi
DENSE_RANK() OVER(partition by gender ORDER BY salary DESC) as dense_rank_num -- duplicate value ke same value assign kore, next number auto increament onujayi
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;

-- Lead: Compare Each Employee’s Salary to the Next Highest

select employee_demographics.first_name,
gender,
salary,
LEAD(salary) OVER(PARTITION BY gender ORDER BY salary DESC) AS Lead_salary
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;

select employee_demographics.first_name,
gender,
salary,
LAG(salary) OVER(PARTITION BY gender ORDER BY salary) AS Lag_salary
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;

-- Label Salaries as Above or Below Average within gender

SELECT dem.first_name,
gender,
salary,
CASE
	WHEN salary >= AVG(salary) OVER (partition by gender) THEN 'Above AVerage'
    ELSE 'BELOW AVERAGE'

END as salary_level
FROM employee_demographics as dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id;

--  Find 3rd Highest Salary

select first_name, salary
from employee_salary
ORDER BY SALARY DESC
LIMIT 1 offset 3;