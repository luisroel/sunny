DELIMITER $$
CREATE  PROCEDURE `spSecurity_Update_Role`(
      IN RoleId_p		BIGINT
	, IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN IsActive_p		BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Role SR WHERE SR.Name = Name_p AND SR.RoleId <> RoleId_p) THEN
		SET Msg_p = 'Role name already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbSecurity_Role SR WHERE SR.RoleId = RoleId_p) THEN
		SET Msg_p = 'Role does not exist. Please verify!';
	ELSE
		UPDATE tbSecurity_Role SET
			  `Name`		= Name_p
			, `Description`	= Description_p
			, `IsActive`	= IsActive_p
			, `ModUserId`	= UserId_p
			, `ModDate`		= Date_v
		 WHERE
			RoleId = RoleId_p;
	END IF;
END$$
DELIMITER ;
