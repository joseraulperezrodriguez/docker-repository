#!/bin/bash

set -e

chown -R "$ZK_USER" "$ZK_DATA_DIR" "$ZK_DATA_LOG_DIR" "$ZK_LOG_DIR" "$ZK_CONF_DIR"

# modify the config file, just the first time
if [[ ! -f "$ZK_CONF_DIR/zoo.cfg" ]]; then
    CONFIG="$ZK_CONF_DIR/zoo.cfg"

    echo "clientPort=$ZK_PORT" >> "$CONFIG"
    echo "dataDir=$ZK_DATA_DIR" >> "$CONFIG"
    echo "dataLogDir=$ZK_DATA_LOG_DIR" >> "$CONFIG"

    for server in $ZK_SERVERS; do
        echo "$server" >> "$CONFIG"
    done

fi

exec "$@"
