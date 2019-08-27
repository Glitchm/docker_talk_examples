#!/bin/bash

set -e
set -u

function create_user_and_database() {
	sqlplus -s SYSTEM/oracle <<-EOSQL
	    CREATE USER user1 IDENTIFIED BY "Password1";
	    GRANT ALL PRIVILEGES ON DATABASE user1 TO user1;
		\c user1;
		CREATE SCHEMA schema1;


		CREATE ROLE user2 WITH LOGIN PASSWORD 'Password1';   
		ALTER SCHEMA schema1 OWNER TO user2;

		CREATE ROLE app_role;
		GRANT USAGE ON SCHEMA schema1 TO app_role; 

		ALTER DEFAULT PRIVILEGES IN SCHEMA schema1
		GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_role;

		ALTER DEFAULT PRIVILEGES IN SCHEMA schema1
		GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO app_role;


		GRANT app_role TO user2



EOSQL
}
create_user_and_database