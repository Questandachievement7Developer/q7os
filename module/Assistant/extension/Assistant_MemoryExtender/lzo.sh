#!/bin/sh
### BEGIN INIT INFO
# Provides:          zram
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     S
# Default-Stop:      0 1 6
# Short-Description: Use compressed RAM as in-memory swap
# Description:       Use compressed RAM as in-memory swap
### END INIT INFO

# Author: Antonio Galea <antonio.galea@gmail.com>
# Thanks to Przemysław Tomczyk for suggesting swapoff parallelization
# Distributed under the GPL version 3 or above, see terms at
#      https://gnu.org/licenses/gpl-3.0.txt
A=$(pwd)
mkdir memory
ln -s ${A}/memory /
file=/usr/bin/lzo.sh
if [ -f $file ] 
	then
		echo custom config exists
		exit
fi


FRACTION=100
sh -c 'echo 100 > /proc/sys/vm/swappiness'
MEMORY=`perl -ne'/^MemTotal:\s+(\d+)/ && print $1*1500;' < /proc/meminfo`
CPUS=`nproc`
SIZE=$(( MEMORY * FRACTION / 100 / CPUS * 10 ))
SIZEdisk=$(( MEMORY / 80 ))

case "$1" in
  "start")
    param=`modinfo zram|grep num_devices|cut -f2 -d:|tr -d ' '`
    modprobe zram $param=$CPUS
    for n in `seq $CPUS`; do
      i=$((n - 1))
      echo $SIZE > /sys/block/zram$i/disksize
      bash /Assistant/extension/Assistant_MemoryExtender/ext.sh $SIZEdisk
      mkswap /dev/zram$i
      swapon /dev/zram$i -p 100
      #dmesg | grep swap
    done
    ;;
  "stop")
    for n in `seq $CPUS`; do
      i=$((n - 1))
      swapoff /dev/zram$i && echo "disabled disk $n of $CPUS" &
      swapoff /memory/memcache
      bash /Assistant/extension/Assistant_MemoryExtender/btrfsextoff.sh /memory/memcache
      rm -rf /memory
      #swapoff -a
    done
    wait
    sleep .5
    modprobe -r zram
    ;;
  *)
    echo "Usage: `basename $0` (start | stop)"
    exit 1
    ;;
esac
