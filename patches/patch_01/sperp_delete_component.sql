DROP PROCEDURE IF EXISTS `sperp_delete_component`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_component`(
	  IN Type_p 		INTEGER
	, IN ProductId_p	BIGINT
	, IN ComponentId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';
	IF NOT EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = Type_p AND PC.ProductId = ProductId_p AND PC.ComponentId = ComponentId_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSE
		DELETE FROM tberp_product_component WHERE `Type` = Type_p AND `ProductId` = ProductId_p AND `ComponentId` = ComponentId_p;
	END IF;
END$$
DELIMITER ;
