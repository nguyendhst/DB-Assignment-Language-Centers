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
  `student_id` varchar(255),
  `center_id` int NOT NULL,
  `course_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`person_id`, `student_id`),
  /* index student_id */
    INDEX (`student_id`)
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
  `discount_id` int,
  `student_id` varchar(255),
  PRIMARY KEY (`discount_id`, `student_id`)
);

DROP TABLE IF EXISTS `Center`;
CREATE TABLE `Center` (
  `center_id` int PRIMARY KEY AUTO_INCREMENT,
  `center_name` varchar(255) NOT NULL,
  `center_address` varchar(255) NOT NULL,
  `center_sdt` varchar(255)
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

