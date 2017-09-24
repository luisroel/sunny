DROP VIEW IF EXISTS `vwsecurity_get_userrights`;
CREATE VIEW `vwsecurity_get_userrights` 
AS 
	SELECT 
		  `rl`.`UserId` 	AS `UserId`
		, `mn`.`MenuId` 	AS `MenuId`
		, `mn`.`Name` 		AS `MenuName`
		, `mn`.`Order`	 	AS `MenuOrder`
		, `md`.`ModuleId` 	AS `ModuleId`
		, `md`.`Name` 		AS `ModuleName`
		, `md`.`Order` 		AS `ItemOrder`
		, `rl`.`IsCreated` 	AS `IsCreated`
		, `rl`.`IsUpdated` 	AS `IsUpdated`
		, `rl`.`IsDeleted` 	AS `IsDeleted` 
	FROM 
		     `tbsecurity_usermodule` `rl` 
		INNER JOIN `tbsecurity_module` `md` ON
			    `md`.`ModuleId` = `rl`.`ModuleId`
			AND `md`.`IsActive` = 1
		INNER JOIN `tbsecurity_menu` `mn` ON
			    `mn`.`MenuId` = `md`.`MenuId`
			AND `mn`.`IsActive` = 1
	union 
	SELECT 
		 `ur`.`UserId` 		AS `UserId`
		, `mn`.`MenuId` 	AS `MenuId`
		, `mn`.`Name` 		AS `MenuName`
		, `mn`.`Order` 		AS `MenuOrder`
		, `md`.`ModuleId` 	AS `ModuleId`
		, `md`.`Name` 		AS `ModuleName`
		, `md`.`Order` 		AS `ItemOrder`
		, `rm`.`IsCreated` 	AS `IsCreated`
		, `rm`.`IsUpdated` 	AS `IsUpdated`
		, `rm`.`IsDeleted` 	AS `IsDeleted` 
	from
			`tbsecurity_userrole` `ur` 
		INNER JOIN `tbsecurity_rolemodule` `rm` ON
			`ur`.`RoleId` = `rm`.`RoleId` 
		INNER JOIN `tbsecurity_module` `md` ON
				`md`.`ModuleId` = `rm`.`ModuleId` 
			AND `md`.`IsActive` = 1 
		INNER JOIN `tbsecurity_menu` `mn` ON
				`mn`.`MenuId` = `md`.`MenuId`
			AND `mn`.`IsActive` = 1;
