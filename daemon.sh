#!/usr/bin/bash

exec 1>>log/daemon_log
exec 2>&1

PID_FNAME=".daemon_pid"
BIN="bash PATHTOSCRIPT ${*:2}"            #将本脚本的命令之后的参数也传给PATHTOSCRIPT
DSCP="XXXXXXXXXXXXXXXXXXXXXX"

function get_pid() {
    if ! [ -e $PID_FNAME ]; then
        echo ""
    else
        pid=`cat $PID_FNAME`
        echo $pid
    fi
}

if [ $# -lt 1 ]; then
    echo "missing param, usage $0 [start|stop|status|check]"
    exit 1
fi

case $1 in
    start)
        pid=`get_pid`
        if ! [ "$pid" = "" ]; then
            pid_info=`ps --no-headers -p $pid`
            if ! [ "$pid_info" = "" ]; then
                echo failed, process already exists, pid is $pid
                exit 1
            fi
        fi
        echo starting
        nohup $BIN &>/dev/null &
        ch_pid=$!
        if [ "$ch_pid" != "" ]; then
            echo succeed, pid is $ch_pid
            echo $ch_pid > $PID_FNAME
        else
            echo failed, unknown reason
            echo > $PID_FNAME
        fi
    ;;
    status)
        pid=`get_pid`
        if [ "$pid" != "" ]; then
            pid_info=`ps --no-headers -p $pid`
            if [ "$pid_info" != "" ]; then
                echo process is running, pid is $pid
                exit 0
            fi
        fi
        echo process not exist
    ;;
    stop)
        pid=`get_pid`
        if [ "$pid" != "" ]; then
            pid_info=`ps --no-headers -p $pid`
            if [ "$pid_info" == "" ]; then
                echo process not exist, aborting
                exit 0
            fi
        else
            echo process not exist, aborting
            exit 0
        fi
        kill -9 $pid
        pid_info=`ps --no-headers -p $pid`
        if [ "$pid_info" != "" ]; then
            echo stop failed
        else
            echo stop success
        fi
    ;;
    check)
        pid=`get_pid`
        if [ "$pid" != "" ]; then
            pid_info=`ps --no-headers -p $pid`
            if [ "$pid_info" != "" ]; then
                echo process is running, pid is $pid
                exit 0
            fi
        fi
        echo process not exist, trying to restart
        nohup $BIN &>/dev/null &
        ch_pid=$!
        if [ "$ch_pid" != "" ]; then
            echo succeed, pid is $ch_pid
            echo $ch_pid > $PID_FNAME
            #SEND ALERT
        else
            echo failed, unknown reason
            #SEND ALERT
            echo > $PID_FNAME
        fi
    ;;
    *)
        echo "wrong command, usage $0 [start|stop|status|check]"
        exit 1
    ;;
esac
