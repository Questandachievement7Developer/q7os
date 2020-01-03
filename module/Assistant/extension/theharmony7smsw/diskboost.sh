#!/bin/bash
file=/Assistant/extension/theharmony7smsw/gg
if [ -f $file ] ; then
echo okaay
else
sudo -u nobody yaourt -S vmtouch --noconfirm
systemctl enable gopreload
fi
#define chunksize to be fitted into memory
#setting it higher might help to mitigate disk 100% activity problem
#please dont set it too big or too low if it does it will have negative performance impact rather than positive
#also make sure enabled this with the blackbox memory modules which will help to compress much of the data

chunksize=128M
#Define chunksize for userdata
#set it lower because it has more data
chunksizeuser=32K
echo Loading system Libraries and binaries into the memory
for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "[precache] : Preloading Application to memory chunksize $chunksize $chunksizeuser" | osd_cat -p top -A left
done
vmtouch -q -t -m $chunksize -F /usr/lib &
vmtouch -q -t -m $chunksize -F /usr/bin &
vmtouch -q -t -m $chunksize -F /bin &
echo Loading system Libraries into the memory
#vmtouch -q -t -m $chunksizeuser -F /home 



cd /home
for i in * ; do
echo user $i
rm -rf /home/$i/.cache
mkdir /home/$i/.cache
mount -t tmpfs -o size=8G tmpfs /home/$i/.cache
done

