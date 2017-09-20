DROP PROCEDURE IF EXISTS `sperp_delete_product`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_product`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_product SM WHERE SM.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSE
		DELETE FROM tberp_product WHERE Id = Id_p;
	END IF;
END$$
DELIMITER ;
