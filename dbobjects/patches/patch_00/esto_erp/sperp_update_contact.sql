DROP PROCEDURE IF EXISTS `sperp_update_contact`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_contact`(
	  IN ContactId_p	BIGINT
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
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_contact AD WHERE AD.ContactId = contactId_p) THEN
		SET	Msg_p = 'Contact does not exist. Please verify!';
	ELSE
		UPDATE tberp_contact SET
			  `Suffix` 		= Suffix_p
			, `Title`		= Title_p
			, `FirstName`	= FirstName_p
			, `MiddleName` 	= MiddleName_p
			, `LastName`	= LastName_p
			, `Surname`		= Surname_p
			, `Email`		= Email_p
			, `WorkPhone`	= WorkPhone_p
            , `HomePhone`	= HomePhone_p
            , `MobilPhone`	= MobilPhone_p

            , `ModDate`		= Date_v
            , `ModUserId`	= UserId_p
		WHERE
			ContactId = ContactId_p;
	END IF;
END$$
DELIMITER ;
