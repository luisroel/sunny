DROP TABLE IF EXISTS `tbsecurity_userrole`;
CREATE TABLE `tbsecurity_userrole` (
  `UserId` bigint(20) NOT NULL,
  `RoleId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbsecurity_userrole` (`UserId`, `RoleId`) VALUES (1, 1);