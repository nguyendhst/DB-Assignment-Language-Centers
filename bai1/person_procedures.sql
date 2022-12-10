/* procedures for person table */

/* insert person */
DROP PROCEDURE IF EXISTS `insert_person`;
DELIMITER $$
CREATE PROCEDURE `insert_person`(
    IN `fn` VARCHAR(50),
    IN `ln` VARCHAR(50),
    IN `gen` VARCHAR(10),
    IN `e_mail` VARCHAR(50),
    IN `addr` VARCHAR(100),
    IN `phne` VARCHAR(20),
    IN `dob` DATE
)
BEGIN
    /* check if fname is capitalized and max 50 chars */
    IF NOT (fn REGEXP '^[A-Z][a-z]{1,50}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'First name must be capitalized and at most 50 characters';
    END IF;

    /* check if lname is capitalized and max 50 chars */
    IF NOT (ln REGEXP '^[A-Z][a-z]{1,50}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Last name must be capitalized and at most 50 characters';
    END IF;

    /* check if gender is either 'male' or 'female' */
    IF NOT (gen = 'male' OR gen = 'female') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Gender must be male or female';
    END IF;

    /* check if email is valid */
    IF NOT (e_mail REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email is not valid';
    END IF;

    /* check if address is max 100 chars */
    IF NOT (addr REGEXP '^[a-zA-Z0-9\\s\\,]{1,100}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Address must be at most 100 characters';
    END IF;

    /* check if phone is max 12 chars */
    IF NOT (phne REGEXP '^[0-9]{1,12}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone must be at most 12 characters';
    END IF;

    /* check if dob is valid */
    IF NOT (dob REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of birth is not valid';
    END IF;

    /* insert person */
    INSERT INTO `Person` (`fname`, `lname`, `gender`, `email`, `address`, `phone`, `dob`) VALUES (fn, ln, gen, e_mail, addr, phne, dob);
END$$
DELIMITER ;


CALL insert_person('da','dawd','male','dawd@gmail.com', '12,feaf , ', '1234567890', '1990-12-12');


/* update person */
DROP PROCEDURE IF EXISTS `update_person`;
DELIMITER $$
CREATE PROCEDURE `update_person`(
    IN `update_id` INT,
    IN `fn` VARCHAR(50),
    IN `ln` VARCHAR(50),
    IN `gen` VARCHAR(10),
    IN `e_mail` VARCHAR(50),
    IN `addr` VARCHAR(100),
    IN `phne` VARCHAR(20),
    IN `dob` DATE
)
BEGIN
    /* check if fname is capitalized and max 50 chars */
    IF NOT (fn REGEXP '^[A-Z][a-z]{1,50}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'First name must be capitalized and at most 50 characters';
    END IF;

    /* check if lname is capitalized and max 50 chars */
    IF NOT (ln REGEXP '^[A-Z][a-z]{1,50}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Last name must be capitalized and at most 50 characters';
    END IF;

    /* check if gender is either 'male' or 'female' */
    IF NOT (gen = 'male' OR gen = 'female') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Gender must be male or female';
    END IF;

    /* check if email is valid */
    IF NOT (e_mail REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email is not valid';
    END IF;

    /* check if address is max 100 chars */
    IF NOT (addr REGEXP '^[a-zA-Z0-9\\s\\,]{1,100}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Address must be at most 100 characters';
    END IF;

    /* check if phone is max 12 chars */
    IF NOT (phne REGEXP '^[0-9]{1,12}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone must be at most 12 characters';
    END IF;

    /* check if dob is valid */
    IF NOT (dob REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of birth is not valid';
    END IF;

    /* update person */
    UPDATE `Person` SET `fname` = fn, `lname` = ln, `gender` = gen, `email` = e_mail, `address` = addr, `phone` = phne, `dob` = dob WHERE `id` = update_id;
END$$
DELIMITER ;


/* delete person */
DROP PROCEDURE IF EXISTS `delete_person`;
DELIMITER $$
CREATE PROCEDURE `delete_person`(
    IN `del_id` INT
)
BEGIN
    /* check if person exists */
    IF NOT EXISTS (SELECT * FROM `Person` WHERE `id` = del_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person does not exist';
    END IF;

    /* delete person */
    DELETE FROM `Person` WHERE `id` = del_id;

END$$
DELIMITER ;