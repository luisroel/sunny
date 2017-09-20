DROP PROCEDURE IF EXISTS `sperp_update_product`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_product`(
	  IN Id_p 			BIGINT
	, IN IsActive_p		BIT
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

	SET Date_v = NOW();

	IF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Code = Code_p AND PR.Id <> Id_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Description = Description_p AND PR.Id <> Id_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		UPDATE tberp_product SET
			  `IsActive` 	= IsActive_p
			, `Code` 		= Code_p
			, `Description`	= Description_p
            , `Weight` 		= Weight_p
            , `Color`		= Color_p
            , `Width`		= Width_p
            , `Height`		= Height_p
            , `Large`		= Large_p
            , `MinStock` 	= MinStock_p
            , `MaxStock` 	= MaxStock_p
            , `CategoryId` 	= CategoryId_p
            , `Notes` 		= Notes_p
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END$$
DELIMITER ;
