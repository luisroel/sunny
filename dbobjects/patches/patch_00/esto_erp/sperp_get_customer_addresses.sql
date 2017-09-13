DROP PROCEDURE IF EXISTS `sperp_get_customer_addresses`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_customer_addresses`(
	IN CustomerId_p BIGINT
)
BEGIN
	SELECT
		  AD.`AddressId`
		, AD.`Line1`
		, AD.`Line2`
		, AD.`Line3`
		, AD.`ZipCode`
		, AD.`City`
		, AD.`State`

		, CO.`CountryId`
        , CO.`Code`
        , CO.`CountryName`
    FROM
		tberp_customer_address CA
        INNER JOIN tberp_address AD ON
			AD.AddressId = CA.AddressId
		INNER JOIN tberp_country CO ON
			CO.CountryId = AD.CountryId
	WHERE
		CA.CustomerId = CustomerId_p;
END$$
DELIMITER ;
