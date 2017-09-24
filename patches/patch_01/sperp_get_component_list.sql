DROP PROCEDURE IF EXISTS `sperp_get_component_list`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_component_list`(
	  IN Type_p 		INTEGER
    , IN CategoryId_p 	INTEGER
)
BEGIN
	IF Type_p = 0 THEN	-- Products components
		SELECT
			  PR.`Id`
			, PR.`Code`
			, PR.`Description`
		FROM
			tberp_product PR
		WHERE
			PR.CategoryId = CategoryId_p;
	ELSE			-- Submaterial component
		SELECT
			  SB.`Id`
			, SB.`Code`
			, SB.`Description`
		FROM
			tberp_submaterial SB
		WHERE
			SB.CategoryId = CategoryId_p;
    END IF;
END$$
DELIMITER ;
