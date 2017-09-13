DROP TABLE IF EXISTS `tberp_master`;
CREATE TABLE `tberp_master` (
  `Id`	bigint(20) NOT NULL AUTO_INCREMENT,
  `Type`		int DEFAULT NULL,
  `Code`		varchar(10) DEFAULT NULL,  
  `Description`	varchar(100) DEFAULT NULL,
  
  `EntryDate`	datetime,
  `EntryUserId`	bigint(20),
  `ModDate`		datetime,
  `ModUserId`	bigint(20),
  
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
