DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_AssignedRoles`(
	UserId_p BIGINT
)
BEGIN
    
	SELECT
		  RL.RoleId
		, RL.Name
	FROM 
		tbSecurity_Role RL
		INNER JOIN tbSecurity_UserRole UM ON
			UM.RoleId = RL.RoleId
	WHERE
		UM.UserId = UserId_p;
END$$
DELIMITER ;
