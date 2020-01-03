#for GLU
modulerootdir="/module"
cd /module
cd /module/graphics/GLU
./configure
make
cp -rv libGLU.la /lib
cd /module
