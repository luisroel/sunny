DROP PROCEDURE IF EXISTS `spsecurity_get_assignedroles`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_get_assignedroles`(
	UserId_p BIGINT
)
BEGIN
    
	SELECT
		  RL.RoleId
		, RL.Name
	FROM 
		tbsecurity_role RL
		INNER JOIN tbsecurity_userrole UM ON
			UM.RoleId = RL.RoleId
	WHERE
		UM.UserId = UserId_p;
END$$
DELIMITER ;
