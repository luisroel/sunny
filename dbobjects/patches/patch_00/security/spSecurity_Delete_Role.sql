DELIMITER $$
CREATE PROCEDURE `spSecurity_Delete_Role`(
      IN	RoleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_Role WHERE RoleId = RoleId_p) THEN
		SET Msg_p = 'Role does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_UserRole WHERE RoleId = RoleId_p)
			OR EXISTS(SELECT * FROM tbSecurity_RoleModule WHERE RoleId = RoleId_p) THEN
		SET Msg_p = 'Role cannot be deleted due to it is still been used!';
	ELSE
		 DELETE FROM tbSecurity_Role WHERE RoleId = RoleId_p;
	END IF;
END$$
DELIMITER ;
