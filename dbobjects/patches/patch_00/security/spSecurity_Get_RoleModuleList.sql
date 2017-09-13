DELIMITER $$
CREATE PROCEDURE `spSecurity_Get_RoleModuleList`(
	RoleId_p	BIGINT
)
BEGIN
    
	SELECT 
		  SD.ModuleId
		, SO.Name		AS ModuleName
		, SD.IsCreated
		, SD.IsUpdated
		, SD.IsDeleted
	FROM 
		tbSecurity_RoleModule SD
		INNER JOIN tbSecurity_Module SO ON
			SO.ModuleId = SD.ModuleId
	WHERE 
		SD.RoleId = RoleId_p;
END$$
DELIMITER ;
