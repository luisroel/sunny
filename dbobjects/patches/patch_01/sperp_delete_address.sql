DROP PROCEDURE IF EXISTS `sperp_delete_address`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_address`(
	  IN Type_p			INTEGER
	, IN AddressId_p	BIGINT
	, IN Id_p			BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = 'Database transaction error!';

	IF NOT EXISTS(SELECT * FROM tberp_address CT WHERE CT.Id = AddressId_p) THEN
		SET	Msg_p = 'Address does not exist. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE Id = AddressId_p;
			IF Type_p = 0 THEN 		-- Customer address
				DELETE FROM tberp_customer_address WHERE CustomerId = Id_p AND AddressId = AddressId_p;
			ELSE 					-- Provider address
				DELETE FROM tberp_provider_address WHERE ProviderId = Id_p AND AddressId = AddressId_p;
            END IF;
            SET Msg_p = '';
		COMMIT;
	END IF;
END$$
DELIMITER ;
