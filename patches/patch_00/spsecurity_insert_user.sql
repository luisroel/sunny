DROP  PROCEDURE IF EXISTS `spsecurity_insert_user`;
DELIMITER $$
CREATE  PROCEDURE `spsecurity_insert_user`(
	  IN Username_p	VARCHAR(35)
	, IN Password_p	VARCHAR(35)
	, IN UserId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_p DATETIME;

	SET Date_p 	= NOW();
	SET Msg_p	= '';

    
	IF EXISTS(SELECT * FROM tbsecurity_user SU WHERE SU.UserName = Username_p) THEN
		SET Msg_p = 'User name already exist. Please verify User name!';
	ELSE
		INSERT tbsecurity_user (
			  `UserName`
			, `Password`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Username_p
			, Password_p
			, 1
			, UserId_p
			, Date_p
			, UserId_p
			, Date_p
		);
	END IF;
END$$
DELIMITER ;
