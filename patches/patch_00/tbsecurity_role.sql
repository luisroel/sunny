DROP TABLE IF EXISTS `tbsecurity_role`;
CREATE TABLE `tbsecurity_role` (
  `RoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

TRUNCATE TABLE tbsecurity_role;

INSERT INTO tbsecurity_role (`Name`, `Description`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`)
VALUES ( 'Admin', 'System Administration Role', 1, 1, '2015-11-13 08:51:51', 1, '2017-08-30 23:22:25');