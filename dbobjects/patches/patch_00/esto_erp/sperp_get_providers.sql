DROP PROCEDURE IF EXISTS `sperp_get_providers`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_providers`()
BEGIN
	SELECT
		  PR.`ProviderId`
		, PR.`Code`
		, PR.`Name`
		, PR.`Phone1`
		, PR.`Phone2`
		, PR.`Website`
		, PR.`Notes`

		, AD.`AddressId`
		, AD.`Line1`
		, AD.`Line2`
		, AD.`Line3`
		, AD.`ZipCode`
		, AD.`City`
		, AD.`State`

		, CO.`CountryId`
        , CO.`Code`
        , CO.`CountryName`

		, CT.`ContactId`
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
		tberp_provider PR
        INNER JOIN tberp_address AD ON
			AD.AddressId = PR.AddressId
		INNER JOIN tberp_country CO ON
			CO.CountryId = AD.CountryId
        INNER JOIN tberp_contact CT ON
			CT.ContactId = PR.ContactId;
END$$
DELIMITER ;
