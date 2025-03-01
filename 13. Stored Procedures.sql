-- Stored Procedures
-- helpful for storing complex queries
-- simplify repetitive code


CREATE PROCEDURE large_salaries ()
SELECT *
FROM employee_salary
WHERE salary >= 40000;

CALL large_salaries();


-- Real-world case
DELIMITER $$
CREATE PROCEDURE large_salaries3 ()
BEGIN

	SELECT *
	FROM employee_salary
	WHERE salary >= 40000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 70000;

END $$
DELIMITER ;

CALL large_salaries3 (); -- returns 2 result tables

-- employee_id = 1 

DELIMITER $$
CREATE PROCEDURE large_salaries5(id INT)
BEGIN

	SELECT *
	FROM employee_salary
	WHERE employee_id = id;
END $$
DELIMITER ;
CALL large_salaries5(1)