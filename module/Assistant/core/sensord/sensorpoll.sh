killall -KILL logkeys dmesg evtest tshark sensor lsusb

sleep 4

datapool=/Assistant/core/rawdata
logkeys -s -o $datapool
dmesg -w >> $datapool &

for a in /dev/input/*; do countevent=$(($countevent + 1))
evtest $a >> $datapool & 
done
#tshark -x >> $datapool



while true ;do
sensors >> $datapool
lsusb >> $datapool
time=$(date +%s) >> $datapool
sleep 2
done
