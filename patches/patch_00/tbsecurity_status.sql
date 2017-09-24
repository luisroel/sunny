DROP TABLE IF EXISTS `tbsecurity_status`;
CREATE TABLE `tbsecurity_status` (
  `StatusId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`StatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

TRUNCATE TABLE tbsecurity_status;

INSERT INTO `tbsecurity_status` (`Status`) VALUES ('Inactive'), ('Active'), ('All');