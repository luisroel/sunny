DELIMITER $$
CREATE  PROCEDURE `spSecurity_Insert_UserModule`(
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

	IF EXISTS(SELECT * FROM tbSecurity_UserModule SU WHERE SU.UserId = UserId_p AND SU.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module is already included in the role. Please verify!';
	ELSE
		INSERT INTO tbSecurity_UserModule ( UserId, ModuleId, IsCreated, IsUpdated, IsDeleted ) 
        VALUES ( UserId_p, ModuleId_p, IsCreated_p, IsUpdated_p, IsDeleted_p );

		UPDATE tbSecurity_User SET
			  ModUserId		= ModUserId_p
			, ModDate		= Date_p
		WHERE
			UserId = UserId_p;
	END IF;
END$$
DELIMITER ;
