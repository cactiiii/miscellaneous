#!/usr/bin/bash

function getIp(){
    IFS=$' \t'
    ifStr=`ifconfig | grep inet`
    ipStrs=`echo $ifStr | awk -F $' ' '{print $2;}'`
    IFS=$' \t\n'
    for ipStr in $ipStrs; do
        if [ $ipStr != '' ] && [[ $ipStr != '127.*' ]]; then
            echo $ipStr
            break
        fi
    done
}

ip="10.18.15.19"
export PS1="[\u@$ip:\w]$ "

alias vi="vim -u /PATH/TO/YOUR/vimrc"
