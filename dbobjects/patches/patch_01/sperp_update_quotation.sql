DROP PROCEDURE IF EXISTS `sperp_update_quotation`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_quotation`(
	  IN Id_p 				BIGINT
    , IN ProviderId_p		BIGINT
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

	SET Date_v = NOW();

	IF NOT EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.Id = Id_p) THEN
		SET	Msg_p = 'Quotation not found. Please verify!';
	ELSEIF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From = From_p AND QT.To = To_p AND QT.Id <> Id_p) THEN
		SET	Msg_p = 'Quotation already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From <= From_p AND QT.To > From_p AND QT.Id <> Id_p) THEN
		SET	Msg_p = 'The new quotation dates overslaps an existing quotation. Please verify!';
	ELSE
		UPDATE tberp_quotation SET
			  `ProviderCode`	= ProviderCode_p
			, `LeadTime`		= LeadTime_p
			, `AdditionalCost`	= AdditionalCost_p
			, `From`			= From_p
			, `To`				= To_p
			, `Notes`			= Notes_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END$$
DELIMITER ;
