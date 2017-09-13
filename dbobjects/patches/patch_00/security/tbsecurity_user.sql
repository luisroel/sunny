CREATE TABLE `tbsecurity_user` (
  `UserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(35) DEFAULT NULL,
  `Password` varchar(35) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bit(1) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

TRUNCATE TABLE tbsecurity_user;

INSERT INTO tbsecurity_user ( `UserName`, `Password`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`)
VALUES ('Admin', 'E3AFED0047B08059D0FADA10F400C1E5', 1, 1, '2015-11-12 16:30:13', 1, '2017-08-31 21:06:43');
