DROP TABLE IF EXISTS `tberp_range`;
CREATE TABLE `tberp_range` (
  `Id`		bigint(20) NOT NULL AUTO_INCREMENT,
  `Type`	int DEFAULT NULL,
  `ItemKey`	bigint(20) DEFAULT NULL,
  `From`	float DEFAULT NULL,
  `To`		float DEFAULT NULL,
  `Amount`	float DEFAULT NULL,
  
  `EntryDate`	datetime,
  `EntryUserId`	bigint(20),
  `ModDate`		datetime,
  `ModUserId`	bigint(20),
  
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_range`;