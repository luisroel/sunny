DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_RoleList`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT 
			  SR.RoleId
			, SR.Name
			, SR.Description
			, SR.IsActive
			, SR.EntryDate
			, SR.EntryUserId
			, U1.Username AS EntryUser
			, SR.ModDate
			, SR.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbSecurity_Role SR
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SR.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SR.ModUserId;
	ELSE
		SELECT 
			  SR.RoleId
			, SR.Name
			, SR.Description
			, SR.IsActive
			, SR.EntryDate
			, SR.EntryUserId
			, U1.Username AS EntryUser
			, SR.ModDate
			, SR.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbSecurity_Role SR
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SR.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SR.ModUserId
		WHERE 
			SR.IsActive = IsActive_p;
	END IF;
END$$
DELIMITER ;
