DROP PROCEDURE IF EXISTS `sperp_get_providers`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_providers`()
BEGIN
	SELECT
		  PR.`Id`
		, PR.`Code`
		, PR.`Name`
		, PR.`Phone1`
		, PR.`Phone2`
		, PR.`Website`
		, PR.`Notes`

		, PR.`AddressId`
		, AD.`Line1`
		, AD.`Line2`
		, AD.`Line3`
		, AD.`ZipCode`
		, AD.`City`
		, AD.`State`

		, CO.`CountryId`
        , CO.`Code`
        , CO.`CountryName`

		, PR.`ContactId`
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
			AD.Id = PR.AddressId
		INNER JOIN tberp_country CO ON
			CO.CountryId = AD.CountryId
        INNER JOIN tberp_contact CT ON
			CT.Id = PR.ContactId;
END$$
DELIMITER ;
