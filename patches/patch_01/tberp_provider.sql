DROP TABLE IF EXISTS `tberp_provider`;
CREATE TABLE `tberp_provider` (
  `Id`          bigint(20) NOT NULL AUTO_INCREMENT,
  `Code`        varchar(10) DEFAULT NULL,  
  `Name`        varchar(100) DEFAULT NULL,
  `Phone1`      varchar(20) DEFAULT NULL,
  `Phone2`      varchar(20) DEFAULT NULL,
  `AddressId`   bigint(20) DEFAULT NULL,  
  `ContactId`   bigint(20) DEFAULT NULL,
  `Website`     varchar(100) DEFAULT NULL,
  `Notes` 		  varchar(255) DEFAULT NULL,
  
  `EntryDate` 	datetime,
  `EntryUserId` bigint(20),
  `ModDate`     datetime,
  `ModUserId` 	bigint(20),
  
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_provider`;