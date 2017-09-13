DELIMITER $$
CREATE PROCEDURE `spSecurity_Insert_Module`(
	  IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN MenuId_p		BIGINT
	, IN Order_p		INT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Module SO WHERE SO.Name = Name_p AND SO.MenuId = MenuId_p) THEN
		SET Msg_p = 'Module already exist. Please verify object name!';
	ELSE
		INSERT tbSecurity_Module ( 
			  `Name`
			, `Description`
			, `MenuId`
			, `Order`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Name_p 
			, Description_p
			, MenuId_p
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
