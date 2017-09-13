DROP TABLE IF EXISTS `tberp_provider_address`;
CREATE TABLE `tberp_provider_address` (
  `AddressId` bigint(20) NOT NULL ,
  `ProviderId` bigint(20) NOT NULL,
  PRIMARY KEY (`AddressId`, `ProviderId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

