DELIMITER $$
CREATE PROCEDURE `spSecurity_Delete_UserModule`(
      IN	UserId_p	BIGINT
    , IN 	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_UserModule WHERE UserId = UserId_p AND ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Object is not included in the role. Please verify!';
	ELSE
		 DELETE FROM tbSecurity_UserModule WHERE UserId = UserId_p AND ModuleId = ModuleId_p;
	END IF;
END$$
DELIMITER ;
