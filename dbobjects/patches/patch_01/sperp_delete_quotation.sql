DROP PROCEDURE IF EXISTS `sperp_delete_quotation`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_quotation`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = 1 AND RN.ItemKey = Id_p) THEN
		SET	Msg_p = 'There is still cost records for this quotation. Please verify!';
	ELSE
		DELETE FROM tberp_quotation WHERE Id = Id_p;
	END IF;
END$$
DELIMITER ;
