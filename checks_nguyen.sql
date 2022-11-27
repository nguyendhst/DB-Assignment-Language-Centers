/* MySQL */
/* StudentReport Checks */
/* time must be between the start and end date of the course */
/* create a function to check if the time is between the start and end date of the course */
DROP FUNCTION IF EXISTS checkTime;
CREATE FUNCTION checkTime (time date, class_id int) RETURNS boolean
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE start_date date;
    DECLARE end_date date;
    /* get course from class */
    SELECT start_date, end_date INTO start_date, end_date FROM `Course`
    INNER JOIN `Class` ON `Course`.`course_id` = `Class`.`course_id`
    WHERE `Class`.`class_id` = class_id;
    /* check if time is between start and end date */
    RETURN time BETWEEN start_date AND end_date;
END

/* create a trigger to check if the time is between the start and end date of the course */
DROP TRIGGER IF EXISTS checkTimeTrigger;
CREATE TRIGGER checkTimeTrigger BEFORE INSERT ON `StudentReport`
FOR EACH ROW
BEGIN
    IF NOT checkTime(NEW.time, NEW.class_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Time must be between the start and end date of the course';
    END IF;
END


SET FOREIGN_KEY_CHECKS=0;
/* insert sample data */

/* insert sample data for Center */
INSERT INTO `Center` (`name`, `address`, `phone`, `email`) VALUES
(1, 'Center 1', 'Address 1', '0123456789', 'test@mail.com');

/* insert sample data for Person */
INSERT INTO `Person` (`person_id`, `name`, `address`, `phone`, `email`) VALUES
(1, 'Person 1', 'Address 1', '0123456789', 'user@mail.com'),
(2, 'Person 2', 'Address 2', '0123456789', 'user2@mail.com'),
(3, 'Person 3', 'Address 3', '0123456789', 'user3@mial.com'),
(4, 'Person 4', 'Address 4', '0123456789', 'user4@gmail.com');



/* insert sample data for Employee */
INSERT INTO `Employee` (`employee_id`, `person_id`, `salary`, `mng_id`) VALUES
("E0000001", 1, 1000000, 2),
("E0000002", 2, 1000000, NULL),
("T0000001", 3, 1000000, 2),
("T0000002", 4, 1000000, 2);

/* insert sample data for Officer */
INSERT INTO `Officer` (`employee_id`, `center_id`) VALUES
("E0000001", 1),
("E0000002", 1);

/* insert sample data for OfficerRole */
INSERT INTO `OfficerRole` (`employee_id`, `role`) VALUES
("E0000001", "Staff"),
("E0000002", "Manager");

/* insert sample data for Teacher */
INSERT INTO `Teacher` (`employee_id`) VALUES
("T0000001"),
("T0000002");

/* insert sample data for TeacherDegrees */
INSERT INTO `TeacherDegrees` (`employee_id`, `degree`) VALUES
("T0000001", "Bachelor"),
("T0000002", "Master");

/* insert sample data for TeacherMajors */
INSERT INTO `TeacherMajors` (`employee_id`, `major`) VALUES
("T0000001", "Computer Science"),
("T0000002", "Computer Science");

/* insert sample data for TeacherCenter */
INSERT INTO `TeacherCenter` (`teacher_id`, `center_id`) VALUES
("T0000001", 1),
("T0000002", 1);

/* insert sample data for Course */
INSERT INTO `Course` (`course_id`, `name`, `description`, `start_date`, `end_date`, `price`, `center_id`) VALUES
(1, 'Course 1', 'Description 1', '2019-01-01', '2019-12-31', 1000000, 1),
(2, 'Course 2', 'Description 2', '2019-01-01', '2019-12-31', 1000000, 1);

/* insert sample data for Class */
INSERT INTO `Class` (`class_id`, `class_name`, `course_id`) VALUES
(1, 'Class 1', 1),
(2, 'Class 2', 2);

/* insert sample data for Schedule */
INSERT INTO `Schedule` (`schedule_id`, `weekday`, `start_time`, `period`, `room_id`, `class_id`) VALUES 
(1, 'Mon', '2019-01-01 09:00:00', 2, 1, 1),
(2, 'Tue', '2019-01-01 11:00:00', 2, 2, 2);

/* insert sample data for Room */
INSERT INTO `Room` (`room_id`, `name`, `center_id`) VALUES
(1, 'Room 1', 1),
(2, 'Room 2', 1);

/* insert sample data for Student */
INSERT INTO `Student` (`student_id`, `person_id`, `parent_id`, `center_id`) VALUES
("S0000001", 1, 2, 1),
("S0000002", 2, 3, 1);

/* insert sample data for StudentClass */
INSERT INTO `StudentClass` (`student_id`, `class_id`) VALUES
("S0000001", 1),
("S0000002", 2);

/* insert sample data for StudentReport */
INSERT INTO `StudentReport` (`student_id`, `class_id`, `schedule_id`, `time`, `status`) VALUES
("S0000001", 1, 1, '2019-01-01', 'present'),
("S0000001", 1, 2, '2019-01-01', 'absent'),
("S0000002", 2, 1, '2019-01-01', 'present'),
("S0000002", 2, 2, '2019-01-01', 'absent');

SET FOREIGN_KEY_CHECKS=1;