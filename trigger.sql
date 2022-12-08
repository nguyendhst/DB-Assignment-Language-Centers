DELIMITER //
CREATE TRIGGER `a`.fee AFTER INSERT
ON `a`.`AppliedDiscount`
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
		END IF;
	END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `a`.salary AFTER INSERT
ON `a`.`Employee`
FOR EACH ROW
	BEGIN
		IF NEW.salary < 0 THEN
			UPDATE `ERROR: INVALID SALARY`
            SET NEW.salary = 0;
		END IF;
	END; //
DELIMITER ;