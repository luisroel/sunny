DROP PROCEDURE IF EXISTS `sperp_insert_component`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_component`(
	  IN Type_p			INTEGER
	, IN ProductId_p	BIGINT
	, IN ComponentId_p	BIGINT
    , IN Quantity_p		FLOAT
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = Type_p AND PC.ProductId = ProductId_p AND PC.ComponentId = ComponentId_p) THEN
		SET	Msg_p = 'Component already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		INSERT tberp_product_component(
			  `Type`
			, `ProductId`
			, `ComponentId`
            , `Quantity`
            
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Type_p
			, ProductId_p
			, ComponentId_p
			, Quantity_p
            
			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END$$
DELIMITER ;
