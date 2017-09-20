DROP PROCEDURE IF EXISTS `sperp_get_quotations`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_quotations`(
	  IN ProviderId_p		BIGINT
	, IN SubmaterialId_p	BIGINT
)
BEGIN
	IF SubmaterialId_p = -1 THEN
		SELECT
			  QT.`Id`
			, SB.`CategoryId`
			, MS.`Code`			AS `CategoryCode`
			, MS.`Description`	AS `CategoryDescription`
			, QT.`SubmaterialId`
			, SB.`Code` 		AS `SubmaterialCode`
			, SB.`Description` 	AS `SubmaterialDescription`
			, QT.`ProviderCode`
			, QT.`LeadTime`
			, QT.`AdditionalCost`
			, QT.`From`
			, QT.`To`
			, QT.`Notes`
		FROM
			tberp_quotation QT
			INNER JOIN tberp_submaterial SB ON
				SB.Id = QT.SubmaterialId
			INNER JOIN tberp_master MS ON
					MS.Type	= 1
				AND MS.Id 	= SB.CategoryId
		WHERE
				QT.ProviderId 	= ProviderId_p
		ORDER BY
			QT.`From`;
	ELSE
		SELECT
			  QT.`Id`
			, SB.`CategoryId`
			, MS.`Code`			AS `CategoryCode`
			, MS.`Description`	AS `CategoryDescription`
			, QT.`SubmaterialId`
			, SB.`Code` 		AS `SubmaterialCode`
			, SB.`Description` 	AS `SubmaterialDescription`
			, QT.`ProviderCode`
			, QT.`LeadTime`
			, QT.`AdditionalCost`
			, QT.`From`
			, QT.`To`
			, QT.`Notes`
		FROM
			tberp_quotation QT
			INNER JOIN tberp_submaterial SB ON
				SB.Id = QT.SubmaterialId
			INNER JOIN tberp_master MS ON
					MS.Type	= 1
				AND MS.Id 	= SB.CategoryId
		WHERE
				QT.ProviderId 		= ProviderId_p
			AND QT.SubmaterialId 	= SubmaterialId_p
		ORDER BY
			QT.`From`;
    END IF;
END$$
DELIMITER ;
