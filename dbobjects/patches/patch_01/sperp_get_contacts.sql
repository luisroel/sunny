DROP PROCEDURE IF EXISTS `sperp_get_contacts`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_contacts`(
	  IN Type_p INTEGER
	, IN Id_p 	BIGINT
)
BEGIN
	IF Type_p = 0 THEN			-- Customer contact
		SELECT
			  CT.`Id`
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
			tberp_customer_contact CC
			INNER JOIN tberp_contact CT ON
				CT.Id = CC.ContactId
		WHERE
			CC.CustomerId = Id_p;
	ELSE			-- Provider contacts
		SELECT
			  CT.`Id`
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
				CT.Id = CC.ContactId
		WHERE
			CC.ProviderId = Id_p;
    END IF;
END$$
DELIMITER ;
