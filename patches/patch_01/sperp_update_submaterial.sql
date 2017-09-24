DROP PROCEDURE IF EXISTS `sperp_update_submaterial`;
DELIMITER $$
CREATE PROCEDURE `sperp_update_submaterial`(
	  IN Id_p 			BIGINT
	, IN IsActive_p		BIT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    , IN Weight_p		FLOAT
    , IN MinStock_p		FLOAT
    , IN MaxStock_p		FLOAT
    , IN UOMId_p		BIGINT
    , IN CategoryId_p	BIGINT
    , IN Notes_p		VARCHAR(255)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Code = Code_p AND SM.Id <> Id_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Description = Description_p AND SM.Id <> Id_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		UPDATE tberp_submaterial SET
			  `IsActive` 	= IsActive_p
			, `Code` 		= Code_p
			, `Description`	= Description_p
            , `Weight` 		= Weight_p
            , `MinStock` 	= MinStock_p
            , `MaxStock` 	= MaxStock_p
            , `UOMId` 		= UOMId_p
            , `CategoryId` 	= CategoryId_p
            , `Notes` 		= Notes_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END$$
DELIMITER ;
