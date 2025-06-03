BEGIN;

-- See: https://github.com/percona/postgres/blob/TDE_REL_17_STABLE/contrib/pg_tde/t/001_basic.pl

\c template1
CREATE EXTENSION pg_tde;

\c hapi-fhir;
CREATE EXTENSION IF NOT EXISTS pg_tde;

-- psql:/docker-entrypoint-initdb.d/initdb.sql:9: FATAL:  pg_tde can only be loaded at server startup. Restart required.

SELECT pg_tde_add_database_key_provider_file('file-vault', '/tmp/pg_tde_test_001_basic.per');

SELECT pg_tde_set_key_using_database_key_provider('test-db-key', 'file-vault');

-- SELECT pg_tde_is_encrypted('hfj_resource');

COMMIT;