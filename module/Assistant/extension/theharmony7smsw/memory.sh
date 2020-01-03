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
#duperemove -dr /home
#btrfs filesystem defragment -r -v -c zlib:9 /home
# Author: Antonio Galea <antonio.galea@gmail.com>
# Thanks to Przemysław Tomczyk for suggesting swapoff parallelization
# Distributed under the GPL version 3 or above, see terms at
#      https://gnu.org/licenses/gpl-3.0.txt
A=$(pwd)
bash /usr/bin/clockengine.sh &
sudo mkdir memory
sudo ln -s ${A}/memory /
echo 1 > /proc/sys/vm/hugepages_treat_as_movable
echo 10000 > /proc/sys/vm/min_free_kbytes
sysctl vm.dirty_background_bytes=100000; sysctl vm.dirty_background_ratio=100; sysctl vm.dirty_bytes=100000; sysctl vm.dirty_expire_centisecs=1000000; sysctl vm.dirty_ratio=100; sysctl vm.dirty_writeback_centisecs=150000; sysctl vm.dirtytime_expire_seconds=10000000
echo 1 > /proc/sys/vm/compact_memory
echo 0 > /proc/sys/vm/vfs_cache_pressure
sysctl -w vm.overcommit_ratio=0
sysctl -w vm.memory_failure_early_kill=1
sysctl -w vm.panic_on_oom=1
sysctl -w vm.extfrag_threshold=100000
sysctl -w vm.oom_kill_allocating_task=1
sysctl -w vm.admin_reserve_kbytes=10000
sysctl -w vm.dirty_expire_centisecs=1999000000

echo
#sysctl vm.zone_reclaim_mode=1
echo 1 > /proc/sys/vm/laptop_mode
FRACTION=100
sudo sh -c 'echo 100 > /proc/sys/vm/swappiness'
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
      bash ext.sh $SIZEdisk
      mkswap /dev/zram$i
      swapon /dev/zram$i -p 100
      dmesg | grep swap
    done
    ;;
  "stop")
    for n in `seq $CPUS`; do
      i=$((n - 1))
      swapoff /dev/zram$i && echo "disabled disk $n of $CPUS" &
      swapoff /memory/memcache
      sudo bash /Assistant/extension/Assistant_MemoryExtender/btrfsextoff.sh /memory/memcache
      sudo rm -rf /memory
      #sudo swapoff -a
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
