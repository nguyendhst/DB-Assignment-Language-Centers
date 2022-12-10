
/* procedures for employee table */

/* insert employee */
DROP PROCEDURE IF EXISTS `insertEmployee`;
DELIMITER $$
CREATE PROCEDURE `insertEmployee`(
    IN `per_id` INT,
    IN `emp_id` VARCHAR(8),
    IN `sal` INT,
    IN `man_id` VARCHAR(8)
)
BEGIN

    /* check employee id */
    IF NOT emp_id REGEXP '^[E][0-9]{5}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid employee id';
    END IF;

    /* check manager id */
    IF NOT man_id REGEXP '^[E][0-9]{5}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid manager employee id';
    END IF;

    /* check if the person exists */
    IF NOT EXISTS (SELECT * FROM `Person` WHERE `person_id` = per_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person does not exist';
    END IF;

    /* check if the employee exists */
    IF EXISTS (SELECT * FROM `Employee` WHERE `employee_id` = emp_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee already exists';
    END IF;

    /* check if person is already an employee */
    IF EXISTS (SELECT * FROM `Employee` WHERE `person_id` = per_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is already an employee';
    END IF;

    /* check if person is already a student */
    IF EXISTS (SELECT * FROM `Student` WHERE `person_id` = per_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is already a student';
    END IF;

    /* check if person is already a parent */
    IF EXISTS (SELECT * FROM `Parent` WHERE `person_id` = per_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is already a parent';
    END IF;

    /* check if manager exists */
    IF EXISTS (SELECT * FROM `Employee` WHERE `employee_id` = man_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Manager does not exist';
    END IF;

    /* check if salary is positive */
    IF sal < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;

    /* insert employee */
    INSERT INTO `Employee` (`person_id`, `employee_id`, `salary`, `manager_id`) VALUES (per_id, emp_id, sal, man_id);

END$$
DELIMITER ;

