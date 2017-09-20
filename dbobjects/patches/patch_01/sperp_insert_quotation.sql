DROP PROCEDURE IF EXISTS `sperp_insert_quotation`;
DELIMITER $$
CREATE PROCEDURE `sperp_insert_quotation`(
      IN ProviderId_p		BIGINT
    , IN SubmaterialId_p	BIGINT
	, IN ProviderCode_p		VARCHAR(20)
	, IN LeadTime_p			INTEGER
	, IN AdditionalCost_p	FLOAT
	, IN From_p				DATETIME
	, IN To_p				DATETIME
	, IN Notes_p			VARCHAR(255)
    
    , IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From = From_p AND QT.To = To_p) THEN
		SET	Msg_p = 'Quotation already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From <= From_p AND QT.To > From_p) THEN
		SET	Msg_p = 'The new quotation dates overslaps an existing quotation. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_quotation(
			  `ProviderId`
			, `SubmaterialId`
			, `ProviderCode`
			, `LeadTime`
			, `AdditionalCost`
			, `From`
			, `To`
			, `Notes`
			
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  ProviderId_p
			, SubmaterialId_p
			, ProviderCode_p
			, LeadTime_p
			, AdditionalCost_p
			, From_p
			, To_p
			, Notes_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END$$
DELIMITER ;
