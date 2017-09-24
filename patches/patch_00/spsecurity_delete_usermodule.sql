DROP PROCEDURE IF EXISTS `spsecurity_delete_usermodule`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_delete_usermodule`(
      IN	UserId_p	BIGINT
    , IN 	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbsecurity_usermodule WHERE UserId = UserId_p AND ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Object is not included in the role. Please verify!';
	ELSE
		 DELETE FROM tbsecurity_usermodule WHERE UserId = UserId_p AND ModuleId = ModuleId_p;
	END IF;
END$$
DELIMITER ;
