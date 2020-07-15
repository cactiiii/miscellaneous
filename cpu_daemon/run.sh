#!/usr/bin/bash

out_file="./data/`date +%Y%m%d%H%M`"
save_history=$[ 24 * 60 ]  #保存最近一天的数据

top -b -n1 | awk '/^%Cpu/{print $0}' > $out_file  #写入cpu usage
ps aux | head -n 1 >> $out_file   #写入header
ps aux | sort -nrk 3,3 | awk '{cmd="pwdx "$2; if ( (cmd | getline wd) > 0) {print $0"\t"wd} else {print $0"\tWD NOT FOUND"}close(cmd)};' >> $out_file

#cleaning

for f in `ls ./data | head -n -$save_history`; do
    rm ./data/$f
done
