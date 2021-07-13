#! /usr/bin/env nix-shell
#! nix-shell -i bash -p coreutils nixfmt

set -euo pipefail

# Attempt to determine script location on disk
{
  SCRIPT_DIR=$(dirname "$(readlink -f $0)")
} || {
  echo "Script was unable to locate its location on disk,"
  echo "Assuming current working directory."
  SCRIPT_DIR="."
}

command -v nixfmt >/dev/null 2>&1 || {
  echo >&2 "'nixfmt' is required but it's not found.  Aborting."; exit 1;
}

NIX_FILES="$(find ${SCRIPT_DIR}/.. \
  -type f -a \
  \( -name '*.nix' \
  -a -not -wholename '*/result/*'\
)"

nixfmt -w 80 ${NIX_FILES}
