DROP PROCEDURE IF EXISTS `spsecurity_apply_userrole`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_apply_userrole`(
      IN 	UserId_p	BIGINT
    , IN 	RoleId_p	BIGINT
	, IN 	Action_p	INTEGER				
	, IN 	ModUserId_p	BIGINT
	, OUT 	Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Msg_p = '';
	SET Date_v = NOW();

    
	IF EXISTS(SELECT * FROM tbsecurity_userrole WHERE UserId = UserId_p AND RoleId = RoleId_p) AND Action_p = 0 THEN
		DELETE FROM tbsecurity_userrole WHERE UserId = UserId_p AND RoleId = RoleId_p;

		UPDATE tbSecurity_User SET
			  ModUserId	= ModUserId_p
			, ModDate	= Date_v
		WHERE
			UserId = RoleId_p;
	END IF;

	IF NOT EXISTS(SELECT * FROM tbsecurity_userrole WHERE UserId = UserId_p AND RoleId = RoleId_p) AND Action_p = 1 THEN
		INSERT INTO tbsecurity_userrole (UserId, RoleId) VALUES( UserId_p, RoleId_p);

		UPDATE tbsecurity_user SET
			  ModUserId	= ModUserId_p
			, ModDate	= Date_v
		WHERE
			UserId = RoleId_p;
	END IF;
END$$
DELIMITER ;
