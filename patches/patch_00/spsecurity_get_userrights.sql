DROP PROCEDURE IF EXISTS `spsecurity_Get_userrights`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_Get_userrights`(
	IN UserId_p BIGINT
)
BEGIN
    
	SELECT
		*
	FROM 
		vwsecurity_get_userrights UR
	WHERE
		UR.UserId = UserId_p
	ORDER BY
		  UR.MenuOrder
		, UR.ItemOrder;
END$$
DELIMITER ;
