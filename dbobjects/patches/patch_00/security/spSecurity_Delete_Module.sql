DELIMITER $$
CREATE PROCEDURE `spSecurity_Delete_Module`(
      IN	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_Module WHERE ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_RoleModule WHERE ModuleId = ModuleId_p)
			OR EXISTS(SELECT * FROM tbSecurity_UserModule WHERE ModuleId = ModuleId_p) THEN
		SET	Msg_p = 'Module cannot be deleted it is still been used!';
	ELSE
		 DELETE FROM tbSecurity_Module WHERE ModuleId = ModuleId_p;
	END IF;
END$$
DELIMITER ;
