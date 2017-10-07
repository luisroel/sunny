DROP TABLE IF EXISTS `tberp_country`;
CREATE TABLE `tberp_country` (
  `Id` 			bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` 		varchar(3) DEFAULT NULL,  
  `CountryName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `tberp_country`;
--
-- Create country data
--
INSERT INTO tberp_country (`Code`, `CountryName`) VALUES ('MEX', 'Mexico'), ('USA', 'EEUA');