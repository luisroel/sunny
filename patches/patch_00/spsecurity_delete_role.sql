DROP PROCEDURE IF EXISTS `spsecurity_delete_role`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_delete_role`(
      IN	RoleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbsecurity_role WHERE RoleId = RoleId_p) THEN
		SET Msg_p = 'Role does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbsecurity_userrole WHERE RoleId = RoleId_p)
			OR EXISTS(SELECT * FROM tbsecurity_rolemodule WHERE RoleId = RoleId_p) THEN
		SET Msg_p = 'Role cannot be deleted due to it is still been used!';
	ELSE
		 DELETE FROM tbsecurity_role WHERE RoleId = RoleId_p;
	END IF;
END$$
DELIMITER ;
