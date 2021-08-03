#! /usr/bin/env nix-shell
#! nix-shell -i bash -p cargo coreutils nixfmt

set -euo pipefail

# Attempt to determine script location on disk
{
  SCRIPT_DIR=$(dirname "$(readlink -f $0)")
} || {
  echo "Script was unable to locate its location on disk,"
  echo "Assuming current working directory."
  SCRIPT_DIR="."
}

mkdir -p "${SCRIPT_DIR}"/../k8s-nickel

for filename in "${SCRIPT_DIR}"/../k8s-openapi-v2-specs/*.json; do
  cd "${SCRIPT_DIR}"/../gen-k8s-nickel && cargo run $filename > "${SCRIPT_DIR}"/../k8s-nickel/"$(basename $filename .json).ncl"
done
