#! /usr/bin/env bash

# Exit on any error, undefined variable, or pipe failure
set -euo pipefail

readonly PG_HOST="localhost"
readonly PG_USER="postgres"
export PGPASSWORD=postgrespassword

# Check if the required commands exist
if ! command -v pg_dump &> /dev/null ; then
  echo "Error: The pg_dump command is required to run this script. Please ensure that it is installed and available in your system's PATH."
  exit 1
fi

if ! command -v dropdb &> /dev/null ; then
  echo "Error: The dropdb command is required to run this script. Please ensure that it is installed and available in your system's PATH."
  exit 1
fi

if ! command -v createdb &> /dev/null ; then
  echo "Error: The createdb command is required to run this script. Please ensure that it is installed and available in your system's PATH."
  exit 1
fi

readonly SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
readonly ROOT_DIR=$( dirname -- "${SCRIPT_DIR}" )

cd $ROOT_DIR

# Restore main DB
echo "Restoring main DB from ${ROOT_DIR}/docker/data/postgres-main/scripts/2-import.sql"
dropdb -h "${PG_HOST}" -p 5433 -U "${PG_USER}" postgres || true # ignore error if DB doesn't exist
createdb -h "${PG_HOST}" -p 5433 -U "${PG_USER}" postgres
psql -h "${PG_HOST}" -p 5433 -U "${PG_USER}" -d postgres -f "${ROOT_DIR}/docker/data/postgres-main/scripts/2-import.sql"

# Restore loyalty DB
echo "Restoring loyalty DB from ${ROOT_DIR}/docker/data/postgres-secondary/scripts/2-import.sql"
dropdb -h "${PG_HOST}" -p 5434 -U "${PG_USER}" postgres || true # ignore error if DB doesn't exist
createdb -h "${PG_HOST}" -p 5434 -U "${PG_USER}" postgres
psql -h "${PG_HOST}" -p 5434 -U "${PG_USER}" -d postgres -f "${ROOT_DIR}/docker/data/postgres-secondary/scripts/2-import.sql"

# Check if the restores succeeded
if [ $? -eq 0 ]; then
  echo "Database restores completed successfully."
  exit 0
else
  echo "Error: Failed to restore databases."
  exit 1
fi


