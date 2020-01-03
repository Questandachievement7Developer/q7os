#for GL4ES
modulerootdir="/module"
cd /module
cd /module/graphics/gl4es
mkdir build; cd build; cmake .. -DBCMHOST=1; make
cp -rv lib/* /lib
cd /module
