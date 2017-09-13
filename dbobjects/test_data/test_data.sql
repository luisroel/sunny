SET @Msg = '';
CALL sperp_insert_customer('Code_01', 'Customer 01', '7817878780', '8797979987', '', '', 
							'Line Addres 1-01', 'Line Address 2-01', 'Line Address 3-01', '56722', 'Tijuana', 'Bc', 1, 
                            '', '', 'First Name 01', '', 'Last Name 01', 'Surname 01', 'user_01@domain.ext', '', '', '',
                            1, @Msg);

CALL sperp_insert_customer('Code_02', 'Customer 02', '7817878780', '8797979987', '', '', 
							'Line Addres 1-02', 'Line Address 2-02', 'Line Address 3-02', '56722', 'Tijuana', 'Bc', 1, 
                            '', '', 'First Name 02', '', 'Last Name 02', 'Surname 02', 'user_02@domain.ext', '', '', '',
                            1, @Msg);

CALL sperp_insert_customer('Code_03', 'Customer 03', '7817878780', '8797979987', '', '', 
							'Line Addres 1-03', 'Line Address 2-03', 'Line Address 3-03', '56722', 'Tijuana', 'Bc', 1, 
                            '', '', 'First Name 03', '', 'Last Name 03', 'Surname 03', 'user_03@domain.ext', '', '', '',
                            1, @Msg);