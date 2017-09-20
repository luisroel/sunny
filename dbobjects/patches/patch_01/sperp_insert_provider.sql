DROP PROCEDURE IF EXISTS `sperp_insert_provider`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_provider`(
	/* Provider */
	  IN Code_p			VARCHAR(10)
	, IN Name_p			VARCHAR(100)
	, IN Phone1_p		VARCHAR(20)
    , IN Phone2_p		VARCHAR(20)
    , IN Website_p		VARCHAR(100)
    , IN Notes_p		VARCHAR(255)
    
    /* Address */
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT
    
    /* Contact */
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
    DECLARE AddressId_v BIGINT;
    DECLARE ContactId_v BIGINT;

	IF EXISTS(SELECT * FROM tberp_provider CT WHERE CT.Code = Code_p) THEN
		SET	Msg_p = 'Provider code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider CT WHERE CT.Name = Name_p) THEN
		SET	Msg_p = 'Provider name already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		SET Msg_p = 'Transaction error';
        
        START TRANSACTION;
			INSERT tberp_address (
				  `Line1`
				, `Line2`
				, `Line3`
				, `ZipCode`
				, `City`
				, `State`
				, `CountryId`

				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Line1_p
				, Line2_p
				, Line3_p
				, ZipCode_p
				, City_p
				, State_p
				, CountryId_p
				
				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET AddressId_v = last_insert_id();
			
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
			
			INSERT tberp_provider(
				  `Code`
				, `Name`
				, `Phone1`
				, `Phone2`
				, `AddressId`
				, `ContactId`
				, `Website`
				, `Notes`
				
				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Code_p
				, Name_p
				, Phone1_p
				, Phone2_p
				, AddressId_v
				, ContactId_v
				, Website_p
				, Notes_p

				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET Msg_p = '';
		COMMIT;
	END IF;
END$$
DELIMITER ;
