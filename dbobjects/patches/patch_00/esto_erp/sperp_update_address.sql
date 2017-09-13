DROP PROCEDURE IF EXISTS `sperp_update_address`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_address`(
	  IN AddressId_p	BIGINT
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT

    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_address AD WHERE AD.AddressId = AddressId_p) THEN
		SET	Msg_p = 'Address does not exist. Please verify!';
	ELSE
		UPDATE tberp_address SET
			  `Line1` 		= Line1_p
			, `Line2`		= Line2_p
			, `Line3`		= Line3_p
			, `ZipCode` 	= ZipCode_p
			, `City`		= City_p
			, `State`		= State_p
			, `CountryId`	= CountryId_p

            , `ModDate`		= Date_v
            , `ModUserId`	= UserId_p
		WHERE
			AddressId = AddressId_p;
	END IF;
END$$
DELIMITER ;
