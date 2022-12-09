
-- Thu tuc goi thong tin nhan vien o co so 1 & 2
DELIMITER $$
CREATE PROCEDURE csdl.emp_infor()
BEGIN
	SELECT p.lname, p.fname, p.address, ep.salary, o.center_id
	FROM person p
	JOIN employee ep ON p.person_id = ep.person_id
	JOIN officer o ON ep.employee_id = o.employee_id WHERE o.center_id IN (2,1)
    ORDER BY salary ASC;
END; $$
DELIMITER ;
CALL emp_infor();

-- ==============================================
-- Thu tuc goi thong tin hoc sinh da dong hoc phi
DELIMITER $$
CREATE PROCEDURE student_payment()
BEGIN
	SELECT p.lname, 
		   p.fname, 
		   re.course_fee, 
		   re.discount,
		   re.total,
		   re.paid, re.dept, 
		   pe.lname as Emp_Lname, 
		   pe.fname Emp_Fname
	FROM student st
	JOIN person p ON p.person_id = st.person_id
	JOIN receipt re ON st.student_id = re.student_id
	JOIN employee em ON re.employee_id = em.employee_id
	JOIN person pe ON em.person_id = pe.person_id
	ORDER BY dept DESC;
END; $$
DELIMITER ;
CALL student_payment();
