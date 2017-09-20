DROP PROCEDURE IF EXISTS `sperp_insert_product`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_product`(
	  IN IsActive_p		BIT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    , IN Weight_p		FLOAT
    , IN Color_p		VARCHAR(20)
    , IN Width_p		FLOAT
    , IN Height_p		FLOAT
    , IN Large_p		FLOAT
    , IN MinStock_p		FLOAT
    , IN MaxStock_p		FLOAT
    , IN CategoryId_p	BIGINT
    , IN Notes_p		VARCHAR(255)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Code = Code_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Description = Description_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		INSERT tberp_product(
			  `IsActive`
			, `Code`
			, `Description`
            , `Weight`
            , `Color`
            , `Width`
            , `Height`
            , `Large`
			, `MinStock`
            , `MaxStock`
            , `CategoryId`
            , `Notes`
            
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  IsActive_p
			, Code_p
			, Description_p
			, Weight_p
            , Color_p
            , Width_p
            , Height_p
            , Large_p
            , MinStock_p
            , MaxStock_p
            , CategoryId_p
            , Notes_p
            
			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END$$
DELIMITER ;
