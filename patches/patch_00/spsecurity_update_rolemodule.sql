DROP  PROCEDURE IF EXISTS `spsecurity_update_rolemodule`;
DELIMITER $$
CREATE  PROCEDURE `spsecurity_update_rolemodule`(
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

    
	IF NOT EXISTS(SELECT * FROM tbsecurity_rolemodule SD WHERE SD.RoleId = RoleId_p AND SD.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module is not included in the role. Please verify!';
	ELSE 
		UPDATE tbsecurity_rolemodule SET
			  IsCreated	= IsCreated_p
			, IsUpdated	= IsUpdated_p
			, IsDeleted	= IsDeleted_p
		 WHERE
			    RoleId = RoleId_p
			AND ModuleId = ModuleId_p;

		UPDATE tbsecurity_role SET
			  ModUserId		= UserId_p
			, ModDate		= Date_v
		WHERE
			RoleId = RoleId_p;
	END IF;
END$$
DELIMITER ;
