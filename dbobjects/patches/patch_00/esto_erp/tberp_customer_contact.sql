DROP TABLE IF EXISTS `tberp_customer_contact`;
CREATE TABLE `tberp_customer_contact` (
  `ContactId` bigint(20) NOT NULL,
  `CustomerId` bigint(20) NOT NULL,
  PRIMARY KEY (`ContactId`, `CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

