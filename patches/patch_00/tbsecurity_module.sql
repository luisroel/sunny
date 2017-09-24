DROP TABLE IF EXISTS `tbsecurity_module`;
CREATE TABLE `tbsecurity_module` (
  `ModuleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `MenuId` bigint(20) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ModuleId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

TRUNCATE TABLE tbsecurity_module;

INSERT INTO tbsecurity_module (`Name`, `Description`, `MenuId`, `Order`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`)
VALUES ( 'Menus', 'System Menu Options', 1, 1010, 1, 1, '2015-11-12 16:30:13', 1, '2015-11-12 16:30:13')
,( 'Modules', 'System modules', 1, 1020, 1, 1, '2015-11-12 16:30:13', 1, '2015-11-12 16:30:13')
,( 'Roles', 'System User\'s roles', 1, 1030, 1, 1, '2015-11-12 16:30:13', 1, '2015-11-12 16:30:13')
,( 'Users', 'System Users Catalog', 1, 1040, 1, 1, '2015-11-12 16:30:13', 1, '2015-11-12 16:30:13')
,( 'Exit', 'Exit', 1, 1050, 1, 1, '2015-11-12 16:30:13', 1, '2015-11-12 16:30:13')
,( 'About', 'About', 2, 200010, 1, 1, '2015-11-12 16:30:13', 1, '2015-11-13 08:43:02');
