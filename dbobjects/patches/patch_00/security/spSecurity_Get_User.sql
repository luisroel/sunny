DELIMITER $$
CREATE  PROCEDURE `spSecurity_Get_User`(
	  IN Username_p VARCHAR(35)
	, IN Password_p	VARCHAR(35)
)
BEGIN
	SELECT
		  U1.*
        , U2.UserName AS 'EntryUser'
        , U2.UserName AS 'ModUser'
	FROM
		tbSecurity_User U1
        LEFT JOIN tbsecurity_user U2 ON
			U2.UserId = U1.EntryUserId
        LEFT JOIN tbsecurity_user U3 ON
			U3.UserId = U1.ModUserId		
	WHERE
			U1.Username = Username_p
        AND U1.Password = Password_p;
END$$
DELIMITER ;
