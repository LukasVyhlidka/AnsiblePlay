#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
count=10

case "$1" in
start)
    for i in $(seq 1 $count); do docker run --name ubuntu${i} -v ${DIR}/.ssh:/root/.ssh -tdi ubuntu-sshd; done
    ;;
stop)
    for i in $(seq 1 $count); do docker rm -f ubuntu${i}; done
    ;;
ips)
    for i in $(seq 1 $count); do docker inspect -f "{{ .NetworkSettings.IPAddress }}" ubuntu${i}; done
    ;;
*)
    echo "Usage: ./hosts.sh {start|stop|ips}"
    exit 1
    ;;
esac

exit 0
