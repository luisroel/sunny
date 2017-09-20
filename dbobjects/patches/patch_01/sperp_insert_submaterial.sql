DROP PROCEDURE IF EXISTS `sperp_insert_submaterial`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_submaterial`(
	  IN IsActive_p		BIT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    , IN Weight_p		FLOAT
    , IN MinStock_p		FLOAT
    , IN MaxStock_p		FLOAT
    , IN UOMId_p		BIGINT
    , IN CategoryId_p	BIGINT
    , IN Notes_p		VARCHAR(255)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Code = Code_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Description = Description_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_submaterial(
			  `IsActive`
			, `Code`
			, `Description`
            , `Weight`
			, `MinStock`
            , `MaxStock`
            , `UOMId`
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
            , MinStock_p
            , MaxStock_p
            , UOMId_p
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
