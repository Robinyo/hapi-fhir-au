#!/bin/bash

set -e

# Create the extension
psql -U "$POSTGRES_USER" -c 'CREATE EXTENSION pg_tde;'

# Enable pg_tde by default
psql -U "$POSTGRES_USER" -d template1 -c 'CREATE EXTENSION pg_tde;'
