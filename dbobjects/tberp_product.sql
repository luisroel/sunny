DROP TABLE IF EXISTS `tberp_product`;
CREATE TABLE `tberp_product` (
  `ProductId`     bigint(20) NOT NULL AUTO_INCREMENT,
  `Code`          varchar(10) DEFAULT NULL,  
  `Name`          varchar(100) DEFAULT NULL,
  `CategoryId`    bigint(20) NOT NULL,
  `Weight`        int(20) DEFAULT NULL,
  `Color`         varchar(20) DEFAULT NULL,
  `Width`         int(20) DEFAULT NULL,  
  `Height`        int(20) DEFAULT NULL,
  `Large`         varchar(100) DEFAULT NULL,
  `MinimumStock`  int DEFAULT NULL,
  `Notes`         varchar(255) DEFAULT NULL,
  
  `EntryDate` 	  datetime,
  `EntryUserId`   bigint(20),
  `ModDate`       datetime,
  `ModUserId` 	  bigint(20),
  
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

