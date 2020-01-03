#!/bin/bash

cpucount=$(grep -c ^processor /proc/cpuinfo)

while true ;do
#lower all priority
a="a b c d e f g h i j k l m n o p q r s t u v w x y z"
for i in $a ; do for proc in $(pgrep $i) ;do chrt -a -p 10 $proc ;renice -n 20 -p $proc ; ionice -c 3 -p $proc; sleep 0.8 ; done ;done




#while true; do
sysctl -w kernel.softlockup_panic=1
sysctl -w kernel.perf_cpu_time_max_percent=100
#sysctl -w kernel.hardlockup_panic=1
sysctl -w fs.quota.syncs=0
sysctl -w kernel.ctrl-alt-del=1
sysctl -w kernel.ftrace_dump_on_oops=1
sysctl -w kernel.hardlockup_all_cpu_backtrace=1
sysctl -w kernel.traceoff_on_warning=1
sysctl -w kernel.version='Version 19'
echo -1 > /proc/sys/kernel/sched_rt_runtime_us
for blockdir in /sys/block/s* ;do echo deadline > $blockdir/queue/scheduler ; done
for proc in $(pgrep system_server) ;do chrt -a -p 99 $proc ;renice -n -20 -p $proc ; ionice -c 0 -p $proc ;sleep 0.1; done

for proc in $(pgrep earlyoom) ;do chrt -a -p 99 $proc ;renice -n -20 -p $proc ; ionice -c 0 -p $proc ;sleep 0.1; done
for proc in $(pgrep gnome) ;do chrt -a -p 99 $proc; renice -n -20 -p $proc ; ionice -c 0 -p $proc ;sleep 0.1; done
for proc in $(pgrep pulse) ;do chrt -a -p 99 $proc ; renice -n -20 -p $proc ; ionice -c 0 -p $proc ;sleep 0.1; done
for proc in $(pgrep x.org) ;do chrt -a -p 99 $proc ; renice -n -20 -p $proc ; ionice -c 0 -p $proc ;sleep 0.1; done
for proc in $(pgrep term) ;do chrt -a -p 99 $proc ;renice -n -20 -p $proc ; ionice -c 0 -p $proc ;sleep 0.1; done
for proc in $(pgrep modem) ;do chrt -a -p 99 $proc ;renice -n -20 -p $proc ; ionice -c 0 -p $proc ;sleep 0.1; done
sleep 600
done
