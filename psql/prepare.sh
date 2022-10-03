#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER fluent WITH PASSWORD 'admin';
    CREATE DATABASE fluentbit;
    GRANT ALL PRIVILEGES ON DATABASE fluentbit TO fluent;
    \c fluentbit
    set role fluent;
    CREATE TABLE log
            (
                tag varchar,
                time timestamp,
                data jsonb
            );
EOSQL
