#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOSQL
    CREATE DATABASE diploma_development;
    CREATE DATABASE diploma_test;
    CREATE DATABASE diploma;
    GRANT ALL PRIVILEGES ON DATABASE postgres.* TO postgres;
EOSQL