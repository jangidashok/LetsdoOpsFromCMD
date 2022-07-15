#!/bin/bash
while :
do
if ! pgrep -f "node h323receptor_new.js" > /dev/null
then
     cd /home/ubuntu/REL/H323/h323/
     pkill -9 node
     nohup node h323receptor_new.js >> 323_log &
     #nohup node h323receptor_new.js >/dev/null 2>&1 &
    fi
sleep 1
if ! pgrep -f "/usr/local/bin/drachtio --daemon" > /dev/null
then  
      ulimit -n 65000	
      service drachtio restart
      echo "Drachtio Restarted" >> /home/ubuntu/REL/restart_log &
    fi
sleep 1
done
