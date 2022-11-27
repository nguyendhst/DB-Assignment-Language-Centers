CREATE TABLE receipt (
	id int PRIMARY KEY AUTO_INCREMENT,
    ostaff_id int NOT NULL,
    student_id int NOT NULL,
    `date` date NOT NULL,
    course_fee float NOT NULL,
    discount float NOT NULL,
    total float NOT NULL,
    paid float NOT NULL,
    dept float NOT NULL
);

-- receipt
INSERT INTO receipt( ostaff_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE (3, 4, '2022-11-02', 600000, 10, 540000, 300000, 240000);
INSERT INTO receipt( ostaff_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE (3, 5, '2022-11-01', 500000, 10, 450000, 450000, 0);
INSERT INTO receipt( ostaff_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE (2, 6, '2022-11-01', 500000, 10, 450000, 300000, 150000);
INSERT INTO receipt( ostaff_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE (1, 8, '2022-11-01', 500000, 10, 450000, 300000, 150000);
INSERT INTO receipt( ostaff_id, student_id, `date`, course_fee, discount, total, paid, dept)
VALUE (4, 7, '2022-11-01', 500000, 10, 450000, 300000, 150000);

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


