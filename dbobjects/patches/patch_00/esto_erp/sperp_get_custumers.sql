DROP PROCEDURE IF EXISTS `sperp_get_custumers`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_custumers`()
BEGIN
	SELECT
		  CS.`CustomerId`
		, CS.`Code`
		, CS.`Name`
		, CS.`Phone1`
		, CS.`Phone2`
		, CS.`Website`
		, CS.`Notes`

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
		tberp_customer CS
        INNER JOIN tberp_address AD ON
			AD.AddressId = CS.AddressId
		INNER JOIN tberp_country CO ON
			CO.CountryId = AD.CountryId
        INNER JOIN tberp_contact CT ON
			CT.ContactId = CS.ContactId;
END$$
DELIMITER ;
