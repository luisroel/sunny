DROP PROCEDURE IF EXISTS `spsecurity_get_modulelist`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_get_modulelist`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT
			  SO.ModuleId
			, SO.Name
			, SO.Description
			, SM.MenuId
			, SM.Name		AS MenuName
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username	AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username	AS ModUser
		FROM 
			tbsecurity_module SO
			INNER JOIN tbsecurity_menu SM ON
				SM.MenuId = SO.MenuId
			INNER JOIN tbsecurity_user U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbsecurity_user U2 ON
				U2.UserId = SO.ModUserId;
	ELSE
		SELECT 
			  SO.ModuleId
			, SO.Name
			, SO.Description
			, SM.MenuId
			, SM.Name		AS MenuName
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username 	AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username 	AS ModUser
		FROM 
			tbsecurity_module SO
			INNER JOIN tbsecurity_menu SM ON
				SM.MenuId = SO.MenuId
			INNER JOIN tbsecurity_user U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbsecurity_user U2 ON
				U2.UserId = SO.ModUserId
		WHERE 
			SO.IsActive = IsActive_p;
	END IF;
END$$
DELIMITER ;
