DROP TABLE IF EXISTS `tberp_measurement`;
CREATE TABLE `tberp_measurement` (
  `MeasurementId`   bigint(20) NOT NULL AUTO_INCREMENT,
  `Code`    	    varchar(5) NOT NULL,
  `Description`    	varchar(100) NOT NULL,  
  
  PRIMARY KEY (`MeasurementId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `tberp_measurement` (`Code`, `Description`) VALUES 
  ('CM', 'Centimeters')
, ('MT', 'Meters')
, ('IN', 'Inches')
, ('FT', 'Foots')
, ('YD', 'Yard')
, ('UN', 'Unit');
