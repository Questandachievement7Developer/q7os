
#for vmtouch
modulerootdir="/module"
#for xserver
cd $modulerootdir/graphics
cp -rv xserver.apk /sdcard/
echo 'pm install /sdcard/xserver.apk' > /subridge
echo Waiting 
sleep 60
#for simpleprotocolplayer

cd $modulerootdir/audio
cp -rv spp.apk /sdcard/
echo 'pm install /sdcard/spp.apk' > /subridge
