DROP TABLE IF EXISTS `tberp_product_component`;
CREATE TABLE `tberp_product_component` (
  `Type`		integer NOT NULL,
  `ProductId`   bigint(20) NOT NULL,
  `ComponentId`	bigint(20) NOT NULL,
  `Quantity`	float NOT NULL,
  
  `EntryDate`	datetime,
  `EntryUserId`	bigint(20),
  `ModDate`		datetime,
  `ModUserId`	bigint(20),
  PRIMARY KEY (`Type`, `ProductId`, `ComponentId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_product_component`;