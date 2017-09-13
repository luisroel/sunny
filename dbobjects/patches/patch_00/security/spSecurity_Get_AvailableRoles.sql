DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_AvailableRoles`(
	UserId_p BIGINT
)
BEGIN
    
	SELECT
		  RL.RoleId
		, RL.Name
	FROM 
		tbSecurity_Role RL
	WHERE
		NOT RL.RoleId IN (
			SELECT UM.RoleId FROM tbSecurity_UserRole UM WHERE UM.UserId = UserId_p
		);
END$$
DELIMITER ;
