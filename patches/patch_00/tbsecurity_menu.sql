DROP TABLE IF EXISTS `tbsecurity_menu`;
CREATE TABLE `tbsecurity_menu` (
  `MenuId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`MenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE tbsecurity_menu;

INSERT INTO tbsecurity_menu ( `Name`, `Description`, `Order`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`)
  VALUES ('System', 'System Menu', 10, 1, 1, '2015-11-12 16:30:12', 1, '2017-08-27 21:30:49')
, ('Help', 'Help Menu', 2000, 1, 1, '2015-11-12 16:30:12', 1, '2017-08-27 20:13:47');
