#!/bin/bash

action=$2
process_name=$1

case $process_name in
    mysql)
        if [ "$action" == "start" ]; then
            mysqld_safe --defaults-file=/etc/my.cnf --user=mysql &
        elif [ "$action" == "stop" ]; then
            mysqladmin -uroot -pguapi123 shutdown
        else
            echo "stupid"
        fi
        ;;
    *)
        echo "mysql [start|stop|restart]"
        ;;
esac
