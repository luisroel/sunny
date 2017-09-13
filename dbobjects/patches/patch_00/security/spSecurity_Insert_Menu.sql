DELIMITER $$
CREATE PROCEDURE `spSecurity_Insert_Menu`(
	  IN	Name_p			VARCHAR(60)
	, IN	Description_p	VARCHAR(255)
	, IN	Order_p			INT
	, IN	UserId_p		BIGINT
	, OUT	Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Menu SO WHERE SO.Name = Name_p) THEN
		SET Msg_p = 'Menu already exist. Please verify object name!';
	ELSE
		INSERT tbSecurity_Menu ( 
			  `Name`
			, `Description`
			, `Order`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Name_p 
			, Description_p
			, Order_p
			, 1
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END$$
DELIMITER ;
