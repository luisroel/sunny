DROP PROCEDURE IF EXISTS `spsecurity_get_availableroles`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_get_availableroles`(
	UserId_p BIGINT
)
BEGIN
    
	SELECT
		  RL.RoleId
		, RL.Name
	FROM 
		tbsecurity_role RL
	WHERE
		NOT RL.RoleId IN (
			SELECT UM.RoleId FROM tbsecurity_userrole UM WHERE UM.UserId = UserId_p
		);
END$$
DELIMITER ;
