#!/usr/bin/bash
domain=fpm.oldxu.net
path=/fpm_status

case $1 in
    accepted_conn)
        curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/accepted conn:/{print $NF}'
        ;;
    listen_queue)
    	curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/^listen queue:/{print $NF}'
        ;;
    max_listen_queue)
        curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/^max listen queue:/{print $NF}'
        ;;
    active_processes)
    	curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/^active processes:/{print $NF}'	
        ;;
    idle_processes)
    	curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/^idle processes:/{print $NF}'
        ;;
    total_processes)
        curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/^total processes:/{print $NF}'
        ;;
    max_active_processes)
        curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/^max active processes:/{print $NF}'
        ;;
    max_children_reached)
        curl -sH host:${domain} http://127.0.0.1:80${path} | awk '/^max children reached:/{print $NF}'
        ;;
    *)
    echo "USAGE: $0 [ accepted_conn|listen_queue|max_listen_queue|active_processes|idle_processes|total_processes|max_active_processes|max_children_reached ]"
    ;;
esac
