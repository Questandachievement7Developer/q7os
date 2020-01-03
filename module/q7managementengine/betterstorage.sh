file=/module/q7managementengine/gg
if [ -f $file ] ; then
echo meow
else
sudo -u nobody yaourt -S duperemove --noconfirm
fi
echo Waiting For 1 hour xd
#sleep 3600
cycle=0
flagproc=0
echo Shrinking daata
while true; do 
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}')
CPU=$(echo ${CPU%\.*})
echo $CPU
if [ $CPU -gt '30' ] ; then
cycle=0
flagproc=0
killall -KILL duperemomve
killall -KILL btrfs
else
cycle=$(( $cycle + 1 ))
echo Confirming idle mode $cycle
if ([ $cycle -gt '27' ] && [ $flagproc -eq '0' ])
then
duperemove -dr /home
btrfs filesystem defragment -r -v -c zlib:9 /home
else
cycle=0
echo meow
flagproc=0 
fi
fi
sleep 2
echo $cycle
done
