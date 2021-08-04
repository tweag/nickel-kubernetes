#! /usr/bin/env bash

set -euo pipefail

# Attempt to determine script location on disk
{
  SCRIPT_DIR=$(dirname "$(readlink -f $0)")
} || {
  echo "Script was unable to locate its location on disk,"
  echo "Assuming current working directory."
  SCRIPT_DIR="."
}

command -v nix >/dev/null 2>&1 || {
  echo >&2 "'nix' is required but it's not found.  Aborting."; exit 1;
}

trap "rm -rf ${SCRIPT_DIR}/../result" SIGINT SIGTERM EXIT
cd "${SCRIPT_DIR}/.." && nix build && {
  cp -rf "${SCRIPT_DIR}/../result/kubernetes"/* ./kubernetes/
  cp -rf "${SCRIPT_DIR}/../result/argo_workflows"/* ./argo-workflows/
}
