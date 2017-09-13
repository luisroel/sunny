CREATE TABLE `tbsecurity_rolemodule` (
  `RoleId` bigint(20) NOT NULL,
  `ModuleId` bigint(20) NOT NULL,
  `IsCreated` bit(1) DEFAULT NULL,
  `IsUpdated` bit(1) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`RoleId`,`ModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tbsecurity_rolemodule (`RoleId`, `ModuleId`, `IsCreated`, `IsUpdated`, `IsDeleted`)
VALUES (1, 1, 1, 1, 1)
, (1, 2, 1, 1, 1)
, (1, 3, 1, 1, 1)
, (1, 4, 1, 1, 1)
, (1, 5, 1, 1, 1)
, (1, 6, 1, 1, 1);
