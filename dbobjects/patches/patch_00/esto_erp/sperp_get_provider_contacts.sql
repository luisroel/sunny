DROP PROCEDURE IF EXISTS `sperp_get_provider_contacts`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_provider_contacts`(
	IN ProviderId_p BIGINT
)
BEGIN
	SELECT
		  CT.`ContactId`
		, CT.`Suffix`
		, CT.`Title`
		, CT.`FirstName`
		, CT.`MiddleName`
		, CT.`LastName`
		, CT.`Surname`
		, CT.`Email`
		, CT.`WorkPhone`
		, CT.`HomePhone`
		, CT.`MobilPhone`
    FROM
		tberp_provider_contact CC
        INNER JOIN tberp_contact CT ON
			CT.ContactId = CC.ContactId
	WHERE
		CC.ProviderId = ProviderId_p;
END$$
DELIMITER ;
