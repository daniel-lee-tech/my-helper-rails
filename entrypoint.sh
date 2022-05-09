#!/bin/sh
set -env

# remove a potentially pre-existing server.pid for rails
rm -rf /app/tmp/pids/server.pid

# then exec the container's main process (CMD in Dockerfile)
exec "$@"