DROP PROCEDURE IF EXISTS `sperp_delete_contact`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_contact`(
	  IN Type_p			INTEGER
	, IN ContactId_p 	BIGINT
	, IN Id_p			BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = 'Database transaction error!';

	IF NOT EXISTS(SELECT * FROM tberp_contact CT WHERE CT.Id = ContactId_p) THEN
		SET	Msg_p = 'Contact does not exist. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_contact WHERE Id = ContactId_p;
            IF Type_p = 0 THEN 		-- Customer contact
				DELETE FROM tberp_customer_contact WHERE CustomerId = Id_p AND ContactId = ContactId_p;
			ELSE 					-- Provider contact
				DELETE FROM tberp_provider_contact WHERE ProviderId = Id_p AND ContactId = ContactId_p;
            END IF;
            SET Msg_p = '';
		COMMIT;
	END IF;
END$$
DELIMITER ;
