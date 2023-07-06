#!/usr/bin/env bash

set -euo pipefail

if ! command -v hasura &>/dev/null; then
  echo "hasura command not found => https://hasura.io/docs/latest/hasura-cli/install-hasura-cli/"
  exit 1
fi

if [[ $# -ne 1 || ($1 != "account" && $1 != "loyalty" && $1 != "reset" && $1 != "remote" && $1 != "full") ]]; then
  printf "Usage: %s [account|loyalty|reset|remote|full]\n" "$0"
  exit 1
fi

readonly SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
readonly ROOT_DIR=$(dirname -- "${SCRIPT_DIR}")
readonly CLI_DIR="$ROOT_DIR/cli"
readonly HASURA_MAIN="$ROOT_DIR/cli/hasura-main"
readonly HASURA_REMOTE="$ROOT_DIR/cli/hasura-remote"

if [[ $1 == "reset" ]]; then
  rm -rf "$HASURA_MAIN/metadata" && rsync -avPh --delete "$CLI_DIR/blank-metadata/" "$HASURA_MAIN/metadata/"
  rm -rf "$HASURA_REMOTE/metadata" && rsync -avPh --delete "$CLI_DIR/blank-metadata/" "$HASURA_REMOTE/metadata/"
  cd "$HASURA_MAIN" && hasura metadata apply
  cd "$HASURA_REMOTE" && hasura metadata apply
elif [[ $1 == "account" ]]; then
  rm -rf "$HASURA_MAIN/metadata" && rsync -avPh --delete "$HASURA_MAIN/account-metadata/" "$HASURA_MAIN/metadata/"
  cd "$HASURA_MAIN" && hasura metadata apply
elif [[ $1 == "loyalty" ]]; then
  rsync -avPh "$HASURA_MAIN/loyalty-metadata/" "$HASURA_MAIN/metadata"
  cd "$HASURA_MAIN" && hasura metadata apply
elif [[ $1 == "remote" ]]; then
  rsync -avPh "$HASURA_REMOTE/remote-schema-metadata/" "$HASURA_REMOTE/metadata"
  cd "$HASURA_REMOTE" && hasura metadata apply
  sleep 1
  rsync -avPh "$HASURA_MAIN/remote-schema-metadata/" "$HASURA_MAIN/metadata"
  cd "$HASURA_MAIN" && hasura metadata apply
  cd "$HASURA_MAIN" && hasura metadata reload

elif [[ $1 == "full" ]]; then
  rm -rf "$HASURA_MAIN/metadata" && rsync -avPh --delete "$CLI_DIR/blank-metadata/" "$HASURA_MAIN/metadata/"
  rm -rf "$HASURA_REMOTE/metadata" && rsync -avPh --delete "$CLI_DIR/blank-metadata/" "$HASURA_REMOTE/metadata/"
  rsync -avPh --delete "$HASURA_MAIN/account-metadata/" "$HASURA_MAIN/metadata/"
  rsync -avPh "$HASURA_MAIN/loyalty-metadata/" "$HASURA_MAIN/metadata"
  rsync -avPh "$HASURA_REMOTE/remote-schema-metadata/" "$HASURA_REMOTE/metadata"
  cd "$HASURA_REMOTE" && hasura metadata apply

  sleep 1
  rsync -avPh "$HASURA_MAIN/remote-schema-metadata/" "$HASURA_MAIN/metadata"
  cd "$HASURA_MAIN" && hasura metadata apply
  cd "$HASURA_MAIN" && hasura metadata reload
fi
