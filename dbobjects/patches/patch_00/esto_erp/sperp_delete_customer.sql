DROP PROCEDURE IF EXISTS `sperp_delete_customer`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_customer`(
	  IN CustomerId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_customer CT WHERE CT.CustomerId = CustomerId_p) THEN
		SET	Msg_p = 'Customer does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer_contact CC WHERE CC.CustomerId = CustomerId_p) THEN
		SET	Msg_p = 'Customer has still contacts. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer_address CA WHERE CA.CustomerId = CustomerId_p) THEN
		SET	Msg_p = 'Customer has still addresses. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE AddressId IN (SELECT CS.AddressId FROM tberp_customer CS WHERE CS.CustomerId = CustomerId_p);
            DELETE FROM tberp_customer_address WHERE CustomerId = CustomerId_p AND AddressId IN (SELECT CS.AddressId FROM tberp_customer CS WHERE CS.CustomerId = CustomerId_p);
            DELETE FROM tberp_contact WHERE ContactId IN (SELECT CS.ContactId FROM tberp_customer CS WHERE CS.CustomerId = CustomerId_p);
            DELETE FROM tberp_customer_contact WHERE CustomerId = CustomerId_p AND ContactId IN (SELECT CS.ContactId FROM tberp_customer CS WHERE CS.CustomerId = CustomerId_p);
			DELETE FROM tberp_customer WHERE CustomerId = CustomerId_p;
        COMMIT;
	END IF;
END$$
DELIMITER ;
