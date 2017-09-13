DROP TABLE IF EXISTS `tberp_product_price_detail`;
CREATE TABLE `tberp_product_price_detail` (
  `DetailId`    bigint(20) NOT NULL AUTO_INCREMENT,
  `HeaderId`    bigint(20) NOT NULL,
  `From`   		int(20) DEFAULT NULL,  
  `To`     		int(20) DEFAULT NULL,
  `Price`		float(20) DEFAULT NULL,
  
  PRIMARY KEY (`DetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

