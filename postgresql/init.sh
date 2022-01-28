#!/bin/bash
set -e
export PGPASSWORD="$POSTGRESQL_PASSWORD"

psql -U postgres -c 'CREATE USER farbooking WITH PASSWORD '\'$POSTGRESQL_FB_PASSWORD\'';'
psql -U postgres -c 'CREATE USER farnotifier WITH PASSWORD '\'$POSTGRESQL_FN_PASSWORD\'';'

psql -v ON_ERROR_STOP=1 -U postgres  <<-EOSQL
    CREATE DATABASE farbooking;
    CREATE DATABASE farnotifier;
    GRANT ALL PRIVILEGES ON DATABASE farbooking TO farbooking;
    GRANT ALL PRIVILEGES ON DATABASE farnotifier TO farnotifier;
EOSQL
