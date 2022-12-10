/* insert student */
DROP PROCEDURE IF EXISTS `insertStudent`;
DELIMITER $$
CREATE PROCEDURE `insertStudent`(
    IN `stu_id` VARCHAR(10), 
    IN `p_id` INT, 
    IN `c_id` INT, 
    IN `cen_id` INT 
)
BEGIN

    /* check stu_id format */
    IF NOT stu_id REGEXP '^[S][0-9]{5}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid student id format';
    END IF;

    /* check if person exists */
    IF NOT EXISTS (SELECT * FROM `Person` WHERE `person_id` = p_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person does not exist';
    END IF;

    /* check if course exists */
    IF NOT EXISTS (SELECT * FROM `Course` WHERE `course_id` = c_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Course does not exist';
    END IF;

    /* check if center exists */
    IF NOT EXISTS (SELECT * FROM `Center` WHERE `center_id` = cen_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Center does not exist';
    END IF;

    /* check if student exists */
    IF EXISTS (SELECT * FROM `Student` WHERE `student_id` = stu_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student already exists';
    END IF;

    /* check if person is already a student */
    IF EXISTS (SELECT * FROM `Student` WHERE `person_id` = p_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is already a student';
    END IF;
    /* check if person is an employee */
    IF EXISTS (SELECT * FROM `Employee` WHERE `person_id` = p_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is an employee';
    END IF;
    /* check if person is already a parent */
    IF EXISTS (SELECT * FROM `Parent` WHERE `person_id` = p_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is already a parent';
    END IF;

    /* insert student */
    INSERT INTO `Student` (`student_id`, `person_id`, `course_id`, `center_id`) VALUES (stu_id, p_id, c_id, cen_id);

END$$
DELIMITER ;

/* update student */
DROP PROCEDURE IF EXISTS `updateStudent`;
DELIMITER $$
CREATE PROCEDURE `updateStudent`(
    IN `stu_id` VARCHAR(10), 
    IN `p_id` INT, 
    IN `c_id` INT, 
    IN `cen_id` INT 
)
BEGIN

    /* check stu_id format */
    IF NOT stu_id REGEXP '^[S][0-9]{5}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid student id format';
    END IF;

    /* check if person exists */
    IF NOT EXISTS (SELECT * FROM `Person` WHERE `person_id` = p_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person does not exist';
    END IF;

    /* check if course exists */
    IF NOT EXISTS (SELECT * FROM `Course` WHERE `course_id` = c_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Course does not exist';
    END IF;

    /* check if center exists */
    IF NOT EXISTS (SELECT * FROM `Center` WHERE `center_id` = cen_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Center does not exist';
    END IF;

    /* check if student exists */
    IF NOT EXISTS (SELECT * FROM `Student` WHERE `student_id` = stu_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student does not exist';
    END IF;

    /* check if person is an employee */
    IF EXISTS (SELECT * FROM `Employee` WHERE `person_id` = p_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is an employee';
    END IF;

    /* check if person is another student */
    IF EXISTS (SELECT * FROM `Student` WHERE `person_id` = p_id AND `student_id` != stu_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is another student';
    END IF;

    /* update student */
    UPDATE `Student` SET `person_id` = p_id, `course_id` = c_id, `center_id` = cen_id WHERE `student_id` = stu_id;

END$$
DELIMITER ;

/* delete student */
DROP PROCEDURE IF EXISTS `deleteStudent`;
DELIMITER $$
CREATE PROCEDURE `deleteStudent`(
    IN `stu_id` VARCHAR(10)
)
BEGIN

    /* check stu_id format */
    IF NOT stu_id REGEXP '^[S][0-9]{5}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid student id format';
    END IF;

    /* check if student exists */
    IF NOT EXISTS (SELECT * FROM `Student` WHERE `student_id` = stu_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student does not exist';
    END IF;

    /* delete student */
    DELETE FROM `Student` WHERE `student_id` = stu_id;

END$$
DELIMITER ;





