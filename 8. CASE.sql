-- Case Statements

-- Allows to add logic in select statements

SELECT first_name, age, -- ends with a comma
CASE
	WHEN age < 40 THEN 'YOUNG' -- ends with an END
END
FROM parks_and_recreation.employee_demographics;

SELECT first_name, age, -- ends with a comma
CASE 
	WHEN age < 40 THEN 'YOUNG'
    WHEN age BETWEEN 40 and 50 THEN 'Mid-age'
    ELSE 'OLD'
END as 'category'
FROM parks_and_recreation.employee_demographics;



-- Pay Increase and Bonus
-- salary < 50000 = 5% raise
-- else 7%
-- Finance 10% bonus

select *
from parks_and_recreation.parks_departments;

SELECT first_name, occupation, salary, 
CASE
	When salary < 50000 THEN (salary + ROUND(((salary*5)/100), 2)) -- Or salary * 1.05
    WHEN salary > 50000 THEN (salary + ROUND(((salary*7)/100), 2))
END as 'New_salary',
CASE
	 WHEN dept_id = 6 THEN (salary + ROUND(((salary*10)/100), 2))
END as 'Bonus'

FROM parks_and_recreation.employee_salary;



select *
from parks_and_recreation.employee_salary;


