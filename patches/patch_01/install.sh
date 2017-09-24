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
	mysql --user=$1 --password=$2 --host=$3 $4  < menu_options.sql

	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_country.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_address.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_contact.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_customer_address.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_customer_contact.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_customer.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_master.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_product_component.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_product.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_provider_address.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_provider_contact.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_provider.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_quotation.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_range.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < tberp_submaterial.sql

	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_address.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_component.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_contact.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_customer.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_master.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_product.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_provider.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_quotation.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_range.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_delete_submaterial.sql

	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_addresses.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_component_list.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_components.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_contacts.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_custumers.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_masters.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_products.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_providers.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_quotations.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_quotation_submaterial.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_ranges.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_get_submaterials.sql

	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_address.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_component.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_contact.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_customer.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_master.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_product.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_provider.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_quotation.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_range.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_insert_submaterial.sql

	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_address.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_component.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_contact.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_customer.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_master.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_product.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_provider.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_quotation.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_range.sql
	mysql --user=$1 --password=$2 --host=$3 $4  < sperp_update_submaterial.sql

	exit 0
}

# Default varables values
DB_USER_NAME="sunny_root"
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



