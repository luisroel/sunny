DROP TABLE IF EXISTS `tberp_customer_address`;
CREATE TABLE `tberp_customer_address` (
  `AddressId` bigint(20) NOT NULL ,
  `CustomerId` bigint(20) NOT NULL,
  PRIMARY KEY (`AddressId`, `CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

