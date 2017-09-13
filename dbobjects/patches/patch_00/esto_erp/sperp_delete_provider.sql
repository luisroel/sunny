DROP PROCEDURE IF EXISTS `sperp_delete_provider`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_provider`(
	  IN ProviderId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_provider PR WHERE PR.ProviderId = ProviderId_p) THEN
		SET	Msg_p = 'Provider does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider_contact PC WHERE PC.ProviderId = ProviderId_p) THEN
		SET	Msg_p = 'Provider has still contacts. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider_address PA WHERE PA.ProviderId = ProviderId_p) THEN
		SET	Msg_p = 'Provider has still addresses. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE AddressId IN (SELECT PR.AddressId FROM tberp_provider PR WHERE PR.ProviderId = ProviderId_p);
            DELETE FROM tberp_provider_address WHERE ProviderId = ProviderId_p AND AddressId IN (SELECT PR.AddressId FROM tberp_provider PR WHERE PR.ProviderId = ProviderId_p);
            DELETE FROM tberp_contact WHERE ContactId IN (SELECT PR.ContactId FROM tberp_provider PR WHERE PR.ProviderId = ProviderId_p);
            DELETE FROM tberp_provider_contact WHERE ProviderId = ProviderId_p AND ContactId IN (SELECT PR.ContactId FROM tberp_provider PR WHERE PR.ProviderId = ProviderId_p);
			DELETE FROM tberp_provider WHERE ProviderId = ProviderId_p;
        COMMIT;
	END IF;
END$$
DELIMITER ;
