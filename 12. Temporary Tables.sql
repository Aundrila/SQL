-- Temporary Tables
-- storig intermediate results for complex queries
-- Exists until session ends or explicitly dropped

CREATE temporary table temp_table
(first_name varchar(50),
fav_movie varchar(100)
);


INSERT INTO temp_table
VALUES('Aundrila', 'Reply 1988'),
('Dwight', 'Battlestar Galactica'),
('Sheldon', 'Star Trek');

SELECT *
FROM temp_table;


-- Traditional Way

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 40000;

SELECT *
FROM salary_over_50k;
