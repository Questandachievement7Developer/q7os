pacman -S cpulimit syncthing xosd --needed --noconfirm

if [ -f $fileinstalled ]; then
echo Installed
else
rm /usr/bin/tqdm
sudo -u nobody yaourt -S geoip lsof python python-pip tor gnome python-setuptools mitmproxy python-tornado python-six tcpdump python-appdirs jq python-packaging python-pyparsing python-tqdm python-scikit-learn python-numpy python-scipy whereami scrot logkeys --noconfirm
mv /usr/bin/whereami /usr/bin/whereami_gps
npm -g install @rafaelrinaldi/whereami
daemonsystemd=/etc/systemd/system/Assistant/extension/orionAIbgsys.service

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
echo a > /Assistant/extension/theharmony7smsw/gg
exit


fi




for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo System Management SoftWare orionAI systems created by questandachievement7 | osd_cat -c green -A center -p middle
done
for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo 'Version 0.2a' | osd_cat -c green -A center -p middle
done
for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo 'Starting Services' | osd_cat -c green -A center -p middle
done
for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading SMSW (System Management SoftWare) for OrionAI system" | osd_cat -p top -A left
done

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading SMSW Computer Activity Recorder" | osd_cat -p top -A left
done


bash /Assistant/extension/theharmony7smsw/surveilancesecurity.sh > /Assistant/extension/theharmony7smsw/surveilancesecuritylog &


for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading SMSW Ultra Memory compressor" | osd_cat -p top -A left
done


bash /Assistant/extension/theharmony7smsw/memory.sh start > /Assistant/extension/theharmony7smsw/memoryhackinglog &

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading custom CPU Management" | osd_cat -p top -A left
done


bash /Assistant/extension/theharmony7smsw/cpugear.sh > /Assistant/extension/theharmony7smsw/theharmony7governoorcpu &

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading Storage Shrinker" | osd_cat -p top -A left
done


bash /Assistant/extension/theharmony7smsw/betterstorage.sh > /Assistant/extension/theharmony7smsw/theharmony7storageshrinkanator &

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading Data syncronization" | osd_cat -p top -A left
done

bash /Assistant/extension/theharmony7smsw/datasync.sh > /Assistant/extension/theharmony7smsw/theharmony7storagesync &

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading Magic Disk Boost" | osd_cat -p top -A left
done


bash /Assistant/extension/theharmony7smsw/diskboost.sh > /Assistant/extension/theharmony7smsw/theharmony7turbodisk &

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading Realtime Processes management" | osd_cat -p top -A left
done


bash /Assistant/extension/theharmony7smsw/nofrillsperf.sh > /Assistant/extension/theharmony7smsw/mustrununderallthings &

for ((i=0;i<=10;i++)); do
export DISPLAY=:$i
echo "Loading System warning indicator" | osd_cat -p top -A left
done


bash /Assistant/extension/theharmony7smsw/syswarn.sh &
bash /Assistant/extension/theharmony7smsw/idlemanagement.sh > /Assistant/extension/theharmony7smsw/idlemanagementruntime
