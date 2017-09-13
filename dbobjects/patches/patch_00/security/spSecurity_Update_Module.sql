DELIMITER $$
CREATE  PROCEDURE `spSecurity_Update_Module`(
      IN ModuleId_p		BIGINT
	, IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN MenuId_p		BIGINT
	, IN Order_p		INT
	, IN IsActive_p		BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Module SO WHERE SO.Name = Name_p AND SO.ModuleId <> ModuleId_p AND SO.MenuId = MenuId_p) THEN
		SET Msg_p = 'Module name already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbSecurity_Module SO WHERE SO.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module does not exist. Please verify!';
	ELSE
		UPDATE tbSecurity_Module SET
			  `Name`		= Name_p
			, `Description`	= Description_p
			, `MenuId`		= MenuId_p
			, `Order`		= Order_p
			, `IsActive`	= IsActive_p
			, `ModUserId`	= UserId_p
			, `ModDate`		= Date_v
		 WHERE
			ModuleId = ModuleId_p;
	END IF;
END$$
DELIMITER ;
