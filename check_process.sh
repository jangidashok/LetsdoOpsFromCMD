#!/bin/bash
while :
do
if ! pgrep -f "node sip_controller.js" > /dev/null
then
     cd /home/ubuntu/REL/sip/
     ./fetch.sh &
     cd /home/ubuntu/REL
     pkill -9 node
     sleep .100
     nohup node sip_controller.js >> sip_log 2>&1 &
fi
    sleep .100
sleep 2
done

