DROP PROCEDURE IF EXISTS `sperp_get_components`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_components`(
	  IN Type_p			INTEGER
    , IN ProductId_p	BIGINT
)
BEGIN
	IF Type_p = 0 THEN	-- Products components
		SELECT
			  MS.`Id`			AS CategoryId
			, MS.`Code`			AS CategoryCode
			, MS.`Description`	AS CategoryDescription
			, CM.`Id`			AS ComponentId
			, CM.`Code`			AS ComponentCode
			, CM.`Description`	AS ComponentDescription
			, PC.`Quantity`
		FROM
			tberp_product_component PC
			INNER JOIN tberp_product CM ON
				CM.Id = PC.ComponentId
			INNER JOIN tberp_master MS ON
					MS.Type	= PC.Type
                AND MS.Id 	= CM.CategoryId
		WHERE
				PC.Type 		= Type_p
            AND PC.ProductId 	= ProductId_p;
	ELSE			-- Submaterial component
		SELECT
			  MS.`Id`			AS CategoryId
			, MS.`Code`			AS CategoryCode
			, MS.`Description`	AS CategoryDescription
			, CM.`Id`			AS ComponentId
			, CM.`Code`			AS ComponentCode
			, CM.`Description`	AS ComponentDescription
			, PC.`Quantity`
		FROM
			tberp_product_component PC
			INNER JOIN tberp_submaterial CM ON
				CM.Id = PC.ComponentId
			INNER JOIN tberp_master MS ON
					MS.Type	= PC.Type
                AND MS.Id 	= CM.CategoryId
		WHERE
				PC.Type 		= Type_p
            AND PC.ProductId 	= ProductId_p;
    END IF;
END$$
DELIMITER ;
