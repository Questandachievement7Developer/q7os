#!/bin/bash
#idlecalculation
sleep 60
while true; do
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}')
CPU=$(echo ${CPU%\.*})
TIMEOUTDISP=$(( $CPU * 2 ))
TIMEOUT=$(( $CPU * 4 ))

echo $TIMEOUTDISP Seconds
echo $TIMEOUT seconds


cd /home
for i in * ; do
echo user $i
sudo -u $i gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout $TIMEOUT
sudo -u $i gsettings set org.gnome.desktop.session idle-delay $TIMEOUTDISP
done

sleep 300
done
