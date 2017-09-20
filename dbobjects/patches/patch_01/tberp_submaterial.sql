DROP TABLE IF EXISTS `tberp_submaterial`;
CREATE TABLE `tberp_submaterial` (
  `Id`   		bigint(20) NOT NULL AUTO_INCREMENT,
  `IsActive`	bit NOT NULL,
  `Code`    	varchar(20) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Weight` 		int(20) DEFAULT NULL,
  `MinStock`	int(20) DEFAULT NULL,
  `MaxStock`	int(20) DEFAULT NULL,
  `UOMId`		bigint(20) DEFAULT NULL,
  `CategoryId` 	bigint(20) DEFAULT NULL,
  `Notes`   	varchar(255) DEFAULT NULL,
  
  `EntryDate`	datetime,
  `EntryUserId`	bigint(20),
  `ModDate`		datetime,
  `ModUserId`	bigint(20),
  
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_submaterial`;