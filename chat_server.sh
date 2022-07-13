#! /bin/sh

currentDirectory=`pwd`

chatServerBasicSetup(){
    cd ${currentDirectory}/src
    sudo mkdir -p logs
    cd -
}

startChatServer() {
    cd ${currentDirectory}/src
    node index.js >/dev/null 2>&1 < /dev/null &
}


stopChatServer() {
    kill -15 `pgrep -f node`
}

restartChatServer() {
    stopChatServer
    startChatServer
}

chatServerBasicSetup

case "$1" in
    --start)
        echo –n "Starting Chat Server"
        startChatServer
        ;;
   --stop) 
        echo –n "Exiting Chat Server"
        stopChatServer
        ;;
   --restart)
        echo –n "Restarting  Chat Server"
        restartChatServer
        ;;
esac

