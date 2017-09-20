DROP PROCEDURE IF EXISTS `sperp_get_ranges`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_ranges`(
	  IN Type_p		INTEGER
	, IN ItemKey_p	BIGINT
)
BEGIN
	SELECT
		  RN.`Id`
		, RN.`Type`
		, RN.`ItemKey`
		, RN.`From`
		, RN.`To`
		, RN.`Amount`
    FROM
		tberp_range RN
	WHERE
			RN.Type 	= Type_p
		AND RN.ItemKey	= ItemKey_p
	ORDER BY
		RN.`From`;
END$$
DELIMITER ;
