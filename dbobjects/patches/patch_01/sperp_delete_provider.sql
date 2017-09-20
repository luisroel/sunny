DROP PROCEDURE IF EXISTS `sperp_delete_provider`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_provider`(
	  IN Id_p 	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_provider PR WHERE PR.Id = Id_p) THEN
		SET	Msg_p = 'Provider does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider_contact PC WHERE PC.ProviderId = Id_p) THEN
		SET	Msg_p = 'Provider has still contacts. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider_address PA WHERE PA.ProviderId = Id_p) THEN
		SET	Msg_p = 'Provider has still addresses. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE Id IN (SELECT PR.AddressId FROM tberp_provider PR WHERE PR.Id = Id_p);
            DELETE FROM tberp_provider_address WHERE ProviderId = Id_p AND AddressId IN (SELECT PR.AddressId FROM tberp_provider PR WHERE PR.Id = Id_p);
            DELETE FROM tberp_contact WHERE Id IN (SELECT PR.ContactId FROM tberp_provider PR WHERE PR.Id = Id_p);
            DELETE FROM tberp_provider_contact WHERE ProviderId = Id_p AND ContactId IN (SELECT PR.ContactId FROM tberp_provider PR WHERE PR.Id = Id_p);
			DELETE FROM tberp_provider WHERE Id = Id_p;
        COMMIT;
	END IF;
END$$
DELIMITER ;
