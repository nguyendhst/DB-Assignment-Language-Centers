set FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS`Person`;
CREATE TABLE `Person` (
  `person_id` int PRIMARY KEY AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `gender` ENUM ('male', 'female'),
  `email` varchar(255),
  `address` varchar(255),
  `phone` varchar(255),
  `birthdate` date,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `account_id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passw_hash` varchar(255) NOT NULL,
  `person_id` int NOT NULL UNIQUE,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student` (
  `person_id` int AUTO_INCREMENT,
  `student_id` varchar(255) UNIQUE,
  `center_id` int NOT NULL,
  `course_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`person_id`, `student_id`)
);

DROP TABLE IF EXISTS `Enroll`;
CREATE TABLE `Enroll` (
  `enroll_id` int AUTO_INCREMENT,
  `student_id` varchar(255) NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`enroll_id`, `student_id`, `class_id`)
);

DROP TABLE IF EXISTS `Parent`;
CREATE TABLE `Parent` (
  `parent_id` int PRIMARY KEY AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `StudentParent`;
CREATE TABLE `StudentParent` (
  `parent_id` int,
  `student_id` varchar(255),
  PRIMARY KEY (`parent_id`, `student_id`)
);

DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
  `class_id` int AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `course_id` int,
  `created_at` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`class_id`, `course_id`)
);

DROP TABLE IF EXISTS `Course`;
CREATE TABLE `Course` (
  `course_id` int PRIMARY KEY AUTO_INCREMENT,
  `course_name` varchar(255) UNIQUE NOT NULL,
  `course_code` varchar(255) UNIQUE NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` varchar(255),
  `programme_id` int NOT NULL,
  `fee` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `Programme`;
CREATE TABLE `Programme` (
  `programme_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `goal` varchar(255) NOT NULL,
  `sessions` int NOT NULL,
  `references` varchar(255)
);

DROP TABLE IF EXISTS `Room`;
CREATE TABLE `Room` (
  `room_id` int PRIMARY KEY AUTO_INCREMENT,
  `room_name` varchar(255) NOT NULL,
  `center_id` int NOT NULL
);

DROP TABLE IF EXISTS `Schedule`;
CREATE TABLE `Schedule` (
  `schedule_id` int PRIMARY KEY AUTO_INCREMENT,
  `weekday` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `period` integer NOT NULL,
  `room_id` int NOT NULL,
  `class_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now())
);


DROP TABLE IF EXISTS `Discount`;
CREATE TABLE `Discount` (
  `discount_id` int PRIMARY KEY AUTO_INCREMENT,
  `status` ENUM ('active', 'inactive') NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `description` varchar(255),
  `course_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `AppliedDiscount`;
CREATE TABLE `AppliedDiscount` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `discount_id` int,
  `student_id` varchar(255)
);

DROP TABLE IF EXISTS `Center`;
CREATE TABLE `Center` (
  `center_id` int PRIMARY KEY AUTO_INCREMENT,
  `center_name` varchar(255) NOT NULL,
  `center_address` varchar(255) NOT NULL,
  `center_phone` varchar(255)
);

DROP TABLE IF EXISTS `CourseCenter`;
CREATE TABLE `CourseCenter` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `center_id` int,
  `course_id` int
);

DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `person_id` int AUTO_INCREMENT,
  `employee_id` varchar(8),
  `salary` integer,
  `manager_id` int,
  `created_at` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`person_id`, `employee_id`)
);

DROP TABLE IF EXISTS `Officer`;
CREATE TABLE `Officer` (
  `employee_id` varchar(255) PRIMARY KEY,
  `center_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `OfficerRole`;
CREATE TABLE `OfficerRole` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `employee_id` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `Invoice`;
CREATE TABLE `Invoice` (
  `invoice_id` int PRIMARY KEY,
  `officer_id` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `in_debt` int NOT NULL,
  `paid` int NOT NULL,
  `course_id` int NOT NULL,
  `discount_id` int NOT NULL,
  `create_date` datetime DEFAULT (now())
);

DROP TABLE IF EXISTS `Teacher`;
CREATE TABLE `Teacher` (
  `employee_id` varchar(255) PRIMARY KEY,
  `ta` boolean,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `TeacherDegrees`;
CREATE TABLE `TeacherDegrees` (
  `degree_id` int PRIMARY KEY AUTO_INCREMENT,
  `employee_id` varchar(255),
  `degree` varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `TeacherMajors`;
CREATE TABLE `TeacherMajors` (
  `major_id` int PRIMARY KEY AUTO_INCREMENT,
  `employee_id` varchar(255),
  `major` varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `TeacherClass`;
CREATE TABLE `TeacherClass` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `employee_id` varchar(255),
  `class_id` int
);

DROP TABLE IF EXISTS `TeacherCenter`;
CREATE TABLE `TeacherCenter` (
  `teacher_id` varchar(255),
  `center_id` int,
  PRIMARY KEY (`teacher_id`, `center_id`)
);

DROP TABLE IF EXISTS `TeacherReport`;
CREATE TABLE `TeacherReport` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `employee_id` varchar(255) NOT NULL,
  `attendance` ENUM ('absent', 'present') NOT NULL,
  `note` varchar(255),
  `time` date NOT NULL DEFAULT (now()),
  `class_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

DROP TABLE IF EXISTS `StudentReport`;
CREATE TABLE `StudentReport` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `student_id` varchar(255) NOT NULL,
  `attendance` ENUM ('absent', 'present') NOT NULL,
  `note` varchar(255),
  `time` date NOT NULL DEFAULT (now()),
  `class_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now())
);

set FOREIGN_KEY_CHECKS = 1;

ALTER TABLE `Person` ADD FOREIGN KEY (`person_id`) REFERENCES `Account` (`person_id`);

ALTER TABLE `Person` ADD FOREIGN KEY (`person_id`) REFERENCES `Student` (`person_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`center_id`) REFERENCES `Center` (`center_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Enroll` ADD FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`);

ALTER TABLE `Enroll` ADD FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`);

ALTER TABLE `Person` ADD FOREIGN KEY (`person_id`) REFERENCES `Parent` (`parent_id`);

ALTER TABLE `StudentParent` ADD FOREIGN KEY (`parent_id`) REFERENCES `Parent` (`parent_id`);

ALTER TABLE `StudentParent` ADD FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`);

ALTER TABLE `Class` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Course` ADD FOREIGN KEY (`programme_id`) REFERENCES `Programme` (`programme_id`);

ALTER TABLE `Room` ADD FOREIGN KEY (`center_id`) REFERENCES `Center` (`center_id`);

ALTER TABLE `Schedule` ADD FOREIGN KEY (`room_id`) REFERENCES `Room` (`room_id`);

ALTER TABLE `Schedule` ADD FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`);

ALTER TABLE `Discount` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `AppliedDiscount` ADD FOREIGN KEY (`discount_id`) REFERENCES `Discount` (`discount_id`);

ALTER TABLE `AppliedDiscount` ADD FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`);

ALTER TABLE `CourseCenter` ADD FOREIGN KEY (`center_id`) REFERENCES `Center` (`center_id`);

ALTER TABLE `CourseCenter` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Person` ADD FOREIGN KEY (`person_id`) REFERENCES `Employee` (`person_id`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`employee_id`) REFERENCES `Officer` (`employee_id`);

ALTER TABLE `Officer` ADD FOREIGN KEY (`center_id`) REFERENCES `Center` (`center_id`);

ALTER TABLE `OfficerRole` ADD FOREIGN KEY (`employee_id`) REFERENCES `Officer` (`employee_id`);

ALTER TABLE `Invoice` ADD FOREIGN KEY (`officer_id`) REFERENCES `Officer` (`employee_id`);

ALTER TABLE `Invoice` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Invoice` ADD FOREIGN KEY (`discount_id`) REFERENCES `Discount` (`discount_id`);

ALTER TABLE `TeacherDegrees` ADD FOREIGN KEY (`employee_id`) REFERENCES `Teacher` (`employee_id`);

ALTER TABLE `TeacherMajors` ADD FOREIGN KEY (`employee_id`) REFERENCES `Teacher` (`employee_id`);

ALTER TABLE `TeacherClass` ADD FOREIGN KEY (`employee_id`) REFERENCES `Teacher` (`employee_id`);

ALTER TABLE `TeacherClass` ADD FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`);

ALTER TABLE `TeacherCenter` ADD FOREIGN KEY (`teacher_id`) REFERENCES `Teacher` (`employee_id`);

ALTER TABLE `TeacherCenter` ADD FOREIGN KEY (`center_id`) REFERENCES `Center` (`center_id`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`employee_id`) REFERENCES `Teacher` (`employee_id`);

ALTER TABLE `TeacherReport` ADD FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`);

ALTER TABLE `TeacherReport` ADD FOREIGN KEY (`schedule_id`) REFERENCES `Schedule` (`schedule_id`);

ALTER TABLE `StudentReport` ADD FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`);

ALTER TABLE `StudentReport` ADD FOREIGN KEY (`schedule_id`) REFERENCES `Schedule` (`schedule_id`);


SET FOREIGN_KEY_CHECKS=0;
/* insert sample data */

/* insert sample data for Center */
INSERT INTO `Center` (`center_name`, `center_address`, `center_phone`) VALUES
('Center 1', 'Address 1', '0123456789');

/* insert sample data for Person */
INSERT INTO `Person` (`person_id`, `fname`, `lname`, `gender`, `email`, `address`, `phone`, `birthdate`) VALUES
(1, 'John', 'Doe', 'male', 'test1@gmail.com', 'adwddad', '2237211', '1990-01-01'),
(2, 'Jan', 'Doe', 'female', 'test2@gmail.com', 'adawddad', '2238211', '1990-01-01'),
(3, 'Fe', 'De', 'female', 'test3@gmail.com', 'adwdaddd', '22324411', '1990-01-01'),
(4, 'Jaaan', 'Daaoe', 'female', 'test3@gmail.com', 'advbwdad', '2293211', '1990-01-01');


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