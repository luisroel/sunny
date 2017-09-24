DROP  PROCEDURE IF EXISTS `spsecurity_update_role`;
DELIMITER $$
CREATE  PROCEDURE `spsecurity_update_role`(
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

    
	IF EXISTS(SELECT * FROM tbsecurity_role SR WHERE SR.Name = Name_p AND SR.RoleId <> RoleId_p) THEN
		SET Msg_p = 'Role name already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbsecurity_role SR WHERE SR.RoleId = RoleId_p) THEN
		SET Msg_p = 'Role does not exist. Please verify!';
	ELSE
		UPDATE tbsecurity_role SET
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
