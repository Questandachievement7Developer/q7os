
#for pulseeffects
modulerootdir="/module"
cd /module
cd /module/AUR/yay
make
cp -rv yay /bin/yay
cp -rv yay /bin/yaourt
cp -rv yay /bin/trizen
echo Done
