DROP PROCEDURE IF EXISTS `sperp_delete_customer`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_customer`(
	  IN  Id_p 	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_customer CT WHERE CT.Id = Id_p) THEN
		SET	Msg_p = 'Customer does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer_contact CC WHERE CC.CustomerId = Id_p) THEN
		SET	Msg_p = 'Customer has still contacts. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer_address CA WHERE CA.CustomerId = Id_p) THEN
		SET	Msg_p = 'Customer has still addresses. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE Id IN (SELECT CS.AddressId FROM tberp_customer CS WHERE CS.Id = Id_p);
            DELETE FROM tberp_customer_address WHERE CustomerId = Id_p AND AddressId IN (SELECT CS.AddressId FROM tberp_customer CS WHERE CS.Id = Id_p);
            DELETE FROM tberp_contact WHERE Id IN (SELECT CS.ContactId FROM tberp_customer CS WHERE CS.Id = Id_p);
            DELETE FROM tberp_customer_contact WHERE CustomerId = Id_p AND ContactId IN (SELECT CS.ContactId FROM tberp_customer CS WHERE CS.Id = Id_p);
			DELETE FROM tberp_customer WHERE Id = Id_p;
        COMMIT;
	END IF;
END$$
DELIMITER ;
