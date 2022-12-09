DELIMITER //
CREATE TRIGGER `a`.fee AFTER INSERT
ON `a`.`Discount`
FOR EACH ROW
	BEGIN
		IF NEW.discount_ID = 1 THEN
			SET @fee = @fee - 20000;
		ELSEIF NEW.discount_ID = 2 THEN
			SET @fee = @fee - 0.15*@fee;
		ELSEIF NEW.discount_ID = 3 THEN
			SET @fee = @fee - 0.1*@fee;
		ELSEIF NEW.discount_ID = 4 THEN
			SET @fee = @fee - 0.5*@fee;
		ELSE 
			SET @fee = @fee - @discount* @fee;
		END IF;
	END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `a`.OfficerRole AFTER INSERT
ON `a`.`OfficerRole`
FOR EACH ROW
	BEGIN
		IF NEW.role <> 'Finance' AND NEW.role <> 'Manager' AND NEW.role <> 'Receptionist' THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: INVALID ROLE';
		END IF;
	END; //
DELIMITER ;