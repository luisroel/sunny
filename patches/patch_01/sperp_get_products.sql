DROP PROCEDURE IF EXISTS `sperp_get_products`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_products`()
BEGIN
	SELECT
		  PR.`Id`
		, PR.`IsActive`
		, PR.`Code`
        , PR.`Description`
        , PR.`Weight`
        , PR.`Color`
        , PR.`Width`
        , PR.`Height`
        , PR.`Large`
        , PR.`MinStock`
        , PR.`MaxStock`
        , PR.`CategoryId`
        , MS.`Code` 		AS `CategoryCode`
        , MS.`Description`	AS `Category`
        , PR.`Notes`
    FROM
		tberp_product PR
		INNER JOIN tberp_master MS ON
			MS.Id = PR.CategoryId;
END$$
DELIMITER ;
