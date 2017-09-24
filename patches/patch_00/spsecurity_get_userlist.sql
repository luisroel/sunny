DROP PROCEDURE IF EXISTS `spsecurity_get_userlist`;
DELIMITER $$
CREATE PROCEDURE `spsecurity_get_userlist`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT 
			  SU.UserId
			, SU.UserName
			, SU.Password
			, SU.IsActive
			, SU.EntryDate
			, SU.EntryUserId
			, U1.Username 	AS EntryUser
			, SU.ModDate
			, SU.ModUserId
			, U2.Username 	AS ModUser
		FROM 
			tbsecurity_user SU
			INNER JOIN tbsecurity_user U1 ON
				U1.UserId = SU.EntryUserId
			INNER JOIN tbsecurity_user U2 ON
				U2.UserId = SU.ModUserId;
	ELSE
		SELECT 
			  SU.UserId
			, SU.UserName
			, SU.Password
			, SU.IsActive
			, SU.EntryDate
			, SU.EntryUserId
			, U1.Username AS EntryUser
			, SU.ModDate
			, SU.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbsecurity_user SU
			INNER JOIN tbsecurity_user U1 ON
				U1.UserId = EntryUserId
			INNER JOIN tbsecurity_user U2 ON
				U2.UserId = SU.ModUserId
		WHERE 
			SU.IsActive = IsActive_p;
	END IF;
END$$
DELIMITER ;
