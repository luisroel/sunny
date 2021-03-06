DROP PROCEDURE IF EXISTS `sperp_insert_address`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_address`(
	  IN Type_p			INTEGER
	, IN Id_p			BIGINT
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60) 
    , IN CountryId_p	BIGINT
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v 		DATETIME;
    DECLARE AddressId_v BIGINT;

	SET Date_v = NOW();
	SET Msg_p = 'Transaction error.';

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
        IF Type_p = 0 THEN		-- Customer address
			INSERT INTO tberp_customer_address (`AddressId`, `CustomerId`) VALUES ( AddressId_v, Id_p );
		ELSE
			INSERT INTO tberp_provider_address (`AddressId`, `ProviderId`) VALUES ( AddressId_v, Id_p );
        END IF;					-- Provider address
        SET Msg_p = '';
	COMMIT;
END$$
DELIMITER ;
