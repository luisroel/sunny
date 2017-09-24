DROP PROCEDURE IF EXISTS `sperp_insert_master`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_master`(
      IN Type_p			INTEGER
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Code = Code_p AND MS.Type = Type_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Description = Description_p AND MS.Type = Type_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_master(
			  `Type`
			, `Code`
			, `Description`
			
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Type_p
			, Code_p
			, Description_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END$$
DELIMITER ;
