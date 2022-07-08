#!/bin/bash
while :
do
sleep 1
if ! pgrep -f "java -jar panasonic-ucc-*" > /dev/null
then
     cd /java-conf-server/
     ulimit -n 65000
     java -jar panasonic-ucc-* -Xms512M -Xmx3048M >> conf_log &
     sync; echo 3 > /proc/sys/vm/drop_caches
     echo "Java Restarted" >> /java-conf-server/restart_log &
fi
sleep 2
done
