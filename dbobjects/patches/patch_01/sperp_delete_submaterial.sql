DROP PROCEDURE IF EXISTS `sperp_delete_submaterial`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_submaterial`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = 1 AND PC.ComponentId = Id_p) THEN
		SET	Msg_p = 'There are products still related with this record. Please verify!';
	ELSE
		DELETE FROM tberp_submaterial WHERE Id = Id_p;
	END IF;
END$$
DELIMITER ;
