DROP TABLE IF EXISTS receipt;
CREATE TABLE receipt (
	id int PRIMARY KEY AUTO_INCREMENT,
    `employee_id` varchar(255) NOT NULL,
    student_id varchar(10) NOT NULL,
    `date` date NOT NULL,
    course_fee float NOT NULL,
    discount float NOT NULL,
    total float NOT NULL,
    paid float NOT NULL,
    dept float NOT NULL
);

-- receipt
INSERT INTO receipt( employee_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE ("E10001", "S10001", '2022-11-02', 1000000, 10, 900000, 700000, 200000);
INSERT INTO receipt( employee_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE ("E10001", "S10002", '2022-11-01', 2000000, 10, 1800000, 1800000, 0);
INSERT INTO receipt( employee_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE ("E10002", "S10003", '2022-11-01', 1000000, 10, 900000, 500000, 400000);

-- discount
INSERT INTO discount(`status`, name, start_date, description, course_id)
VALUE ('active', '10%', '2022-10-13', 'Giam 10% tren tong hoc phi', 3);
INSERT INTO discount(`status`, name, start_date, description, course_id)
VALUE ('active', '15%', '2022-08-13', 'Giam 15% tren tong hoc phi', 2);
INSERT INTO discount(`status`, name, start_date, description, course_id)
VALUE ('active', '20k', '2022-10-13', 'Giam 20k', 1);
INSERT INTO discount(`status`, name, start_date, description, course_id)
VALUE ('inactive', '50%', '2022-12-13', 'Giam 50% tren tong hoc phi', 4);


select* from receipt;


