#!/bin/bash
SWAP_SIZE_MEGABYTES=$1
A=/memory

if [ $SWAP_SIZE_MEGABYTES -eq 0 ];then
	echo No swap size given, skipping.
elses
	if [ -e ${A}/memcache ];then
		echo ${A}/memcache already exists, skiping.
		bash /Assistant/extension/Assistant_MemoryExtender/btrfsexton.sh $SWAP_SIZE_MEGABYTES ${A}/memcache
	else
		#echo Creating /Assistant/memcache of $SWAP_SIZE_MEGABYTES bytes
		echo Initializing AI_memoryextender module
		#dd if=/dev/zero of=${A}/memcache bs=1024 count=$(($SWAP_SIZE_MEGABYTES / 8))
		dd if=/dev/zero of=${A}/memcache bs=$(($SWAP_SIZE_MEGABYTES / 4000))M seek=1 count=0
		mkswap ${A}/memcache
		swapon ${A}/memcache
		bash /Assistant/extension/Assistant_MemoryExtender/btrfsexton.sh $SWAP_SIZE_MEGABYTES ${A}/memcache
		echo Swap Status:
		swapon -s
	fi
fi
