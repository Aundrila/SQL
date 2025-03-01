-- WHRERE, Having

-- WHERE: 
-- Before Group By
-- can not be used with aggregated functions

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation = 'Nurse'; -- whole salary avg na kore just city anager er 

-- HAVING:
-- After Group BY
-- Works on Group data

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation
having occupation = 'Nurse'; 

SELECT occupation, AVG(salary) as avg_salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation; 

SELECT occupation, AVG(salary) as avg_salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation
having avg_salary > 50000; 

-- Combine where and having
-- where row filter korbe
-- after that having aggregate function apply korbe
SELECT occupation, AVG(salary) as avg_salary
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
having avg_salary > 50000; 