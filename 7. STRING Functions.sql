-- String Function

Select LENGTH('Aundrila');

SELECT first_name, length(first_name) as length
FROM parks_and_recreation.employee_demographics
ORDER by length;

SELECT CONCAT(2,3); 
SELECT CONCAT('Hello', ' ', 'World');
SELECT CONCAT(2+3);

SELECT TRIM('             SKy           ');
SELECT LTRIM('             SKy          ');
SELECT RTRIM('             SKy           ');


-- Substring

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
substring(first_name, 3, 2),
birth_date,
substring(birth_date, 6, 2) month
FROM parks_and_recreation.employee_demographics;


-- Replace
SELECT first_name, replace(first_name, 'e', 'o')
FROM parks_and_recreation.employee_demographics;

-- Locate
SELECT LOCATE('u', 'Aundrila');

SELECT first_name, LOCATe('A', first_name)
FROM parks_and_recreation.employee_demographics;

SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM parks_and_recreation.employee_demographics;