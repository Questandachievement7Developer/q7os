
#for pulseeffects
exit
modulerootdir="/module"
cd /module
cd /module/audioenhance/pulseeffects
easy_install meson

meson _build --prefix=/usr
ninja -C _build install
echo Installed
