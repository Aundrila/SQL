-- LIMIT ALIASING
-- LIMIT: how many rows

-- 3 oldest employee: but eita true approach na
SELECT age
FROM parks_and_recreation.employee_demographics
Group By age
ORDER BY age desc
limit 3;

-- 3 oldest employee
SELECT first_name, age
FROM parks_and_recreation.employee_demographics
ORDER BY age desc
limit 3;

SELECT first_name, age
FROM parks_and_recreation.employee_demographics
ORDER BY age desc;

-- 4th oldest employeee
SELECT first_name, age
FROM parks_and_recreation.employee_demographics
ORDER BY age desc
limit 3, 1;

-- (4-6)th oldest employee
SELECT first_name, age
FROM parks_and_recreation.employee_demographics
ORDER BY age desc
limit 3, 3; -- desc order e 3 number person er pore 3ta record dekhacchi


-- Aliasing: change the name of the column
SELECT gender, AVG(age) avg_age
from employee_demographics
GROUP BY gender
HAVING avg_age > 40;