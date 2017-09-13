DROP PROCEDURE IF EXISTS `sperp_delete_provider_address`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_provider_address`(
	  IN AddressId_p	BIGINT
	, IN ProviderId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_address CT WHERE CT.AddressId = AddressId_p) THEN
		SET	Msg_p = 'Address does not exist. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE AddressId = AddressId_p;
			DELETE FROM tberp_provider_address WHERE ProviderId = ProviderId_p AND AddressId = AddressId_p;
		COMMIT;
	END IF;
END$$
DELIMITER ;
