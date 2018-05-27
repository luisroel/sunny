drop table if exists tberp_documents;
create table `tberp_documents` (
	  `id`			bigint not null auto_increment
	, `name` 		varchar(100) default null
	, `description`	varchar(255) default ''

	, `entrydate`	datetime,
	, `entryuserid`	bigint(20),
	, `moddate`		datetime,
	, `moduserid`	bigint(20),

	primary key (`id`)
) engine=innodb auto_increment=1 default CHARSET=latin1;

truncate table tberp_documents;