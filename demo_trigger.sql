DELIMITER $$
CREATE PROCEDURE `insertStudent`(IN `student_id` VARCHAR(10), IN `person_id` INT, IN `course_id` INT, IN `center_id` INT )
BEGIN
    /* check if person_id exists */
    IF EXISTS (SELECT * FROM `Person` WHERE `id` = person_id) THEN
        /* check student_id format */
        IF student_id REGEXP '^[S][0-9]{5}$' THEN
            /* check if student_id exists */
            IF NOT EXISTS (SELECT * FROM `Student` WHERE `student_id` = student_id) THEN
                /* check if course_id exists */
                IF EXISTS (SELECT * FROM `Course` WHERE `id` = course_id) THEN
                    /* check if center_id exists */
                    IF EXISTS (SELECT * FROM `Center` WHERE `id` = center_id) THEN
                        /* insert student */
                        INSERT INTO `Student` (`student_id`, `person_id`, `course_id`, `center_id`) VALUES (student_id, person_id, course_id, center_id);
                        /* insert student into class */
                        INSERT INTO `Enroll` (`student_id`, `class_id`) VALUES (student_id, course_id);
                    ELSE
                        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Center does not exist';
                    END IF;
                ELSE
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Course does not exist';
                END IF;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Student already exists';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid student_id format';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Person does not exist';
    END IF;
END$$
DELIMITER ;

/* insert teacher report */
DELIMITER $$
CREATE PROCEDURE `insertTeacherReport`(IN `employee_id` VARCHAR(10), IN `attendance` VARCHAR(10), IN `note` VARCHAR(100), IN `schedule_id` INT)
BEGIN
    /* check if employee_id exists */
    IF EXISTS (SELECT * FROM `Employee` WHERE `employee_id` = employee_id) THEN
        /* check if schedule_id exists */
        IF EXISTS (SELECT * FROM `Schedule` WHERE `id` = schedule_id) THEN
            /* check if attendance is valid */
            IF attendance = 'present' OR attendance = 'absent' THEN
                /* insert teacher report */
                INSERT INTO `TeacherReport` (`employee_id`, `attendance`, `note`, `schedule_id`) VALUES (employee_id, attendance, note, schedule_id);
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid attendance';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Schedule does not exist';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee does not exist';
    END IF;
END$$
DELIMITER ;


/* update teacher report */
DELIMITER $$
CREATE PROCEDURE `updateTeacherReport` (IN `employee_id` VARCHAR(10), IN `attendance` VARCHAR(10), IN `note` VARCHAR(100), IN `schedule_id` INT)
BEGIN
    /* check if employee_id exists */
    IF EXISTS (SELECT * FROM `Employee` WHERE `employee_id` = employee_id) THEN
        /* check if schedule_id exists */
        IF EXISTS (SELECT * FROM `Schedule` WHERE `id` = schedule_id) THEN
            /* check if attendance is valid */
            IF attendance = 'present' OR attendance = 'absent' THEN
                /* update teacher report */
                UPDATE `TeacherReport` SET `attendance` = attendance, `note` = note WHERE `employee_id` = employee_id AND `schedule_id` = schedule_id;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid attendance';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Schedule does not exist';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee does not exist';
    END IF;
END$$
DELIMITER ;


/* delete teacher report */
DELIMITER $$
CREATE PROCEDURE `deleteTeacherReport` (IN `employee_id` VARCHAR(10), IN `schedule_id` INT)
BEGIN
    /* check if employee_id exists */
    IF EXISTS (SELECT * FROM `Employee` WHERE `employee_id` = employee_id) THEN
        /* check if schedule_id exists */
        IF EXISTS (SELECT * FROM `Schedule` WHERE `id` = schedule_id) THEN
            /* delete teacher report */
            DELETE FROM `TeacherReport` WHERE `employee_id` = employee_id AND `schedule_id` = schedule_id;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Schedule does not exist';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee does not exist';
    END IF;
END$$


/* trigger to update total discounted amount when AppliedDiscount is updated */
/* TODO */



/* trigger to update total discounted amount when AppliedDiscount is deleted */
/* TODO */


/* procedure to get notes of a student of a class from StudentReport */
DROP PROCEDURE IF EXISTS `getStudentReport`;
DELIMITER $$
CREATE PROCEDURE `getStudentReport` (IN `student_id` VARCHAR(10), IN `class_name` VARCHAR(100))
BEGIN
    /* check if student_id exists */
    IF EXISTS (SELECT * FROM `Student` WHERE `student_id` = student_id) THEN
        /* check if class_name exists */
        IF EXISTS (SELECT * FROM `Class` WHERE `class_name` = class_name) THEN
            /* get notes */
            SELECT `note`, `StudentReport`.`created_at` as `time` FROM `StudentReport` 
            LEFT JOIN `Schedule` ON `StudentReport`.`schedule_id` = `Schedule`.`schedule_id`
            LEFT JOIN `Class` ON `Schedule`.`class_id` = `Class`.`class_id`
            WHERE `StudentReport`.`student_id` = student_id AND `Class`.`class_name` = class_name;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Class does not exist';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Student does not exist';
    END IF;
END$$
DELIMITER ;

CALL getStudentReport('S10001', 'Basic Listening');


