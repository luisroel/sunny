DROP TABLE IF EXISTS `tberp_quotation`;
CREATE TABLE `tberp_quotation` (
  `Id`				bigint(20) NOT NULL AUTO_INCREMENT,
  `ProviderId`		bigint(20) DEFAULT NULL,
  `SubmaterialId`	bigint(20) DEFAULT NULL,
  `ProviderCode`	varchar(20) DEFAULT NULL,  
  `LeadTime`		int DEFAULT NULL,
  `AdditionalCost`	float DEFAULT NULL,
  `From`			datetime DEFAULT NULL,
  `To`				datetime DEFAULT NULL,
  `Notes`			VARCHAR(255) DEFAULT NULL,

  `EntryDate`		datetime DEFAULT NULL,
  `EntryUserId`		bigint(20) DEFAULT NULL,
  `ModDate`			datetime DEFAULT NULL,
  `ModUserId`		bigint(20) DEFAULT NULL,
  
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_quotation`;