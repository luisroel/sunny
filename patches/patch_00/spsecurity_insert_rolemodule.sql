DROP PROCEDURE IF EXISTS `spsecurity_insert_rolemodule`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_insert_rolemodule`(
      IN RoleId_p		BIGINT
	, IN ModuleId_p		BIGINT
	, IN IsCreated_p	BIT
	, IN IsUpdated_p	BIT
	, IN IsDeleted_p	BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255) 
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbsecurity_rolemodule SD WHERE SD.RoleId = RoleId_p AND SD.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module already includes in the role. Please verify!';
	ELSE
		INSERT tbsecurity_rolemodule (
			  `RoleId`
			, `ModuleId`
			, `IsCreated`
			, `IsUpdated`
			, `IsDeleted`
		 ) VALUES (
			  RoleId_p
			, ModuleId_p
			, IsCreated_p
			, IsUpdated_p
			, IsDeleted_p
		);

		UPDATE tbsecurity_role SET
			  ModUserId	= UserId_p
			, ModDate	= Date_v
		WHERE
			RoleId = RoleId_p;
	END IF;
END$$
DELIMITER ;
