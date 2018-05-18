#!/bin/bash


Start()
{
	/root/.virtualenvs/py3/bin/uwsgi --ini /mnt/hgfs/centos_share/python/auto_python/other_peaple/self/workSearch/script/uwsgi.ini &
}

Stop()
{
	/usr/sbin/lsof -i:9000 |awk 'NR!=1{print $2}' |xargs  kill -9	>>/dev/null
}

Restart()
{
	Stop
	Start
}

case $1 in
	start) Start ;;
	stop) Stop;;
	restart) Restart;;
	*) echo "please write start|stop|restart"
esac
