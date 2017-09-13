DROP PROCEDURE IF EXISTS `sperp_update_master`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_master`(
	  IN Id_p 			BIGINT
	, IN Type_p			INTEGER
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Code = Code_p AND MS.Type = Type_p AND MS.Id <> Id_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Description = Description_p AND MS.Type = Type_p AND MS.Id <> Id_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		UPDATE tberp_master SET
			  `Code` 		= Code_p
			, `Description`	= Description_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END$$
DELIMITER ;
