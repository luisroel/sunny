DROP PROCEDURE IF EXISTS `spSecurity_Get_MenuList`;
DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_MenuList`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT 
			  SO.MenuId
			, SO.Name
			, SO.Description
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbsecurity_menu SO
			INNER JOIN tbsecurity_user U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbsecurity_user U2 ON
				U2.UserId = SO.ModUserId;
	ELSE
		SELECT 
			  SO.MenuId
			, SO.Name
			, SO.Description
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbsecurity_menu SO
			INNER JOIN tbsecurity_user U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbsecurity_user U2 ON
				U2.UserId = SO.ModUserId
		WHERE 
			SO.IsActive = IsActive_p;
	END IF;
END$$
DELIMITER ;
