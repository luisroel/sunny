DELIMITER $$
CREATE PROCEDURE `spSecurity_Delete_Menu`(
      IN	MenuId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_Menu WHERE MenuId = MenuId_p) THEN
		SET	Msg_p = 'Menu does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_Module WHERE MenuId = MenuId_p) THEN
		SET	Msg_p = 'Menu cannot be deleted due to it is still been used!';
	ELSE
		 DELETE FROM tbSecurity_Menu WHERE MenuId = MenuId_p;
	END IF;
END$$
DELIMITER ;
