#!/usr/bin/bash
key=$1
Pass="oldxu.net"
redis-cli -p 6379 -a "${Pass}" info 2>/dev/null |grep "\<${key}\>" | awk -F ':' '{print $NF}'
