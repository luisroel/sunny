DROP TABLE IF EXISTS `tberp_contact`;
CREATE TABLE `tberp_contact` (
  `Id` 			bigint(20) NOT NULL AUTO_INCREMENT,
  `Suffix` 		varchar(10) DEFAULT NULL,  
  `Title` 		varchar(10) DEFAULT NULL,
  `FirstName` 	varchar(60) DEFAULT NULL,
  `MiddleName` 	varchar(60) DEFAULT NULL,
  `LastName` 	varchar(60) DEFAULT NULL,
  `Surname` 	varchar(100) DEFAULT NULL,
  `Email` 		varchar(100) DEFAULT NULL,
  `WorkPhone` 	varchar(15) DEFAULT NULL,
  `HomePhone` 	varchar(15) DEFAULT NULL,
  `MobilPhone` 	varchar(15) DEFAULT NULL,
  
  `EntryDate` 	datetime,
  `EntryUserId` bigint(20),
  `ModDate` 	datetime,
  `ModUserId` 	bigint(20),
  
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_contact`;