DROP PROCEDURE IF EXISTS `spsecurity_get_rolemodulelist`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_get_rolemodulelist`(
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
		tbsecurity_rolemodule SD
		INNER JOIN tbsecurity_module SO ON
			SO.ModuleId = SD.ModuleId
	WHERE 
		SD.RoleId = RoleId_p;
END$$
DELIMITER ;
