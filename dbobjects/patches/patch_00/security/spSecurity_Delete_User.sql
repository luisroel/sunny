DELIMITER $$
CREATE PROCEDURE `spSecurity_Delete_User`(
      IN	UserId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_User WHERE UserId = UserId_p) THEN
		SET	Msg_p = 'User does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_UserRole WHERE UserId = UserId_p)
			OR EXISTS(SELECT * FROM tbSecurity_UserModule WHERE UserId = UserId_p)
			OR EXISTS(SELECT * FROM tbSecurity_Module WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p))
			OR EXISTS(SELECT * FROM tbSecurity_Role WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p))
			OR EXISTS(SELECT * FROM tbSecurity_Menu WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p)) THEN
		SET	Msg_p = 'User cannot be deleted due to it is still being used!';
	ELSE
		DELETE FROM tbSecurity_User WHERE UserId = UserId_p;
	END IF;
END$$
DELIMITER ;
