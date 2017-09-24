DROP PROCEDURE IF EXISTS `spsecurity_get_usermodulelist`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_get_usermodulelist`(
	IN UserId_p	BIGINT
)
BEGIN
    
	SELECT 
		  SU.ModuleId
		, SO.Name		AS ModuleName
		, SU.IsCreated
		, SU.IsUpdated
		, SU.IsDeleted
	FROM 
		tbsecurity_usermodule SU
		INNER JOIN tbSecurity_Module SO ON
			SO.ModuleId = SU.ModuleId
	WHERE 
		SU.UserId = UserId_p;
END$$
DELIMITER ;
