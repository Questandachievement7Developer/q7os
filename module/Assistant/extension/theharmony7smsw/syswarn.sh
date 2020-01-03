#!/bin/bash
sleep 30
while true ; do
for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
dmesg -l crit | osd_cat -p top -A left
sleep 1
dmesg | grep temp | osd_cat -p top -A left
sleep 1
dmesg | grep error | osd_cat -p top -A left
sleep 1
echo Current Time session $(date +%s) | osd_cat -p top -A left
done
sleep 60
done

