#!/bin/bash
set -e

# Run the original WordPress entrypoint
docker-entrypoint.sh "$@" &

# Wait for MySQL to be ready before running our setup script
echo "Waiting for MySQL to be available..."
sleep 10

# Run our setup script
/usr/local/bin/wordpress-setup.sh

# Wait for the background process
wait $!