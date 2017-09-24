DROP PROCEDURE IF EXISTS `sperp_update_component`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_component`(
	  IN Type_p			INTEGER
	, IN ProductId_p	BIGINT
	, IN ComponentId_p	BIGINT
    , IN Quantity_p		FLOAT
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF NOT EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = Type_p AND PC.ProductId = ProductId_p AND PC.ComponentId = ComponentId_p) THEN
		SET	Msg_p = 'Component does not exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		UPDATE tberp_product_component SET
			  `Quantity` 	= Quantity_p
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
				`Type`		= Type_p
            AND ProductId 	= ProductId_p
            AND ComponentId = ComponentId_p;
		SET	Msg_p = '';
	END IF;
END$$
DELIMITER ;
