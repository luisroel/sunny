DROP PROCEDURE IF EXISTS `sperp_get_submaterials`;
DELIMITER $$
CREATE PROCEDURE `sperp_get_submaterials`()
BEGIN
	SELECT
		  SM.`Id`
		, SM.`IsActive`
		, SM.`Code`
        , SM.`Description`
        , SM.`Weight`
        , SM.`MinStock`
        , SM.`MaxStock`
        , SM.`UOMId`
        , MU.`Code` 		AS `UOMCode`
        , MU.`Description`	AS `UOM`
        , SM.`CategoryId`
        , MS.`Code` 		AS `CategoryCode`
        , MS.`Description`	AS `Category`
        , SM.`Notes`
    FROM
		tberp_submaterial SM
        INNER JOIN tberp_master MU ON
            MU.Id = SM.UOMId
		INNER JOIN tberp_master MS ON
			MS.Id = SM.CategoryId;
END$$
DELIMITER ;
