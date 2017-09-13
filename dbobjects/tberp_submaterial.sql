DROP TABLE IF EXISTS `tberp_submaterial`;
CREATE TABLE `tberp_submaterial` (
  `SubmaterailId`   bigint(20) NOT NULL AUTO_INCREMENT,
  `Code`    		varchar(20) NOT NULL,
  `Name`   			int(20) DEFAULT NULL,  
  `MinumumStock`    int(20) DEFAULT NULL,
  `MaximumStock`	int(20) DEFAULT NULL,
  `MeasureId`		bigint(20) DEFAULT NULL,
  `CategoryId` bigint(20) DEFAULT NULL,
  
  PRIMARY KEY (`SubmaterailId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

	