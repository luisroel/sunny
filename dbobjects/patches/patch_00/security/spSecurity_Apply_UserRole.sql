DELIMITER $$
CREATE PROCEDURE `spSecurity_Apply_UserRole`(
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

    
	IF EXISTS(SELECT * FROM tbSecurity_UserRole WHERE UserId = UserId_p AND RoleId = RoleId_p) AND Action_p = 0 THEN
		DELETE FROM tbSecurity_UserRole WHERE UserId = UserId_p AND RoleId = RoleId_p;

		UPDATE tbSecurity_User SET
			  ModUserId	= ModUserId_p
			, ModDate	= Date_v
		WHERE
			UserId = RoleId_p;
	END IF;

	IF NOT EXISTS(SELECT * FROM tbSecurity_UserRole WHERE UserId = UserId_p AND RoleId = RoleId_p) AND Action_p = 1 THEN
		INSERT INTO tbSecurity_UserRole (UserId, RoleId) VALUES( UserId_p, RoleId_p);

		UPDATE tbSecurity_User SET
			  ModUserId	= ModUserId_p
			, ModDate	= Date_v
		WHERE
			UserId = RoleId_p;
	END IF;
END$$
DELIMITER ;
