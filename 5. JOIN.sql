-- JOIN
-- column name same na holeo, data similar hote hobe

-- INNER Joins: rows that are same in both tables
-- OUTER JOIN
-- SELF JOIN

-- By default JOIN means INNER JOIN

-- Demographics e id=2 missing, tai main table e ei record nai
SELECT *
FROM employee_demographics as d
INNER JOIN employee_salary as s
	ON d.employee_id = s.employee_id;

SELECT d.employee_id -- same name wala col thakle table.col likhte hobe
FROM employee_demographics as d
INNER JOIN employee_salary as s
	ON d.employee_id = s.employee_id;
    
SELECT age, occupation
FROM employee_demographics as d
INNER JOIN employee_salary as s
	ON d.employee_id = s.employee_id;
    
    
-- Outer JOIN:
	-- Left JOIN: everything from the left, matched items from right
    -- RIGHT JOIN

SELECT *
FROM employee_salary as s  
LEFT JOIN employee_demographics as d
	ON s.employee_id = d.employee_id;
    
SELECT *
FROM employee_demographics as d
RIGHT JOIN employee_salary as s
	ON d.employee_id = s.employee_id;
    
    
    

-- SELF JOIN
-- useful when need to compare rows within the same table
-- helpful to find hierarchical relationships

SELECT emp1.employee_id as ID, 
emp1.first_name as santa_name, 
emp2.employee_id as lucky_id, 
emp2.first_name as lucky_name
FROM employee_salary as emp1
JOIN employee_salary as emp2
ON emp1.employee_id + 1 = emp2.employee_id;

-- Joining tables more than 2

select *
FROM parks_departments;

SELECT *
FROM employee_demographics as d
INNER JOIN employee_salary as s
	ON d.employee_id = s.employee_id;
    
-- demographics ---> salary ---> departments
    
SELECT d.first_name, s.salary, s.occupation, dept.department_name
FROM employee_demographics as d
INNER JOIN employee_salary as s
	ON d.employee_id = s.employee_id
INNER JOIN parks_departments as dept
	ON s.dept_id = dept.department_id;
    
    