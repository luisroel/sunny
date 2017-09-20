DROP PROCEDURE IF EXISTS `sperp_get_quotation_submaterial`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_quotation_submaterial`(
	  IN ProviderId_p		BIGINT
)
BEGIN
	SELECT
		TM.*
	FROM (
		SELECT DISTINCT
			  SB.`Id`
			, SB.`Code`
			, SB.`Description`
		FROM
			tberp_submaterial SB
			INNER JOIN tberp_quotation QT ON
				QT.SubmaterialId = SB.Id
		WHERE
			QT.ProviderId  = ProviderId_p
		UNION ALL
		SELECT
			-1
			, ' ALL'
			, ' ALL'
	) TM
	ORDER BY
		TM.`Code`;
END$$
DELIMITER ;
