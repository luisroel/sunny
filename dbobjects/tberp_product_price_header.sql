DROP TABLE IF EXISTS `tberp_product_price_header`;
CREATE TABLE `tberp_product_price_header` (
  `HeaderId`    bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId`	bigint(20) NOT NULL,
  `StartDate`   datetime DEFAULT NULL,  
  `EndDate`     datetime DEFAULT NULL,
  
  `EntryDate` 	datetime,
  `EntryUserId` bigint(20),
  `ModDate`     datetime,
  `ModUserId` 	bigint(20),
  
  PRIMARY KEY (`HeaderId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

