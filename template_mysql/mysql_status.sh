#!/usr/bin/bash
key=$1
mysql -uroot -e "show global status" |grep "\<${key}\>" |awk '{print $2}'
