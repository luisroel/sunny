DROP PROCEDURE IF EXISTS `sperp_get_addresses`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_addresses`(
	  IN Type_p INTEGER
	, IN Id_p 	BIGINT
)
BEGIN
	IF Type_p = 0 THEN		-- Customer Addresses
		SELECT
			  AD.`Id`
			, AD.`Line1`
			, AD.`Line2`
			, AD.`Line3`
			, AD.`ZipCode`
			, AD.`City`
			, AD.`State`

			, CO.`Id`	AS CountryId
			, CO.`Code`
			, CO.`CountryName`
		FROM
			tberp_customer_address CA
			INNER JOIN tberp_address AD ON
				AD.Id = CA.AddressId
			INNER JOIN tberp_country CO ON
				CO.Id = AD.CountryId
		WHERE
			CA.CustomerId = Id_p;
	ELSE	-- Provider Addresses
		SELECT
			  AD.`Id`
			, AD.`Line1`
			, AD.`Line2`
			, AD.`Line3`
			, AD.`ZipCode`
			, AD.`City`
			, AD.`State`

			, CO.`Id`	AS CountryId
			, CO.`Code`
			, CO.`CountryName`
		FROM
			tberp_provider_address CA
			INNER JOIN tberp_address AD ON
				AD.Id = CA.AddressId
			INNER JOIN tberp_country CO ON
				CO.Id = AD.CountryId
		WHERE
			CA.ProviderId = Id_p;
    END IF;
END$$
DELIMITER ;
