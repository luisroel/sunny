DROP PROCEDURE IF EXISTS `sperp_delete_master`;
DELIMITER $$
CREATE PROCEDURE `sperp_delete_master`(
	  IN Id_p	BIGINT
	, IN Type_p	INTEGER
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_master MS WHERE MS.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSEIF Type_p = 0 AND EXISTS(SELECT * FROM tberp_product PR WHERE PR.CategoryId = Id_p) THEN
		SET	Msg_p = 'There are products still related with this record. Please verify!';
	ELSEIF Type_p = 1 AND EXISTS(SELECT * FROM tberp_submaterial PR WHERE PR.CategoryId = Id_p) THEN
		SET	Msg_p = 'There are submaterials still related with this record. Please verify!';
	ELSEIF Type_p = 1 AND EXISTS(SELECT * FROM tberp_submaterial PR WHERE PR.MeasureId = Id_p) THEN
		SET	Msg_p = 'There are submaterials still related with this record. Please verify!';
	ELSE
		DELETE FROM tberp_master WHERE Id = Id_p;
	END IF;
END$$
DELIMITER ;
