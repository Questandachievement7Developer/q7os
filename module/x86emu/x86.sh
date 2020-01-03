#!/bin/bash
# i have a dream to play x86_64 Program on an arm device haha
# remember its only a dream... that destined to be come true



if [ $1 == 'devmode' ] ; then
cd $devcurdir
export execdir=../..
currdir=$devcurdir
fi


#however for refrences of running winex86 on an arm device you can read this web
#https://wiki.winehq.org/Emulation
lcdebug=${DEBUGFLAG}
PROGRAMTARGET=$PROGRAMTARGET
echo Declared Program Target $PROGRAMTARGET
sleep 3
pacman -S qemu-extra-arch --noconfirm --needed --overwrite '*'
devcurdir=$(pwd)
cd /module/x86emu
cp -rv imagine /bin
arch=$(uname -m)
export sysloop=${origindir}/system/${arch}
currdir=$(pwd)
runtimedir=runtime
startingdir=$origindir
runtimeimg=runtime.x86
runtimekernel=vmlinuz
bootimg=initrd.gz
currentcore=$(nproc --all)
#http://stackoverflow.com/questions/2441046/ddg#2441064
memory=$(grep MemTotal /proc/meminfo | awk '{print $2}' )
usethememory=$(( $memory / 4 ))
echo $usethememory MemoryUsage KB


if [ $arch == 'x86_64' ] && [ $1 != 'devmode' ] && [ $1 == 'ignorex86' ] ; then
  echo 'You dont need to emulate x86 Architechture anymore you could just do installpkg wine and you are ready to go!'
  exit
fi
#Imagefile Imported From Manjaro Based System


#This Method However In theory should work since we emulating whole Kernel I/O which otherwise limited in Android NTkernel
#And restricted

#Basically by emulating Minimal Linux and Minimal Windows API translating with WINE we can achieve this easily without recompiling the main machine kernel to fit for example ( 3G/1G Memory Split )


if [ $1 == 'devmode' ] ; then
cd $devcurdir
export execdir=../..
currdir=$devcurdir
fi


if [ ! -f $runtimekernel ] ;then
wget http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/hd-media/vmlinuz
ls
fi


if [ ! -f $bootimg ] ;then
wget http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/hd-media/initrd.gz
ls
fi


if [ -f $runtimeimg ]; then
  echo runtime Image Detected
  echo username ?
  echo passing argument..
  echo $PROGRAMTARGET > exectg
  if [ ${lcdebug} == '1' ]; then
  clear
  echo Entering x86_64 Debug Development Mode
  sleep 3
    if [ ${arch} == 'aarch64' ]; then
      echo 64 bit System Detected enabling Multithreaded Acceleration
      sleep 3
    qemu-system-x86_64 \
      -name fakex86 \
      -hda runtime.x86 \
      -kernel $runtimekernel \
      -initrd initrd.gz \
      -accel tcg,thread=multi \
      -append 'console=ttyS0 debug ' \
      -m ${usethememory}K \
      -smp ${currentcore} \
      -serial mon:stdio \
      -nographic
      exit
    fi
    echo Unregistered System detected disabling Multithreaded Acceleration
    qemu-system-x86_64 \
      -name fakex86 \
      -hda runtime.x86 \
      -kernel $runtimekernel \
      -initrd initrd.gz \
      -append 'console=ttyS0 debug ' \
      -m ${usethememory}K \
      -smp ${currentcore} \
      -serial mon:stdio \
      -nographic
      exit
    fi
  if [ ${arch} == 'aarch64' ]; then
    echo 64 bit System Detected enabling Multithreaded Acceleration
    sleep 3
  qemu-system-x86_64 \
    -name fakex86 \
    -hda runtime.x86 \
    -kernel $runtimekernel \
    -initrd initrd.gz \
    -accel tcg,thread=multi \
    -append 'console=ttyS0 debug root=/dev/sda' \
    -m ${usethememory}K \
    -smp ${currentcore} \
    -serial mon:stdio \
    -nographic
    exit
  fi
  echo Unregistered System detected disabling Multithreaded Acceleration
  qemu-system-x86_64 \
    -name fakex86 \
    -hda runtime.x86 \
    -kernel $runtimekernel \
    -initrd initrd.gz \
    -append 'console=ttyS0 debug root=/dev/sda' \
    -m ${usethememory}K \
    -smp ${currentcore} \
    -serial mon:stdio \
    -nographic
    exit
#Bootscript
else
  echo Building x86Emulation run Environtment
  sleep 4
dd if=/dev/zero of=${runtimeimg} bs=1 count=0 seek=32G status=progress
busybox mkfs.ext2 -F ${runtimeimg}
mkdir x86portal
busybox mount -o loop,rw ${runtimeimg} x86portal
cd x86portal
if [ $1 == 'devmode' ] ; then
cp -rv ../../dist/x86_64raw .
fi
cp -rv ${origindir}/dist/x86_64raw .
tar -xf x86_64raw
mv x86_64/* .
cp -r $startingdir/distrocustomization/x86_64/* .
cp -rv $currdir/exec root/.bashrc
cd ..
cd ${currdir}
echo Closing Portal
umount -f x86portal
echo 'Function is not Implemented ()'
sh $currdir/win32start.sh
exit
fi































#Method Failed Due to the arm32 Devices cannot take advantages of the Feature
#Takes a lot of time and have tendency to Crash the device due to the constant load of compiling
#Also Failed
exit
bd=hangover
if [ -d $bd ];then
  echo Installed but dont know how to drive it
  echo Please Wait for Further Update to Run this Very Feature
  echo ' Dissapointing isnt it?'
#/path/to/hangover/build/wine-host/loader/wine64 /path/to/hangover/build/qemu/x86_64-windows-user/qemu-x86_64.exe.so foo.exe
#Wine's programs can be found in build/wine-guest/programs/* and build/wine-guest32/programs/* . build/wine-[guest|guest32]/ also
  exit
else
  git clone https://github.com/AndreRH/hangover
  cd hangover
  git submodule init
  git submodule update
  ./configure
  if [ $arch == 'aarch64' ]; then
    ./configure --enable-win64
  fi
  echo Compiling
  echo i may take a while
  echo i mean A long time
  make
  echo FInished
fi





#Failed Due To Proot bug Segmentation Fault Exit code 11 when using SECCOMP acceleration
#Also failed when Enabling PROOT_NO_SECCOMP=1 With exit code 7
#Chroot Code Also failed for non rooted device with have bad
#Unused Code
cp -rv ${startingdir}/bootproot/proot_${arch} .
if [ -d $runtimedir ]; then
  echo Executing
  cd runtime/x86_64
  cp -rv $currdir/exec .
  #proot code goes here
  mkdir prootexec
  export PROOT_TMPDIR=prootexec
  export PROOT_TMP_DIR=$PROOT_TMPDIR
  env PROOT_NO_SECCOMP=1 imagine -0 -r . -q qemu-x86_64 -b /dev -b /sys -b /run -b proc -b ${sysloop} -w /root /bin/bash /exec ${PROGRAMTARGET}
  echo 'any bug ? please let me know'
  exit
else
  echo Not installed yet
  echo Compiling Runtime
  git clone https://github.com/proot-me/proot
  cd proot/src
  make
  cp -rv proot /bin/imagine
  rm -rf proot
  cd ${currdir}
  mkdir runtime
  cp -r $startingdir/dist/x86_64raw runtime
  cd runtime
  echo Extracting Runtime
  tar -xf x86_64raw
  cd x86_64
  echo Applying Settings
  cp -r $startingdir/distrocustomization/x86_64/* .
  sh $currdir/win32start.sh
  exit
fi



#Old method actually works but having the bulk of NTkernel Running on virtualized and NTkernel have tendency to require userInteraction on some
#action Due to that i discarded the idea to Emulate Whole Windows
