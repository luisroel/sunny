DROP PROCEDURE IF EXISTS `sperp_get_customer_contacts`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_customer_contacts`(
	IN CustomerId_p BIGINT
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
		tberp_customer_contact CC
        INNER JOIN tberp_contact CT ON
			CT.ContactId = CC.ContactId
	WHERE
		CC.CustomerId = CustomerId_p;
END$$
DELIMITER ;
