#!/usr/bin/bash
key=$1
mysql -uroot -e "show slave status\G"|grep "${key}"|awk '{print $NF}'
