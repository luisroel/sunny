DROP PROCEDURE IF EXISTS `spsecurity_delete_menu`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_delete_menu`(
      IN	MenuId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbsecurity_menu WHERE MenuId = MenuId_p) THEN
		SET	Msg_p = 'Menu does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbsecurity_module WHERE MenuId = MenuId_p) THEN
		SET	Msg_p = 'Menu cannot be deleted due to it is still been used!';
	ELSE
		 DELETE FROM tbsecurity_menu WHERE MenuId = MenuId_p;
	END IF;
END$$
DELIMITER ;
