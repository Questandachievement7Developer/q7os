#!/bin/bash
exit
pacman -S xosd --needed --noconfirm

cpumax=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
cpumin=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq)
cpumax=$(( $cpumax / 1000 ))
cpumin=$(( $cpumin / 1000 ))
cpufreq=3300
CPU=1
while true ; do
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}')
echo $CPU learned cpu pattern
sleep 3
#CPU=90.124125
echo $CPU
if [ $CPU \> 27 ]
then
echo Boosting clock speed $cpufreq
cpufreq=$(( $cpufreq + 100 ))
if [ $cpufreq == $cpumax ]; then
cpufreq=$cpumax
sleep 2
fi

if [ $CPU \> 50 ]
then
echo Boost Zero latency mode enabled
cpupower frequency-set -g performance
cpupower frequency-set -d ${cpumax}MHz
echo -1 > /proc/sys/kernel/sched_rr_timeslice_ms
echo -1 > /proc/sys/kernel/sched_rt_runtime_us
sudo sh -c 'echo 0 > /proc/sys/vm/swappiness'

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "[cpugear] : Zero latency mode enabled (this mode enabled due to the recent activity patterns) $CPU $cpumax MHz" | osd_cat -p top -A left
echo "Please Decrease your system workload because zero latency mode will Drain battery quickly" | osd_cat -p top -A left
sleep 0.2
done

killall -KILL conky
else
echo Standard Control mode enabled
cpupower frequency-set -g powersave
cpupower frequency-set -d ${cpumin}MHz
echo 100 > /proc/sys/kernel/sched_rr_timeslice_ms
sudo sh -c 'echo 100 > /proc/sys/vm/swappiness'
fi

cpupower frequency-set -u ${cpufreq}MHz
else
echo [cpugear] Powersaving mode enabled | osd_cat -c green -A left -p top
echo Lowering Clockspeed $cpufreq
cpufreq=$(( $cpufreq - 100 ))
if [ $cpufreq == $cpumin ]; then
cpufreq=$cpumin
sleep 4
fi
cpupower frequency-set -u ${cpufreq}MHz
cpupower frequency-set -d ${cpufreq}MHz
fi
done
