#!/bin/bash
while :
do
if ! pgrep -f "node Recorder.js" > /dev/null
then
     cd /home/ubuntu/REL
     ./fetch.sh &
     pkill -9 node
     pkill -9 kurento
     sleep .100
     nohup node Recorder.js >> rec_log 2>&1 &
fi
    sleep .100
done
