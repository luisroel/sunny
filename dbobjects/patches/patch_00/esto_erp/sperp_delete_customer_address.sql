DROP PROCEDURE IF EXISTS `sperp_delete_customer_address`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_customer_address`(
	  IN AddressId_p	BIGINT
	, IN CustomerId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_address CT WHERE CT.AddressId = AddressId_p) THEN
		SET	Msg_p = 'Address does not exist. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE AddressId = AddressId_p;
			DELETE FROM tberp_customer_address WHERE CustomerId = CustomerId_p AND AddressId = AddressId_p;
		COMMIT;
	END IF;
END$$
DELIMITER ;
