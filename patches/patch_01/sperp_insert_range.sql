DROP PROCEDURE IF EXISTS `sperp_insert_range`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_range`(
      IN Type_p		INTEGER
    , IN ItemKey_p	BIGINT
	, IN From_p		FLOAT
	, IN To_p		FLOAT
	, IN Amount_p	FLOAT
    
    , IN UserId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From = From_p AND RN.To = To_p) THEN
		SET	Msg_p = 'Range already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From <= From_p AND RN.To > From_p) THEN
		SET	Msg_p = 'The new range overslaps an existing range. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_range(
			  `Type`
			, `ItemKey`
			, `From`
			, `To`
			, `Amount`
			
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Type_p
			, ItemKey_p
			, From_p
			, To_p
			, Amount_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END$$
DELIMITER ;
