-- Group By
-- The GROUP BY function in SQL is used to group rows that have the same values in
-- specified columns into summary rows. It is commonly used with aggregate functions
-- (like SUM(), AVG(), COUNT(), etc.) to perform calculations on each group.


SELECT gender 
FROM parks_and_recreation.employee_demographics;

-- first e and last a same column thaka lagbe
SELECT salary 
FROM parks_and_recreation.employee_salary
Group By salary;

-- showing error because 2ta different column
-- SELECT salary 
-- FROM parks_and_recreation.employee_salary
-- Group By occupation;

-- Select e aggerating function use korle tokhon 2ta alada column use kora jabe
SELECT AVG(salary) 
FROM parks_and_recreation.employee_salary
Group By occupation;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
Group By occupation;

SELECT occupation, ROUND(AVG(salary), 2) as avg_salary
FROM parks_and_recreation.employee_salary
Group By occupation
ORDER BY avg_salary DESC;

SELECT gender, ROUND(AVG(age), 2) as avg_age
FROM parks_and_recreation.employee_demographics
Group by gender;

-- Group By, Join
Select gender, ROUND(AVG(salary), 2) as avg_salary
from parks_and_recreation.employee_demographics
Join parks_and_recreation.employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id -- je column niye join er on korbo seta select e thaka lagbe na
group by gender
ORDER BY avg_salary DESC;

SELECT gender, ROUND(AVG(age), 2) as avg_age, max(age), MIN(age), COUNT(gender)
FROM parks_and_recreation.employee_demographics
Group by gender;



-- ORDER BY
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY age;

SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age DESC;

-- ORDER BY based on the position of the fields
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY 5, 4 DESC; -- Index starting from 1


