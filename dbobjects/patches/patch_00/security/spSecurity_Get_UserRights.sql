DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_UserRights`(
	IN UserId_p BIGINT
)
BEGIN
    
	SELECT
		*
	FROM 
		vwSecurity_Get_UserRights UR
	WHERE
		UR.UserId = UserId_p
	ORDER BY
		  UR.MenuOrder
		, UR.ItemOrder;
END$$
DELIMITER ;
