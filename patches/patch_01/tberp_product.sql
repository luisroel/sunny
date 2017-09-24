DROP TABLE IF EXISTS `tberp_product`;
CREATE TABLE `tberp_product` (
  `Id`			bigint(20) NOT NULL AUTO_INCREMENT,
  `IsActive`	bit DEFAULT NULL,
  `Code`		varchar(20) DEFAULT NULL,  
  `Description`	varchar(100) DEFAULT NULL,
  `CategoryId`	bigint(20) NOT NULL,
  `Weight`		float DEFAULT NULL,
  `Color`		varchar(20) DEFAULT NULL,
  `Width`		float DEFAULT NULL,  
  `Height`		float DEFAULT NULL,
  `Large`		float DEFAULT NULL,
  `MinStock`	int DEFAULT NULL,
  `MaxStock`	int DEFAULT NULL,
  `Notes`		varchar(255) DEFAULT NULL,
  
  `EntryDate`	datetime,
  `EntryUserId`	bigint(20),
  `ModDate`		datetime,
  `ModUserId`	bigint(20),
  
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_product`;