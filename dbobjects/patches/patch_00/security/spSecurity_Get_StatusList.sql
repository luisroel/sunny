DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_StatusList`()
BEGIN
	SELECT * FROM tbSecurity_Status;
END$$
DELIMITER ;
