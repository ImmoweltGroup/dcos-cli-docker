#!/usr/bin/env sh
set -eu

./dcos cluster setup "${DCOS_SERVER_URL?Environment variable has to be set to a DCOS server URL.}"
exec ./dcos "$@"
