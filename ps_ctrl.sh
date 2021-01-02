#!/bin/bash

process_name=$1
action=$2

case $process_name in
    mysql)
        if [ "$action" == "start" ]; then
            mysqld_safe --defaults-file=/etc/my.cnf --user=root &
        elif [ "$action" == "stop" ]; then
            mysqladmin -uroot -pguapi123 shutdown
        elif [ "$action" == "restart" ]; then
            mysqld_safe --defaults-file=/etc/my.cnf --user=root &
            mysqladmin -uroot -pguapi123 shutdown
        else
            echo "stupid"
        fi
        ;;
    *)
        echo "mysql [start|stop|restart]"
        ;;
esac
