DROP PROCEDURE IF EXISTS `spsecurity_insert_role`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_insert_role`(
	  IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbsecurity_role SR WHERE SR.Name = Name_p) THEN
		SET	Msg_p = 'Role name already exist. Please verify role name!';
	ELSE
		INSERT tbsecurity_role (
			  `Name`
			, `Description`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Name_p
			, Description_p
			, 1
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END$$
DELIMITER ;
