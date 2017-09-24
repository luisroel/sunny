--
-- Creates "Catalog" menu option
--
CALL `spSecurity_Insert_Menu`(
	  'Catalogs'		-- Name
	, 'Catalogs'		-- Description
	, '20'				-- Position order in the main menu
	, 1					-- UserId = 1, Admin user
	, @Msg_p			-- Resultant message returned
);

--
-- Creates "Customers" submenu option in catalog menu
--
CALL `spSecurity_Insert_Module`(
	  'Customers'			-- Name
    , 'Customers catalog'	-- Description
    , 3						-- Menu Id = 3, Catalogs
    , 2010					-- Position order in catalog menu
    , 1						-- UserId = 1, Admin user
    , @Msg					-- Message result returned
);

--
-- Adds "Customers" submenu option to admin role
--
CALL `spSecurity_Insert_RoleModule`(
      1						-- RoleId = 1, Admin role
	, 7						-- ModuleId = 7, Customers module
	, 1						-- IsCreated = 1, able to insert records
	, 1						-- IsUpdated = 1, able to update records
	, 1 					-- IsDeleted = 1, abele to delete records
	, 1 					-- UserId = 1, Admin user
	, @Msg_p				-- Message result returned
);

--
-- Creates "Providers" submenu option in catalog menu
--
CALL `spSecurity_Insert_Module`(
	  'Providers'			-- Name
    , 'Providers catalog'	-- Description
    , 3						-- Menu Id = 3, Catalogs
    , 2020					-- Position order in catalog menu
    , 1						-- UserId = 1, Admin user
    , @Msg					-- Message result returned
);

--
-- Adds "Providers" submenu option to admin role
--
CALL `spSecurity_Insert_RoleModule`(
      1						-- RoleId = 1, Admin role
	, 8						-- ModuleId = 8, Providers module
	, 1						-- IsCreated = 1, able to insert records
	, 1						-- IsUpdated = 1, able to update records
	, 1 					-- IsDeleted = 1, abele to delete records
	, 1 					-- UserId = 1, Admin user
	, @Msg_p				-- Message result returned
);

--
-- Creates "Master Tables" submenu option in catalog menu
--
CALL `spSecurity_Insert_Module`(
	  'Master Tables'			-- Name
    , 'Master tables catalog'	-- Description
    , 3							-- Menu Id = 3, Catalogs
    , 2030						-- Position order in catalog menu
    , 1							-- UserId = 1, Admin user
    , @Msg						-- Message result returned
);

--
-- Adds "Master Tables" submenu option to admin role
--
CALL `spSecurity_Insert_RoleModule`(
      1						-- RoleId = 1, Admin role
	, 9						-- ModuleId = 9, Master tables module
	, 1						-- IsCreated = 1, able to insert records
	, 1						-- IsUpdated = 1, able to update records
	, 1 					-- IsDeleted = 1, abele to delete records
	, 1 					-- UserId = 1, Admin user
	, @Msg_p				-- Message result returned
);

--
-- Creates "Submaterials" submenu option in catalog menu
--
CALL `spSecurity_Insert_Module`(
	  'Submaterials'			-- Name
    , 'Submaterials catalog'	-- Description
    , 3							-- Menu Id = 3, Catalogs
    , 2040						-- Position order in catalog menu
    , 1							-- UserId = 1, Admin user
    , @Msg						-- Message result returned
);

--
-- Adds "Submaterials" submenu option to admin role
--
CALL `spSecurity_Insert_RoleModule`(
      1						-- RoleId = 1, Admin role
	, 10					-- ModuleId = 10, Submaterials module
	, 1						-- IsCreated = 1, able to insert records
	, 1						-- IsUpdated = 1, able to update records
	, 1 					-- IsDeleted = 1, abele to delete records
	, 1 					-- UserId = 1, Admin user
	, @Msg_p				-- Message result returned
);

--
-- Creates "Products" submenu option in catalog menu
--
CALL `spSecurity_Insert_Module`(
	  'Products'				-- Name
    , 'Products catalog'		-- Description
    , 3							-- Menu Id = 3, Catalogs
    , 2050						-- Position order in catalog menu
    , 1							-- UserId = 1, Admin user
    , @Msg						-- Message result returned
);

--
-- Adds "Products" submenu option to admin role
--
CALL `spSecurity_Insert_RoleModule`(
      1						-- RoleId = 1, Admin role
	, 11					-- ModuleId = 11, Products module
	, 1						-- IsCreated = 1, able to insert records
	, 1						-- IsUpdated = 1, able to update records
	, 1 					-- IsDeleted = 1, abele to delete records
	, 1 					-- UserId = 1, Admin user
	, @Msg_p				-- Message result returned
);