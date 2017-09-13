DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_ModuleList`(
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
			tbSecurity_Module SO
			INNER JOIN tbSecurity_Menu SM ON
				SM.MenuId = SO.MenuId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
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
			tbSecurity_Module SO
			INNER JOIN tbSecurity_Menu SM ON
				SM.MenuId = SO.MenuId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SO.ModUserId
		WHERE 
			SO.IsActive = IsActive_p;
	END IF;
END$$
DELIMITER ;
