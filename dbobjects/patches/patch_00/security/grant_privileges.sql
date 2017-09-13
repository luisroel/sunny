CREATE USER 'esto_usr'@'%' IDENTIFIED BY 'pa$$w0rd';
GRANT ALL PRIVILEGES ON esto_erp_db.* TO 'esto_usr'@'%';
GRANT SELECT ON mysql.proc TO 'esto_usr'@'%';
FLUSH PRIVILEGES;
