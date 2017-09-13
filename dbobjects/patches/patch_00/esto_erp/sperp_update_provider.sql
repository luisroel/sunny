DROP PROCEDURE IF EXISTS `sperp_update_provider`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_provider`(
	/* Provider */
	  IN ProviderId_p 	BIGINT
	, IN Code_p			VARCHAR(10)
	, IN Name_p			VARCHAR(100)
	, IN Phone1_p		VARCHAR(20)
    , IN Phone2_p		VARCHAR(20)
    , IN Website_p		VARCHAR(100)
    , IN Notes_p		VARCHAR(255)
    
    /* Address */
    , IN AddressId_p 	BIGINT
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT
    
    /* Contact */
    , IN ContactId_p 	BIGINT
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
	SET Msg_p = 'Transaction error.';

	IF EXISTS(SELECT * FROM tberp_provider PR WHERE PR.Code = Code_p AND PR.ProviderId <> ProviderId_p) THEN
		SET	Msg_p = 'Provider code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider PR WHERE PR.Name = Name_p AND PR.ProviderId <> ProviderId_p) THEN
		SET	Msg_p = 'Provider name already exist. Please verify!';
	ELSE
		START TRANSACTION;
			UPDATE tberp_provider SET
				  `Code` 		= Code_p
				, `Name`		= Name_p
				, `Phone1`		= Phone1_p
				, `Phone2` 		= Phone2_p
				, `Website`		= Website_p
				, `Notes`		= Notes_p
				
				, `ModDate`		= Date_v
				, `ModUserId`	= UserId_p
			WHERE
				ProviderId = ProviderId_p;

			CALL `sperp_update_contact`(
				  ContactId_p
				, Suffix_p
				, Title_p
				, FirstName_p
				, MiddleName_p
				, LastName_p
				, Surname_p
				, Email_p
				, WorkPhone_p
				, HomePhone_p
				, MobilPhone_p
				, UserId_p
				, Msg_p);
			IF Msg_p = '' THEN
				CALL `sperp_update_address`(
					  AddressId_p
					, Line1_p
					, Line2_p
					, Line3_p
					, ZipCode_p
					, City_p
					, State_p
					, CountryId_p
					, UserId_p
					, Msg_p);
				IF Msg_p <> '' THEN
					ROLLBACK;
				END IF;
			ELSE
				ROLLBACK;
			END IF;
		COMMIT;
	END IF;
END$$
DELIMITER ;
