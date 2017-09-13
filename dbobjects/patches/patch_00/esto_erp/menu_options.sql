

--
-- Creates catalog menu record
--

INSERT INTO tbsecurity_menu(`Name`, `Description`, `Order`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate` )
VALUES('Catalogs', 'Catalogs', 20, 1, 1, '2017-09-01 20:20', 1, '2017-09-12 20:20');

--
-- Creates customer option in catalog menu
--
INSERT INTO tbsecurity_module (`Name`, `Description`, `MenuId`, `Order`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`)
VALUES ('Customer', 'Customer catalog', 3, 2010, 1, 1, '2017-09-01 20:20', 1, '2017-09-12 20:20');

--
-- Adds customer option to admin role
--
INSERT INTO tbsecurity_rolemodule (`RoleId`, `ModuleId`, `IsCreated`, `IsUpdated`, `IsDeleted`)
VALUES (1, 7, 1, 1, 1);

--
-- Creates provider option in catalog menu
--
INSERT INTO tbsecurity_module (`Name`, `Description`, `MenuId`, `Order`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`)
VALUES ('Provider', 'Provider catalog', 3, 2020, 1, 1, '2017-09-01 20:20', 1, '2017-09-12 20:20');

--
-- Adds provider option to admin role
--
INSERT INTO tbsecurity_rolemodule (`RoleId`, `ModuleId`, `IsCreated`, `IsUpdated`, `IsDeleted`)
VALUES (1, 8, 1, 1, 1);