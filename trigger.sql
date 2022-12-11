DELIMITER //
CREATE TRIGGER `a`.fee AFTER INSERT
ON `a`.`Involve`
FOR EACH ROW
	BEGIN
		IF NEW.discount_ID = 1 THEN
			UPDATE fee = NEW.total - 20000;
		ELSEIF NEW.discount_ID = 2 THEN
			UPDATE fee = NEW.total - 0.15*NEW.total;
		ELSEIF NEW.discount_ID = 3 THEN
			UPDATE fee = NEW.total - 0.1*NEW.total;
		ELSEIF NEW.discount_ID = 4 THEN
			UPDATE fee = NEW.total - 0.5*NEW.total;
		ELSE 
			SET @fee = @fee - @discount*NEW.total;
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
