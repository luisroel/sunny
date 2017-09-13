DROP PROCEDURE IF EXISTS `sperp_delete_customer_contact`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_customer_contact`(
	  IN ContactId_p 	BIGINT
	, IN CustomerId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_contact CT WHERE CT.ContactId = ContactId_p) THEN
		SET	Msg_p = 'Contact does not exist. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_contact WHERE ContactId = ContactId_p;
            DELETE FROM tberp_customer_contact WHERE CustomerId = CustomerId_p AND ContactId = ContactId_p;
		COMMIT;
	END IF;
END$$
DELIMITER ;
