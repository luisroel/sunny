DROP TABLE IF EXISTS `tberp_provider_contact`;
CREATE TABLE `tberp_provider_contact` (
  `ContactId` bigint(20) NOT NULL,
  `ProviderId` bigint(20) NOT NULL,
  PRIMARY KEY (`ContactId`, `ProviderId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_provider_contact`;