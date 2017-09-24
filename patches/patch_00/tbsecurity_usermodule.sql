DROP TABLE IF EXISTS `tbsecurity_usermodule`;
CREATE TABLE `tbsecurity_usermodule` (
  `UserId` bigint(20) NOT NULL,
  `ModuleId` bigint(20) NOT NULL,
  `IsCreated` bit(1) DEFAULT NULL,
  `IsUpdated` bit(1) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
