#!/bin/bash

set -e

chown -R "$SOLR_USER:$SOLR_USER" "$DCK_BASE"

# modify the config file, just the first time
if [[ ! -f "$SOLR_DATA/solr.cfg" ]]; then
    CONFIG="$SOLR_DATA/solr.cfg"

    echo "SOLR_PID_DIR=$SOLR_DATA" >> "$CONFIG"
    echo "SOLR_HOME=$SOLR_DATA/data" >> "$CONFIG"

    echo "LOG4J_PROPS=$SOLR_DATA/log4j2.xml" >> "$CONFIG"
    echo "SOLR_LOGS_DIR=$SOLR_LOG" >> "$CONFIG"

    echo "ZK_HOST=$ZK_HOSTS" >> "$CONFIG"
#    echo "ZK_HOST=192.168.173.2" >> "$CONFIG"

    echo "SOLR_HOST=$SOLR_HOST" >> "$CONFIG"

    cat "$CONFIG" >> "$SOLR_INCLUDE"	

fi

service solr start

while true; do sleep 1000; done
