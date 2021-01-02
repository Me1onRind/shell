#!/bin/bash

cmd=$1
action=$2
mydocker_path="/root/my_config"

status=`systemctl status docker | grep Active | cut -d ' ' -f 5`
if [ ! "$status" == "active" ]; then
    systemctl start docker
fi

case $cmd in
    start)
        cd "${mydocker_path}/${action}" && docker-compose up -d
        ;;
    stop)
        cd "${mydocker_path}/${action}" && docker-compose down
        ;;
    restart)
        cd "${mydocker_path}/${action}" && docker-compose restart
        ;;
    stop_all)
        docker ps -aq | xargs docker stop
        docker ps -aq | xargs docker rm
        systemctl stop docker
        ;;
    *)
        echo "start|stop|restart [name]   operation docker module"
        echo "stop_all                    stop and remove all container, systemctl stop docker"
        ;;
esac
