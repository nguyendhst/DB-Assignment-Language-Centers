DELIMITER //
CREATE TRIGGER `a`.fee AFTER INSERT
ON `a`.`Involve`
FOR EACH ROW
	BEGIN
		IF NEW.discount_ID = 1 THEN
			UPDATE NEW.total = NEW.total_discounted - 20000;
		ELSEIF NEW.discount_ID = 2 THEN
			UPDATE NEW.total = NEW.total_discounted - 0.15*NEW.total_discounted;
		ELSEIF NEW.discount_ID = 3 THEN
			UPDATE NEW.total = NEW.total_discounted - 0.1*NEW.total_discounted;
		ELSEIF NEW.discount_ID = 4 THEN
			UPDATE NEW.total = NEW.total_discounted - 0.5*NEW.total_discounted;
		ELSE 
			SET NEW.total = NEW.total_discounted - @discount*NEW.total_discounted;
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
