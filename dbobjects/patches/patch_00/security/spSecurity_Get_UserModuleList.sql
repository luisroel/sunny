DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_UserModuleList`(
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
		tbSecurity_UserModule SU
		INNER JOIN tbSecurity_Module SO ON
			SO.ModuleId = SU.ModuleId
	WHERE 
		SU.UserId = UserId_p;
END$$
DELIMITER ;
