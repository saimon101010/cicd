#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER fluent WITH PASSWORD 'admin';
    CREATE DATABASE fluentbit;
    GRANT ALL PRIVILEGES ON DATABASE fluentbit TO fluent;
EOSQL
