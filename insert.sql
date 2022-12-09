SET FOREIGN_KEY_CHECKS=0;
/* insert sample data */

INSERT INTO `Center` (`center_name`, `center_address`, `center_phone`) VALUES
('Trung tâm anh ngữ ABC cơ sở LTK', '268, Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh', '01200000'),
('Trung tâm anh ngữ ABC cơ sở NVC', '10, Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh', '01200001'),
('Trung tâm anh ngữ ABC cơ sở Dĩ An', '31, Phan Văn Trị, Dĩ An, Bình Dương', '01200002');

SELECT * FROM `Center`;

/* insert sample data for Person */
INSERT INTO `Person` (`fname`, `lname`, `gender`, `email`, `address`, `phone`, `birthdate`) VALUES
('A', 'Nguyễn Văn', 'male', 'nva@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000001', '1999-01-01'),
('B', 'Nguyễn Văn', 'male', 'nvb@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000002', '2002-01-01'),
('C', 'Lê Thị', 'female', 'nvc@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000003', '1998-01-01'),
('D', 'Nguyễn Văn', 'male', 'nvd@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000004', '2004-01-01'),
('E', 'Lê Thị', 'female', 'nve@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000005', '2005-01-01'),
('F', 'Nguyễn Văn', 'male', 'nvf@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000006', '2000-07-01'),
('G', 'Lê Thị', 'female', 'nvg@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000007', '1999-01-01'),
('H', 'Nguyễn Văn', 'male', 'nvh@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000008', '2005-01-01'),
('J', 'Nguyễn Văn', 'male', 'nvj@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000009', '2002-01-01'),
('K', 'Nguyễn Văn', 'male', 'nvk@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000010', '1997-01-01'),
('L', 'Nguyễn Văn', 'male', 'nvl@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000011', '2002-01-01'),
('M', 'Lê Thị', 'female', 'nvm@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000012', '1999-01-01'),
('N', 'Nguyễn Văn', 'male', 'nvn@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000013', '1995-01-01'),
('O', 'Nguyễn Văn', 'male', 'nvo@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000014', '1994-01-01'),
('P', 'Nguyễn Văn', 'male', 'nvo@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000015', '1994-01-01'),
('Q', 'Nguyễn Văn', 'male', 'nvo@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000016', '1994-01-01'),
('R', 'Nguyễn Văn', 'male', 'nvo@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000017', '1994-01-01'),
('S', 'Nguyễn Văn', 'male', 'nvo@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000018', '1994-01-01'),
('T', 'Nguyễn Văn', 'male', 'nvo@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000019', '1994-01-01'),
('V', 'Nguyễn Văn', 'male', 'nvo@mail.com', '123, Lý Thường Kiệt, Quận 10, Tp.HCM', '0900000020', '1994-01-01');


SELECT * FROM `Person`;


INSERT INTO `Employee` (`employee_id`, `person_id`, `salary`, `manager_id`) VALUES
("E10001", 1, 1000000, "E10002"),
("E10002", 5, 1000000, NULL),
("E10003", 12, 200000, "E10002"),
("E10004", 11, 140000, "E10002"),
("E20001", 2, 1000000, NULL),
("E20002", 3, 1000000, "E20001"),
("E20003", 4, 1000000, "E20001"),
("E20004", 6, 1000000, "E20001"),
("E30004", 7, 1000000, NULL),
("E30001", 8, 1000000, "E30004"),
("E30002", 9, 1000000, "E30004"),
("E30003", 10, 1000000, "E30004");


SELECT * FROM `Employee`;



INSERT INTO `Officer` (`employee_id`, `center_id`) VALUES
("E10001", 1),
("E20001", 2),
("E20002", 2),
("E30001", 3),
("E10002", 1),
("E30004", 3),
("E10004", 1),
("E20004", 2),
("E30002", 3);

SELECT * FROM `Officer`;


INSERT INTO `OfficerRole` (`employee_id`, `role`) VALUES
("E10001", "Finance"),
("E20001", "Manager"),
("E20004", "Receptionist"),
("E20002", "Finance"),
("E30001", "Finance"),
("E10002", "Manager"),
("E10004", "Receptionist"),
("E30002", "Receptionist"),
("E30004", "Manager");

SELECT * FROM `OfficerRole`;


/* insert sample data for Teacher */
INSERT INTO `Teacher` (`employee_id`) VALUES
("E10003"),
("E20003"),
("E30003");

SELECT * FROM `Teacher`;

/* insert sample data for TeacherDegrees */
INSERT INTO `TeacherDegrees` (`employee_id`, `degree`) VALUES
("E10003", "Bachelor of Science"),
("E20003", "Master of Language"),
("E30003", "Master of Science");


SELECT * FROM `TeacherDegrees`;



/* insert sample data for TeacherMajors */
INSERT INTO `TeacherMajors` (`employee_id`, `major`) VALUES
("E10003", "English"),
("E20003", "English"),
("E30003", "Chinese");


SELECT * FROM `TeacherMajors`;


INSERT INTO `TeacherCenter` (`teacher_id`, `center_id`) VALUES
("E10003", 1),
("E20003", 2),
("E30003", 3);

SELECT * FROM `TeacherCenter`;


INSERT INTO `Course` (`course_id`, `course_name`, `course_code`, `start_date`, `end_date`, `description`, `programme_id`, `fee`)
VALUES 
(
1,
'Khóa học anh văn căn bản',
'Basic_English',
'2022-12-01',
'2023-02-01',
'Học những kiến thức anh văn cơ bản; rèn luyện các kỹ năng: nghe, nói, đọc, viết',
1,
1000000
),
(
2,
'Khóa luyện thi TOEIC',
'TOEIC',
'2022-12-01',
'2023-04-01',
'Học những kiến thức cần thiết để thi TOEIC',
2,
2000000
),
(
3,
'Khóa học pre_IELTS',
'pre_IELTS',
'2023-01-01',
'2023-09-01',
'Học những kiến thức cơ bản cho khóa luyện thi IELTS',
3,
4000000
),
(
4,
'Khóa luyện thi IELTS',
'IELTS',
'2023-10-01',
'2024-10-01',
'Học những kiến thức cần thiết để thi IELTS',
4,
7000000
);


SELECT * FROM `Course`;


INSERT INTO `Class` (`class_id`, `class_name`, `course_id`) VALUES
(1, 'Basic Listening', 1),
(2, 'Basic Writing', 1),
(3, 'Basic Speaking', 1),
(4, 'Basic Reading', 1),
(5, 'TOEIC Listening', 2),
(6, 'TOEIC Writing', 2),
(7, 'TOEIC Speaking', 2),
(8, 'TOEIC Reading', 2),
(9, 'pre_IELTS Listening', 3),
(10, 'pre_IELTS Writing', 3),
(11, 'pre_IELTS Speaking', 3),
(12, 'pre_IELTS Reading', 3),
(13, 'IELTS Listening', 4),
(14, 'IELTS Writing', 4),
(15, 'IELTS Speaking', 4),
(16, 'IELTS Reading', 4);


SELECT * FROM `Class`;

INSERT INTO `Schedule` (`schedule_id`, `weekday`, `start_time`, `period`, `room_id`, `class_id`) VALUES 
(1, 'Monday', '08:00:00', 2, 1, 1),
(2, 'Monday', '10:00:00', 2, 12, 2),
(3, 'Monday', '12:00:00', 2, 11, 3),
(4, 'Monday', '14:00:00', 2, 9, 4),
(5, 'Tuesday', '08:00:00', 2, 4, 5),
(6, 'Tuesday', '10:00:00', 2, 8, 6),
(7, 'Tuesday', '12:00:00', 2, 3, 7),
(8, 'Tuesday', '14:00:00', 2, 2, 8),
(9, 'Wednesday', '08:00:00', 2, 1, 9),
(10, 'Wednesday', '10:00:00', 2, 4, 10),
(11, 'Wednesday', '12:00:00', 2, 2, 11),
(12, 'Wednesday', '14:00:00', 2, 7, 12),
(13, 'Thursday', '08:00:00', 2, 5, 13),
(14, 'Thursday', '10:00:00', 2, 2, 14),
(15, 'Thursday', '12:00:00', 2, 3, 15),
(16, 'Thursday', '14:00:00', 2, 4, 16),
(17, 'Tuesday', '10:00:00', 2, 2, 1),
(18, 'Tuesday', '12:00:00', 2, 3, 2),
(19, 'Tuesday', '14:00:00', 2, 4, 3),
(20, 'Wednesday', '08:00:00', 2, 5, 4),
(21, 'Wednesday', '10:00:00', 2, 6, 5),
(22, 'Wednesday', '12:00:00', 2, 7, 6),
(23, 'Wednesday', '14:00:00', 2, 8, 7),
(24, 'Thursday', '08:00:00', 2, 9, 8),
(25, 'Thursday', '10:00:00', 2, 10, 9),
(26, 'Thursday', '12:00:00', 2, 11, 10),
(27, 'Thursday', '14:00:00', 2, 12, 11),
(28, 'Friday', '08:00:00', 2, 1, 12),
(29, 'Friday', '10:00:00', 2, 2, 13),
(30, 'Friday', '12:00:00', 2, 3, 14),
(31, 'Friday', '14:00:00', 2, 4, 15),
(32, 'Saturday', '08:00:00', 2, 5, 16),
(33, 'Saturday', '10:00:00', 2, 6, 1),
(34, 'Saturday', '12:00:00', 2, 7, 2),
(35, 'Saturday', '14:00:00', 2, 8, 3),
(36, 'Sunday', '08:00:00', 2, 9, 4),
(37, 'Sunday', '10:00:00', 2, 10, 5),
(38, 'Sunday', '12:00:00', 2, 11, 6),
(39, 'Sunday', '14:00:00', 2, 12, 7);

SELECT * FROM `Schedule`;


INSERT INTO `Room` (`room_id`, `room_name`, `center_id`) VALUES
(1, 'Room 1', 1),
(2, 'Room 2', 1),
(3, 'Room 3', 1),
(4, 'Room 4', 1),
(5, 'Room 5', 1),
(6, 'Room 6', 1),
(7, 'Room 7', 1),
(8, 'Room 8', 1),
(9, 'Room 9', 1),
(10, 'Room 10', 2),
(11, 'Room 11', 2),
(12, 'Room 12', 2),
(13, 'Room 13', 2),
(14, 'Room 14', 2),
(15, 'Room 15', 2),
(16, 'Room 16', 2),
(17, 'Room 17', 2),
(18, 'Room 18', 2),
(19, 'Room 19', 2),
(20, 'Room 20', 3),
(21, 'Room 21', 3),
(22, 'Room 22', 4),
(23, 'Room 23', 4),
(24, 'Room 24', 4),
(25, 'Room 25', 4),
(26, 'Room 26', 4),
(27, 'Room 27', 4),
(28, 'Room 28', 4),
(29, 'Room 29', 4),
(30, 'Room 30', 4);

SELECT * FROM `Room`;


INSERT INTO `Parent`  (`person_id`) VALUES
(19);

SELECT * FROM `Parent`;

INSERT INTO `Student` (`student_id`, `person_id`, `course_id`, `center_id`) VALUES
("S10001", 13, 1, 1),
("S10002", 14, 2, 1),
("S10003", 15, 1, 1),
("S30001", 16, 2, 3),
("S10005", 17, 4, 1),
("S20001", 18, 3, 2);


SELECT * FROM `Student`;


INSERT INTO `Enroll` (`student_id`, `class_id`) VALUES
("S10001", 1),
("S10001", 2),
("S10001", 3),
("S10001", 4),
("S10002", 11),
("S10002", 12),
("S10002", 13),
("S10002", 14),
("S10002", 15),
("S10002", 16),
("S10003", 1),
("S10003", 2),
("S10003", 3),
("S10003", 4),
("S30001", 11),
("S30001", 12),
("S30001", 13),
("S30001", 14),
("S10005", 1),
("S10005", 2),
("S10005", 3),
("S10005", 4),
("S20001", 13),
("S20001", 14),
("S20001", 15),
("S20001", 16);

SELECT * FROM `Enroll`;

INSERT INTO `Discount` (`status`, `name`, `start_date`, `description`, `course_id`) VALUES 
('active', '10%', '2022-10-13', 'Giam 10% tren tong hoc phi', 3),
('active', '15%', '2022-08-13', 'Giam 15% tren tong hoc phi', 2),
('active', '20k', '2022-10-13', 'Giam 20k', 1),
('inactive', '50%', '2022-12-13', 'Giam 50% tren tong hoc phi', 4);

SELECT * FROM `Discount`;

INSERT INTO `Invoice` (`officer_id`, `student_id`, `total`, `in_debt`, `paid`, `course_id` ,`discount_id`) VALUES
("E10001", "S10001", 1000000, 0, 1000000, 1, 1),
("E10001", "S10002", 1000000, 0, 1000000, 2, 2),
("E10001", "S10005", 1000000, 0, 1000000, 1, 3),
("E20002", "S20001", 1000000, 0, 1000000, 2, 4),
("E30001", "S30002", 1000000, 0, 1000000, 4, 1),
("E10001", "S10003", 1000000, 0, 1000000, 3, 2);

SELECT * FROM `Invoice`;

INSERT INTO `TeacherClass` (`employee_id`, `class_id`) VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(2, 12),
(3, 13),
(2, 14),
(3, 15),
(2, 16);

SELECT * FROM `TeacherClass`;

INSERT INTO `StudentParent` (`student_id`, `parent_id`) VALUES 
("S10001", 19),
("S10002", 19);

SELECT * FROM `StudentParent`;

INSERT INTO `Programme` (`name`, `goal`, `sessions`, `references`) VALUES
('Basic English', 'This program aims to equip learners with basic knowledge of the English language', 10, 'Basic English 101, Cambridge'),
('TOEIC', 'This program helps learners deal with the TOEIC exams', 10, 'TOEIC 101, Cambridge'),
('PRE-IELTS', 'This program helps learners prepare for the IELTS courses', 10, 'IELTS 101, Cambridge'),
('IELTS', 'This program helps learners deal with the IELTS exams', 10, 'IELTS 101, Cambridge');

SELECT * FROM `Programme`;


INSERT INTO `CourseCenter` (`center_id`, `course_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

SELECT * FROM `CourseCenter`;


INSERT INTO `AppliedDiscount` (`discount_id`, `student_id`) VALUES 
(1, "S10001"),
(2, "S10002");

SELECT * FROM `AppliedDiscount`;


INSERT INTO `TeacherReport` (`employee_id`, `attendance`, `note`, `schedule_id`) VALUES 
("E10003", 'present', 'Good', 1),
("E20003", 'present', 'Good', 2),
("E10003", 'present', 'Good', 3),
("E30003", 'present', 'Good', 4),
("E10003", 'present', 'Good', 5),
("E30003", 'absent', 'Good', 6),
("E20003", 'present', 'Good', 7),
("E20003", 'present', 'Good', 8),
("E10003", 'present', 'Good', 9),
("E10003", 'present', 'Good', 10),
("E10003", 'present', 'Good', 11),
("E20003", 'absent', 'Good', 12),
("E10003", 'present', 'Good', 13),
("E30003", 'present', 'Good', 14),
("E20003", 'absent', 'Good', 15),
("E10003", 'present', 'Good', 16),
("E20003", 'present', 'Good', 17),
("E10003", 'absent', 'Good', 18),
("E30003", 'present', 'Good', 19),
("E10003", 'present', 'Good', 20),
("E10003", 'present', 'Good', 21),
("E30003", 'present', 'Good', 22),
("E10003", 'present', 'Good', 23),
("E10003", 'present', 'Good', 24),
("E30003", 'present', 'Good', 25),
("E10003", 'present', 'Good', 26),
("E20003", 'present', 'Good', 27),
("E30003", 'absent', 'Good', 28),
("E30003", 'present', 'Good', 29),
("E30003", 'present', 'Good', 30);

SELECT * FROM `TeacherReport`;


INSERT INTO `StudentReport` (`student_id`, `attendance`, `note`, `schedule_id`) VALUES 
("S10001", 'present', 'Good', 1),
("S10001", 'present', 'Bad', 17),
("S10002", 'present', 'Good', 2),
("S10003", 'present', 'Good', 3),
("S20001", 'present', 'Good', 4);

SELECT * FROM `StudentReport`;




SET FOREIGN_KEY_CHECKS=1;


