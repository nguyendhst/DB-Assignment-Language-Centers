DROP PROCEDURE IF EXISTS emp_infor;
DELIMITER $$
CREATE PROCEDURE `emp_infor`()
BEGIN
	SELECT p.lname, p.fname, p.address, ep.salary, o.center_id
	FROM person p
	JOIN employee ep ON p.person_id = ep.person_id
	JOIN officer o ON ep.employee_id = o.employee_id WHERE o.center_id IN (2,1)
    ORDER BY salary ASC;
END$$
DELIMITER ;
CALL emp_infor;


DROP PROCEDURE IF EXISTS student_payment;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_payment`()
BEGIN
DROP VIEW IF EXISTS `payment`;
CREATE VIEW `payment` AS
	SELECT p.lname, 
		   p.fname, 
		   re.total,
		   re.paid, re.in_debt, 
		   pe.lname as Emp_Lname, 
		   pe.fname Emp_Fname
	FROM student st
	JOIN person p ON p.person_id = st.person_id
	JOIN invoice re ON st.student_id = re.student_id
	JOIN employee em ON re.officer_id = em.employee_id
	JOIN person pe ON em.person_id = pe.person_id
	ORDER BY re.in_debt DESC;
    
	SELECT 
		(SELECT COUNT(*) FROM payment) AS Num_of_student_have_paid,
        (SELECT COUNT(*) FROM student) AS Num_of_student
    From dual;
END$$
DELIMITER ;
CALL student_payment;