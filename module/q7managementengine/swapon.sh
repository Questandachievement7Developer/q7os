
#!/bin/sh
#
# Copyright (C) Sebastian Philipp
#

set -e

swapsize="$1"
swapname="$2"


if [ -z "$swapsize" -o -z "$swapname" ]
then
	cat <<EOF
Usage: $0 <size> <file>
size:      the size of the file, like "8G"
file:      path to the new swap file. This file should not exists.
EOF
	exit 1
fi

if [ -e $swapname ]
then
	echo "error: File already exists. $swapname"
fi

swapfile=$(losetup -f) #free loop device

# set NOCOW
touch $swapname
chmod 0600 $swapname
chattr +C $swapname
head -c $swapsize /dev/zero >> $swapname

losetup $swapfile $swapname #mount file to loop
mkswap  $swapfile
swapon $swapfile
