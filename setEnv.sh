#!/usr/bin/bash

function getIp(){
    IFS=$' \t'
    ifStr=`ifconfig | grep inet`
    ipStrs=`echo $ifStr | awk -F $' ' '{print $2;}'`
    IFS=$' \t\n'
    for ipStr in $ipStrs; do
        if [ "$ipStr" != '' ] && ! [[ $ipStr =~ 127.* ]] && ! [[ $ipStr =~ 172.* ]]; then
            echo $ipStr
            break
        fi
    done
}

ip=`getIp`
addr=`whoami`@$ip:`pwd`/$0
export PS1="[\u@$ip:\w]$ "

alias vim='vim -u "/data/kaicao/.vimck"  -N'
alias vi='vim'

