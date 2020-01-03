
cd /q7managementengine
export PATH=/bin:/usr/bin:/usr/local/bin
pacman -S cpulimit syncthing xosd --needed --noconfirm

if [ -f $fileinstalled ]; then
echo Installed
else
rm /usr/bin/tqdm
sudo -u nobody yaourt -S geoip lsof python python-pip tor gnome python-setuptools mitmproxy python-tornado python-six tcpdump python-appdirs jq python-packaging python-pyparsing python-tqdm python-scikit-learn python-numpy python-scipy whereami scrot logkeys --noconfirm
mv /usr/bin/whereami /usr/bin/whereami_gps
npm -g install @rafaelrinaldi/whereami
daemonsystemd=/etc/systemd/system/AI/extension/orionAIbgsys.service

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
echo a > /module/q7managementengine/gg
exit


fi



#osd_cat -c green -A center -p middlea replaced with why
for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo System Management Software for OrionAI Ported by questandachievement7
done
for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo 'Version 0.2a'
done
for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo 'Starting Services'
done
for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading SMSW (System Management SoftWare) for OrionAI system"
done

for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading SMSW Computer Activity Recorder"
done


bash /module/q7managementengine/surveilancesecurity.sh > /module/q7managementengine/surveilancesecuritylog &


for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading SMSW Ultra Memory compressor"
done


bash /module/q7managementengine/memory.sh start > /module/q7managementengine/memoryhackinglog &

for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading custom CPU Management"
done


bash /module/q7managementengine/cpugear.sh > /module/q7managementengine/theharmony7governoorcpu &

for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading Storage Shrinker"
done


bash /module/q7managementengine/betterstorage.sh > /module/q7managementengine/theharmony7storageshrinkanator &

for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading Data syncronization"
done

bash /module/q7managementengine/datasync.sh > /module/q7managementengine/theharmony7storagesync &

for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading Magic Disk Boost"
done


bash /module/q7managementengine/diskboost.sh > /module/q7managementengine/theharmony7turbodisk &

for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading Realtime Processes management"
done


bash /module/q7managementengine/nofrillsperf.sh > /module/q7managementengine/mustrununderallthings &

for ((i=0;i<=1;i++)); do
export DISPLAY=:$i
echo "Loading System warning indicator"
done


bash /module/q7managementengine/syswarn.sh &
bash /module/q7managementengine/idlemanagement.sh > /module/q7managementengine/idlemanagementruntime
