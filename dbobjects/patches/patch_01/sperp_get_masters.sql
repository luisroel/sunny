DROP PROCEDURE IF EXISTS `sperp_get_masters`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_masters`(
	IN Type_p INTEGER
)
BEGIN
	SELECT
		  MS.`Id`
		, MS.`Code`
		, MS.`Description`
    FROM
		tberp_master MS
	WHERE
		MS.Type = Type_p;
END$$
DELIMITER ;
