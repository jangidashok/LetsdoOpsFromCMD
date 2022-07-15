#!/bin/bash
while :
do
sleep 2
if ! pgrep -f "node main.js" > /dev/null
then
     pkill -9 node
     cd /home/ubuntu/P2_Scheduler/
     nohup node main.js >>sch_log &
     echo "Scheduler Restarted" >> /home/ubuntu/sch_log &
fi
sleep 2
done
