DROP PROCEDURE IF EXISTS `spsecurity_delete_user`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_delete_user`(
      IN	UserId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbsecurity_user WHERE UserId = UserId_p) THEN
		SET	Msg_p = 'User does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbsecurity_userrole WHERE UserId = UserId_p)
			OR EXISTS(SELECT * FROM tbsecurity_usermodule WHERE UserId = UserId_p)
			OR EXISTS(SELECT * FROM tbsecurity_module WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p))
			OR EXISTS(SELECT * FROM tbsecurity_role WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p))
			OR EXISTS(SELECT * FROM tbsecurity_menu WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p)) THEN
		SET	Msg_p = 'User cannot be deleted due to it is still being used!';
	ELSE
		DELETE FROM tbsecurity_user WHERE UserId = UserId_p;
	END IF;
END$$
DELIMITER ;
