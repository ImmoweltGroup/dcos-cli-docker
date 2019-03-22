#!/usr/bin/env sh
set -eu

./dcos config set core.dcos_url "${DCOS_SERVER_URL?Environment variable has to be set to a DCOS server URL.}"
exec ./dcos "$@"
