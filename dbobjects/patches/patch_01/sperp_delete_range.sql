DROP PROCEDURE IF EXISTS `sperp_delete_range`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_range`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_range RN WHERE RN.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSE
		DELETE FROM tberp_range WHERE Id = Id_p;
	END IF;
END$$
DELIMITER ;
