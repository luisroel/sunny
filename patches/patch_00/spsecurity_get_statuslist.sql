DROP PROCEDURE IF EXISTS `spsecurity_get_statuslist`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_get_statuslist`()
BEGIN
	SELECT * FROM tbsecurity_status;
END$$
DELIMITER ;
