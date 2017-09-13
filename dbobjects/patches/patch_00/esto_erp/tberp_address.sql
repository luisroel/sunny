DROP TABLE IF EXISTS `tberp_address`;
CREATE TABLE `tberp_address` (
  `AddressId` 	bigint(20) NOT NULL AUTO_INCREMENT,
  `Line1` 		varchar(100) DEFAULT NULL,  
  `Line2` 		varchar(100) DEFAULT NULL,
  `Line3` 		varchar(100) DEFAULT NULL,
  `ZipCode` 	varchar(10) DEFAULT NULL,
  `City` 		varchar(60) DEFAULT NULL,
  `State` 		varchar(60) DEFAULT NULL,
  `CountryId`	bigint(20) DEFAULT NULL,
  
  `EntryDate` 	datetime,
  `EntryUserId` bigint(20),
  `ModDate` 	datetime,
  `ModUserId` 	bigint(20),
  
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

