DELIMITER $$
CREATE  PROCEDURE `spSecurity_Update_User`(
      IN UserId_p	BIGINT
	, IN Username_p	VARCHAR(35)
	, IN Password_p	VARCHAR(35)
	, IN IsActive_p	BIT
	, IN UserId2_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbSecurity_User SU WHERE SU.UserId = UserId_p) THEN
		SET Msg_p = 'User does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_User SU WHERE SU.UserName = Username_p AND SU.UserId <> UserId_p) THEN
		SET Msg_p = 'User name already exists. Please verify!';
	ELSE
		UPDATE tbSecurity_User SET
			  `Password`	= Password_p
			, `UserName`	= Username_p
			, `IsActive`	= IsActive_p
			, `ModUserId`	= UserId2_p
			, `ModDate`		= Date_v
		 WHERE
			`UserId` = UserId_p;
	END IF;
END$$
DELIMITER ;
