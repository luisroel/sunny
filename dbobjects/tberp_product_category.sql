DROP TABLE IF EXISTS `tberp_product_category`;
CREATE TABLE `tberp_product_category` (
  `CategoryId`   bigint(20) NOT NULL AUTO_INCREMENT,
  `Code`        varchar(10) DEFAULT NULL,  
  `Category`        varchar(100) DEFAULT NULL,
  
  `EntryDate` 	datetime,
  `EntryUserId` bigint(20),
  `ModDate`     datetime,
  `ModUserId` 	bigint(20),
  
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

