#
#  sunny erp system patch installation
#
do_help() {
	echo "Usage:"
	echo "        $0 [options]"
	echo ""
	echo "Options: "
	echo " -h | -help | --help : show this message."
	echo " -u <dbusername>     : user name to be used in database connection." 
	echo " -p <password>       : user password to be used in database connection."
	echo " -db <database name> : name of the database where the patch is going to be aplied."
	echo " -s <server name>    : nameserver where database is running."
	exit $1
}

# $1 database user
# $2 database password
# $3 database server name
# $4 database name
do_update() {
	mysql --user=$1 --password=$2 --host=$3 < create_db.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  grant_privileges.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_status.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_user.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_role.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_menu.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_module.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_rolemodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_usermodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  tbsecurity_userrole.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_apply_userrole.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_delete_menu.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_delete_module.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_delete_rolemodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_delete_role.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_delete_usermodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_delete_user.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_assignedroles.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_availableroles.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_menulist.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_modulelist.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_rolelist.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_rolemodulelist.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_statuslist.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_userlist.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_usermodulelist.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_userrights.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_get_user.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_insert_menu.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_insert_module.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_insert_rolemodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_insert_role.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_insert_usermodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_insert_user.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_update_menu.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_update_module.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_update_rolemodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_update_role.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_update_usermodule.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  spsecurity_update_user.sql
	mysql --user=$1 --password=$2 --host=$3 $4 <  vwsecurity_get_userrights.sql

	exit 0
}


# Default varables values
DB_USER_NAME="root"
DB_USER_PASS="s3cr3t"
DB_NAME="sunny_prod_db"
SERVER_NAME="localhost"

state=0
for arg in "$@"; do
	case $state in
		0)
			case $arg in
				--help|-h|help)
					do_help 0
				;;
				-u)
					state=1
				;;
				-p)
					state=2
				;;
				-s)
					state=3
				;;
				-db)
					state=4
				;;
				*)
					echo "Error: command line option error."
					do_help 1
				;;
			esac
		;;
		1)
			if [ ! -z "$arg" ]; then
				DB_USER_NAME="$arg"
				state=0
			else
				echo "Error: username not especified."
				do_help 1
			fi
		;;
		2)
			if [ ! -z "$arg" ]; then
				DB_USER_PASS="$arg"
				state=0
			else
				echo "Error: user password not especified."
				do_help 1
			fi
		;;
		3)
			if [ ! -z "$arg" ]; then
				SERVER_NAME="$arg"
				state=0
			else
				echo "Error: server name not especified."
				do_help 1
			fi
		;;
		4)
			if [ ! -z "$arg" ]; then
				DB_NAME="$arg"
				state=0
			else
				echo "Error: database name not especified."
				do_help 1
			fi
		;;
		*)
			echo "Parser error!"
			do_help 1
		;;
	esac
done

do_update $DB_USER_NAME $DB_USER_PASS $SERVER_NAME $DB_NAME