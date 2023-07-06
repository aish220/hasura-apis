#! /usr/bin/env bash

# Exit on any error, undefined variable, or pipe failure
set -euo pipefail

# Check if the pg_dump command exists
if ! command -v pg_dump &> /dev/null; then
  echo "Error: The pg_dump command is required to run this script. Please ensure that it is installed and available in your system's PATH."
  exit 1
fi

readonly SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
readonly ROOT_DIR=$( dirname -- "${SCRIPT_DIR}" )

cd $ROOT_DIR
echo "Dumping main DB to ${ROOT_DIR}/docker/data/postgres-main/scripts/2-import.sql"
pg_dump postgres://postgres:postgrespassword@localhost:5433/postgres > docker/data/postgres-main/scripts/2-import.sql
echo "Dumping loyalty DB to ${ROOT_DIR}/docker/data/postgres-secondary/scripts/2-import.sql"
pg_dump postgres://postgres:postgrespassword@localhost:5434/postgres > docker/data/postgres-secondary/scripts/2-import.sql

# Check if the pg_dump command succeeded
if [ $? -eq 0 ]; then
  echo "Database dumps completed successfully."
  exit 0
else
  echo "Error: Failed to dump databases."
  exit 1
fi