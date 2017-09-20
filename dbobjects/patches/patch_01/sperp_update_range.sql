DROP PROCEDURE IF EXISTS `sperp_update_range`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_range`(
	  IN Id_p 		BIGINT
	, IN Type_p		INTEGER
	, IN ItemKey_p	BIGINT
	, IN From_p		FLOAT
	, IN To_p		FLOAT
	, IN Amount_p	FLOAT
    
    , IN UserId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF NOT EXISTS(SELECT * FROM tberp_range RN WHERE RN.Id = Id_p) THEN
		SET	Msg_p = 'Range not found. Please verify!';
	ELSEIF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From = From_p AND RN.To = To_p AND RN.Id <> Id_p) THEN
		SET	Msg_p = 'Range already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From <= From_p AND RN.To > From_p AND RN.Id <> Id_p) THEN
		SET	Msg_p = 'The new range overslaps an existing range. Please verify!';
	ELSE
		UPDATE tberp_range SET
			  `From`	= From_p
			, `To`		= To_p
			, `Amount`	= Amount_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END$$
DELIMITER ;
