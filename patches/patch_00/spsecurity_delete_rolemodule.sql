DROP PROCEDURE IF EXISTS `spsecurity_delete_rolemodule`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_delete_rolemodule`(
      IN	RoleId_p		BIGINT
    , IN 	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbsecurity_rolemodule WHERE RoleId = RoleId_p AND ModuleId = ModuleId_p) THEN
		SET	Msg_p = 'Object is not included in the role. Please verify!';
	ELSE
		 DELETE FROM tbsecurity_rolemodule WHERE RoleId = RoleId_p AND ModuleId = ModuleId_p;
	END IF;
END$$
DELIMITER ;
