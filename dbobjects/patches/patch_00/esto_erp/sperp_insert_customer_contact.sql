DROP PROCEDURE IF EXISTS `sperp_insert_customer_contact`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_customer_contact`(
	  IN CustomerId_p	BIGINT
	, IN Suffix_p		VARCHAR(10)
	, IN Title_p		VARCHAR(10)
	, IN FirstName_p	VARCHAR(60)
    , IN MiddleName_p	VARCHAR(60)
    , IN LastName_p 	VARCHAR(60)
    , IN Surname_p 		VARCHAR(100)
    , IN Email_p		VARCHAR(100)
    , IN WorkPhone_p	VARCHAR(15)
    , IN HomePhone_p	VARCHAR(15)
    , IN MobilPhone_p	VARCHAR(15)

    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v 		DATETIME;
    DECLARE ContactId_v BIGINT;

	SET Date_v = NOW();
	SET Msg_p = 'Transaction error.';

	START TRANSACTION;
		INSERT tberp_contact (
			  `Suffix`
			, `Title`
			, `FirstName`
			, `MiddleName`
			, `LastName`
			, `Surname`
			, `Email`
			, `WorkPhone`
			, `HomePhone`
			, `MobilPhone`

			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Suffix_p
			, Title_p
			, FirstName_p
			, MiddleName_p
			, LastName_p
			, Surname_p
			, Email_p
			, WorkPhone_p
			, HomePhone_p
			, MobilPhone_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
        SET ContactId_v = last_insert_id();

        INSERT INTO tberp_customer_contact (`ContactId`, `CustomerId`) VALUES ( ContactId_v, CustomerId_p );

        SET Msg_p = '';
	COMMIT;
END$$
DELIMITER ;