DROP PROCEDURE IF EXISTS `spsecurity_delete_module`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_delete_module`(
      IN	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbsecurity_module WHERE ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbsecurity_rolemodule WHERE ModuleId = ModuleId_p)
			OR EXISTS(SELECT * FROM tbsecurity_usermodule WHERE ModuleId = ModuleId_p) THEN
		SET	Msg_p = 'Module cannot be deleted it is still been used!';
	ELSE
		 DELETE FROM tbsecurity_module WHERE ModuleId = ModuleId_p;
	END IF;
END$$
DELIMITER ;
