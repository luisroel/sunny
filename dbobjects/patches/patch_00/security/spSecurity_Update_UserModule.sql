DELIMITER $$
CREATE PROCEDURE `spSecurity_Update_UserModule`(
      IN UserId_p		BIGINT
	, IN ModuleId_p		BIGINT
	, IN IsCreated_p	BIT
	, IN IsUpdated_p	BIT
	, IN IsDeleted_p	BIT
	, IN ModUserId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_p DATETIME;

	SET Date_p = NOW();
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_UserModule SU WHERE SU.UserId = UserId_p AND SU.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module is not included in the role. Please verify!';
	ELSE 
		UPDATE tbSecurity_UserModule SET
			  IsCreated	= IsCreated_p
			, IsUpdated	= IsUpdated_p
			, IsDeleted	= IsDeleted_p
		 WHERE
			    UserId = UserId_p
			AND ModuleId = ModuleId_p;

		UPDATE tbSecurity_User SET
			  ModUserId		= ModUserId_p
			, ModDate		= Date_p
		WHERE
			UserId = UserId_p;
	END IF;
END$$
DELIMITER ;
