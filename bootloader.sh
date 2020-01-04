#Script was Written and compiled by muddro part of questandachievement7Developer
#for Source where did i get the command there is comment pointout where is the source
#Please enjoy and report any bug
#Designed to be run on Android based device without replacing whole Android OS which potentially limits the compatibility
#And designed to be run on an android device that wont be getting another update from the vendor or the manufacture
#ありがとう ございます。楽しんでください

#set -x
#set -x #debug Dev mode
#Superseeded by the nvram config "Conf_debug" flag
#---------------------------------------------------------------





# ------ATTENTION FOR WSL USER ( WSL 1 AND WSL 2 )-------
# USERS WHO USE THE WSL DEFAULT TERMINAL ( AGING CMD TERMINAL )
# PARAMETERS WILL NOT BE RECOGNIZED OR REGISTERED IN THIS Script
# IN ORDER TO BE RECOGNIZED TRY TO USE THE EXPERIMENTAL NEW WINDOWS TERMINAL OR
# USE POWERSHELL TERMINAL INSTEAD





#----------------------------------------------------------------













#Soft Colour palletes  # PLEASE NOT THIS COLOR PALLETES IS REPLACED OR SUPERSEEDED BY THE RUNTIMETOOLBOX function
# red() yellow() green() blue()
#printf '\e[38;5;210m ' red
#printf '\e[38;5;221m ' yellow
#printf '\e[38;5;042m ' green
#printf '\e[38;5;039m ' blue





#Prefix Badge
sysinitprefix=[q7BL]
quaverprefix=[quaverFS]
compatprefix=[CompatibilityManager]
compileprefix=[InstallMaker]


B="q7os bootloader"
export origindir=$(pwd)
arch=$(uname -m)
ENV=${origindir}/reqbin/env
limited=0
#variable initialization
#Another Credit to Pelya https://github.com/pelya/debian-noroot/blob/master/dist/proot.sh
mkdir prootexec
#https://github.com/termux/proot/blob/3bc06868508b858e9dc290e29815ecd690e9cb0c/tests/test-2401b850.sh
export NVRAMCONF=${origindir}/emulatednvram
export runtimetoolbox=${origindir}/runtimetoolbox
export systemcall=${runtimetoolbox}
. ${runtimetoolbox}/monolithicload0
bootloaderinitialinfo


#for chmoding to excutables
yellow
echo "[BinaryManager] Reflagging binary execution"
if [ ! -f ${origindir}/reqbin/executionFlagged ] && [ -f ${origindir}/reqbin ] ; then
sh ${origindir}/custombinary/convertexecuteflag
echo a > ${origindir}/reqbin/executionFlagged # This is for flagging that the bootloader and system have been fixed or the permission has been fixed to 777 or chmod +x
fi

#Change This Code Into Loaded NVRAM configuration


# $limited variable is determining whether that you have root which mean full access or not full at all or limited access

if [ ! -d emulatednvram ]; then
echo NVRAM is not initialized yet
#!/bin/sh
#Reset NVRAM using default nvramdbset
mkdir ${origindir}/emulatednvram
cd ${origindir}
export PROOT_NO_SECCOMP=1
export HOME=/home/$USER
export SHELL=/bin/bash
export LD_LIBRARY_PATH=
# Java doesn't work in PRoot when started from /usr/bin/java symlink, so we have to put a path to java binary into PATH, and Java 6 fails on Samsung devices
JAVA_PATH=/usr/lib/jvm/default-java/jre/bin:/usr/lib/jvm/default-java/bin
ls usr/lib/jvm/java-7-openjdk-*/bin > /dev/null 2>&1 && JAVA_PATH=/`echo usr/lib/jvm/java-7-openjdk-*/jre/bin`:/`echo usr/lib/jvm/java-7-openjdk-*/bin`
export PATH=/usr/local/sbin:/usr/local/bin:$JAVA_PATH:/usr/sbin:/usr/bin:/sbin:/bin
export PROOT_TMPDIR=prootexec
export PROOT_TMP_DIR=$PROOT_TMPDIR
export TZ=$(getprop persist.sys.timezone)
export PATH=/system/xbin:/system/bin:system/$arch/bin:${origindir}/bootproot/:$PATH
export FASTBOOT=no
export XSDLSTARTUP=0
export BROWSERUX=1
export LIBGL_FB=3
export DISPLAY=:0
export PULSE_SERVER=127.0.0.1:4712
export HOME=/root
export TERM=xterm
export COLORTERM=truecolor
export startupsel=mainterminal
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/system/xbin:/system/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export QUAVERFS_home=${origindir}/qfs_home.img
export QUAVERFS_usr=${origindir}/qfs_usr.img
export QUAVERFS_sbin=${origindir}/qfs_sbin.img
export QUAVERFS_root=${origindir}/qfs_root.img
export QUAVERFS_etc=${origindir}/qfs_etc.img
export QUAVERFS_boot=${origindir}/qfs_boot.img
export QUAVERFS_cacheinst=${origindir}/qfs_cacheinst.img
export QUAVERFS_pkgcache=${origindir}/qfs_pkgcache.img
export QUAVERFS_init0=${origindir}/system.img
export QUAVERFS_home_size=64G
export QUAVERFS_usr_size=4G
export QUAVERFS_sbin_size=1G
export QUAVERFS_root_size=4G
export QUAVERFS_etc_size=4G
export QUAVERFS_boot_size=512M
export QUAVERFS_cacheinst_size=8G
export QUAVERFS_pkgcache_size=8G
export QUAVERFS_init0_size=64G
export Conf_debug=0
export limited=0
export DISABLE_SYSTEMD=0

mkdir $NVRAMCONF
cd $NVRAMCONF
echo $BROWSERUX > BROWSERUX
echo $DISABLE_SYSTEMD > DISABLE_SYSTEMD
echo $Conf_debug > Conf_debug
echo $QUAVERFS_home > QUAVERFS_home
echo $QUAVERFS_usr > QUAVERFS_usr
echo $QUAVERFS_sbin > QUAVERFS_sbin
echo $QUAVERFS_root > QUAVERFS_root
echo $QUAVERFS_etc > QUAVERFS_etc
echo $QUAVERFS_boot > QUAVERFS_boot
echo $QUAVERFS_cacheinst > QUAVERFS_cacheinst
echo $QUAVERFS_pkgcache > QUAVERFS_pkgcache
echo $QUAVERFS_init0 > QUAVERFS_init0
echo $QUAVERFS_home_size > QUAVERFS_home_size
echo $QUAVERFS_usr_size > QUAVERFS_usr_size
echo $QUAVERFS_sbin_size > QUAVERFS_sbin_size
echo $QUAVERFS_root_size > QUAVERFS_root_size
echo $QUAVERFS_etc_size > QUAVERFS_etc_size
echo $QUAVERFS_boot_size > QUAVERFS_boot_size
echo $QUAVERFS_cacheinst_size > QUAVERFS_cacheinst_size
echo $QUAVERFS_pkgcache_size > QUAVERFS_pkgcache_size
echo $QUAVERFS_init0_size > QUAVERFS_init0_size
echo $limited > limited
echo $LC_ALL > LC_ALL
echo $LANG > LANG
echo $LANGUAGE > LANGUAGE
echo $FASTBOOT > FASTBOOT
echo $startupsel > startupsel
echo $XSDLSTARTUP > XSDLSTARTUP
echo $PROOT_NO_SECCOMP > PROOT_NO_SECCOMP
echo $HOME > HOME
echo $SHELL > SHELL
echo $LD_LIBRARY_PATH > LD_LIBRARY_PATH
echo $JAVA_PATH > JAVA_PATH
echo $PATH > PATH
echo $PROOT_TMPDIR > PROOT_TMPDIR
echo $PROOT_TMP_DIR > PROOT_TMP_DIR
echo $TZ > TZ
echo $LIBGL_FB > LIBGL_FB
echo $DISPLAY > DISPLAY
echo $PULSE_SERVER > PULSE_SERVER
echo $TERM > TERM
echo $COLORTERM > COLORTERM
echo $(uname -m) > arch
echo NVRAM Flush Rewrite Operation success..
sleep 0

cd ${origindir}
else
  echo Loading parameter
  cd ${NVRAMCONF}
  for a in * ; do
  val=$(cat $a)
  export ${a}=${val}
  #echo ${a}=${val}
   done
  cd ${origindir}
fi

if [ $Conf_debug = '1' ]; then
  set -x
fi


if [ $1 = 'nonroot' ]; then
  echo Limited Operation Engaged
  export limited=1
  echo $limited > ${NVRAMCONF}/limited
  sleep 0
fi


if [ "$EUID" -ne 0 ]
  then
  echo ${compatprefix} ${B} Hardware is not accessible
  echo ${compatprefix} root is not being used or available
  echo ${compatprefix} However if you presist to boot up then we have no choice but to emulate things
  sleep 1
  limited=1
  #echo attempting to access root
  #bambi=$(pwd)
  #su -c "cd ${bambi} ; sh ${bambi}/bootloader.sh $1 "
  #exit
fi

if [ $1 = 'develkit' ]; then
clear
blue
echo Backing up current development environment state
sleep 2
currver=$(cat dist/ver)
currver=$(( $currver + 1 ))
echo $currver > dist/ver
sleep 1
rm -rf reqbin
git add .
git status -s
chown -R 1000:1000 .
cd ..
echo package Compiler started
#--exclude='./folder'
#tar cf - /folder-with-big-files -P | pv -s $(du -sb /folder-with-big-files | awk '{print $1}') | gzip > big-files.tar.gz
#https://superuser.com/questions/168749/is-there-a-way-to-see-any-tar-progress-per-file
#rm -rf core/.git
chown -R 1000:1000 core
chmod -R 777 core
rm -rf core/emulatednvram
tar cvzf q7os_DEVELKIT.tar.gz core
split -b 1500m q7os_DEVELKIT.tar.gz q7os_DEVELKIT_part.tar.gz.
rm -rf q7os_DEVELKIT
echo "q7OS build $currver"
chmod -R 777 core
date
exit
fi




if [ $1 = 'licensegen' ]; then
  exit
  echo Generating LICENSE file
  echo '------------q7os Licenses------------' > ${origindir}/LICENSE.txt
  licensefile=$(grep -ril ${origindir} -e 'license')
  for a in $licensefile ; do
    echo "$a" >> ${origindir}/LICENSE.txt
    cat "$a" >> ${origindir}/LICENSE.txt
  done
  echo '---------------[and thats the code and licenses]----------------' >> ${origindir}/LICENSE.txt
  echo License has been generated
  exit
fi




if [ $1 = 'analyzelastbuild' ]; then
export testmodeprefix="[TESTING_BUILD]"
export diagnosticlog=${origindir}/devel_cache/logs
currver=$(cat dist/ver)
yellow
echo "${testmodeprefix} Gathering Results"
if [ $2 = 'error' ]; then
cat ${diagnosticlog}/*${currver}* | grep error > ${origindir}/tmp/analyzeUI
less ${origindir}/tmp/analyzeUI
rm /tmp/analyzeUI
exit
fi
if [ $2 = 'unexpected' ]; then
cat ${diagnosticlog}/*${currver}* | grep unexpected > ${origindir}/tmp/analyzeUI
less ${origindir}/tmp/analyzeUI
rm /tmp/analyzeUI
exit
fi
if [ $2 = 'unknown' ]; then
cat ${diagnosticlog}/*${currver}* | grep unknown > ${origindir}/tmp/analyzeUI
less ${origindir}/tmp/analyzeUI
rm /tmp/analyzeUI
exit
fi
if [ $2 = 'termination' ]; then
cat ${diagnosticlog}/*${currver}* | grep terminat > ${origindir}/tmp/analyzeUI
less ${origindir}/tmp/analyzeUI
rm /tmp/analyzeUI
exit
fi


errorlogcount=$(grep -o "error" ${diagnosticlog}/*${currver}* | wc -l )
unexpectedcount=$(grep -o "unexpected" ${diagnosticlog}/*${currver}* | wc -l)
unknowncount=$(grep -o "unknown" ${diagnosticlog}/*${currver}* | wc -l)
terminatecount=$(grep -o "terminat" ${diagnosticlog}/*${currver}* | wc -l)
green
clear
echo "${testmodeprefix} Here are the misbehaviour of the q7OS build ${currver} runtime"
echo "${testmodeprefix} You can see the misbehaviour by using additional parameter like"
echo "$0 $1 error , $0 $1 unexpected , $0 $1 unknown , $0 $1 termination"
red
echo "Errors ${errorlogcount}"
echo "Unexpected Behaviour ${unexpectedcount}"
echo "not found instructions ${unknowncount}"
echo "Unexpected Termination ${terminatecount}"
yellow
echo "For more comprehensive Logs go to ${diagnosticlog} "
exit
fi

if [ $1 = 'testbuild' ]; then
if [ "$(whoami)" != 'root' ]; then
    clear
    red
    echo "${compileprefix} Please rerun the bootloader with superuser or root"
    exit
fi
clear
green
currver=$(cat dist/ver)
currver_future=$(( ${currver} + 1 )) # basically to add 1 into the currver output (Reason : before building or compiling the currver variable is 1 build version late)
echo "Testing your build"
echo "if your build is sucessfully ran there will be a message like [TESTMODE] Build sucessfully run"
echo "---[Evaluation Folder]---"
echo "Running q7OS build ${currver_future} logs will be stored on devel_cache/logs/buildTest_${currver_future}.log folder!"
echo "Compile log for build ${currver_future} will be on devel_cache/logs/compile_${currver_future}.log"
echo "Install log for build ${currver_future} will be on devel_cache/logs/installLog_${currver_future}.log"
# Please remember that installtemplate uses $HOME for the installation directory
# so to change instalation directory you have to set or change HOME variable in the session
export HOME=${origindir}/../runtimeSandbox
export diagnosticlog=${origindir}/devel_cache/logs
mkdir ${diagnosticlog}
export TESTMODE=1 #Inform to tested build that the build is intended for testing only and disposal purposes
export testmodeprefix="[TESTING_BUILD]"
# Routine started
#Phase 1
yellow
echo "${testmodeprefix} [1/4] Compiling ${currver_future} build"
cd ..
rm -rf runtimeSandbox install.sh
cd ${origindir}
yellow
nohup sh $0 compile > ${diagnosticlog}/compile_${currver_future}.log 2>&1
mkdir ../runtimeSandbox     # Creates sandbox folder
green
echo "${testmodeprefix} Finished"
#Phase 2
yellow
echo "${testmodeprefix} [2/4] Installing build into a sandbox"
cd ..
nohup sh install.sh > ${diagnosticlog}/installLog_${currver_future}.log 2>&1
cd runtimeSandbox/core
green
echo "${testmodeprefix} Finished"
#Phase 3
yellow
echo "${testmodeprefix} [3/4] Testing Build Runtime This will take a while"
nohup sh bootloader.sh > ${diagnosticlog}/buildTest_${currver_future}.log 2>&1
green
echo "${testmodeprefix} Finished"
#Phase 4 Copies the LOGS to the designated development environment
echo "${testmodeprefix} [4/4] Cleaning up"
cd ../..
rm -rf runtimeSandbox install.sh
cd ${origindir}
green
echo "${testmodeprefix} Finished"

sleep 9
clear
yellow
echo "${testmodeprefix} Gathering Results"
errorlogcount=$(grep -o "error" ${diagnosticlog}/* | wc -l )
unexpectedcount=$(grep -o "unexpected" ${diagnosticlog}/* | wc -l)
unknowncount=$(grep -o "unknown" ${diagnosticlog}/* | wc -l)
terminatecount=$(grep -o "termin" ${diagnosticlog}/* | wc -l)
green
clear
echo "${testmodeprefix} Here are the misbehaviour of the q7OS runtime"
echo "Errors ${errorlogcount}"
echo "Unexpected Behaviour ${unexpectedcount}"
echo "not found instructions ${unknowncount}"
echo "Unexpected Termination ${terminatecount}"
echo "For more comprehensive Logs go to ${diagnosticlog} "
exit
fi

if [ $1 = 'compile' ]; then
if [ "$(whoami)" != 'root' ]; then
    clear
    red
    echo "${compileprefix} Please rerun the bootloader with superuser or root"
    exit
fi

echo Attempting to run adb root if there is Android
adb root
echo Checking Backup Schedule
currver=$(cat dist/ver)
buildnumberzero=$(( $currver % 3 ))
if [ $buildnumberzero = '0' ]; then
  echo Its backup time
  sh bootloader.sh develkit
  echo Done
else
  echo seems $buildnumberzero not yet okaaay
fi
sleep 4

clear
printf '\e[38;5;221m ' yellow
echo $compileprefix Removing rm_protect File
if [ ! -d 000a_rm_protect ]; then
  rm -rf 000*
fi
echo $compileprefix This also will update the repository
sleep 2

currver=$(cat dist/ver)
currver=$(( $currver + 1 ))
echo $currver > dist/ver
sleep 1
rm -rf reqbin
git add .
git status -s
chown -R 1000:1000 .
printf '\e[38;5;042m ' green
echo $compileprefix running Prepackaging operation
for i in module/prepackagingscripts/*; do
  echo $compileprefix running $i
  sh $i
done

cd ..
echo $compileprefix package Compiler started
#--exclude='./folder'
#tar cf - /folder-with-big-files -P | pv -s $(du -sb /folder-with-big-files | awk '{print $1}') | gzip > big-files.tar.gz
#https://superuser.com/questions/168749/is-there-a-way-to-see-any-tar-progress-per-file
#rm -rf core/.git
chown -R 1000:1000 core
chmod -R 777 core
echo $compileprefix Resetting nvram
rm -rf core/emulatednvram
echo $compileprefix Resetting Archlinux base tarballs
rm -rf core/dist/x86_64raw core/dist/armv7lraw core/dist/aarch64raw
echo 1 > core/dist/reconstructionflag
echo $compileprefix Resetting reqbin
rm -rf core/reqbin
echo $compileprefix Creating Archive
if [ $2 = 'updatepkg' ]; then
  tar czf q7os.tar.gz  --exclude "executionFlagged" --exclude "DevelopmentEnvironment" --exclude .git --exclude "*.log" --exclude "system" --exclude "*.img" --exclude "emulatednvram" --exclude "buildenv" --exclude "LICENSE*"  --exclude "dist/arm*"  --exclude "dist/x86*" --exclude reqbin core
else
tar czf q7os.tar.gz  --exclude "executionFlagged" --exclude "DevelopmentEnvironment" --exclude .git --exclude "*.log" --exclude "system" --exclude "*.img" --exclude "emulatednvram" --exclude "buildenv" --exclude "LICENSE*" --exclude reqbin core
fi
echo "q7OS build $currver"
#tar czf - core -P |  pv -s $(du -sb core | awk '{print $1}') | gzip > q7os.tar.gz
if [ $2 = 'updatepkg' ]; then
  cat core/module/q7pak/installtemplate > update.sh
  md5sum q7os.tar.gz >> update.sh
  cat q7os.tar.gz >> update.sh
  chmod +x update.sh
  rm -rf q7os.tar.gz
  echo $compileprefix compiled successfully became update.sh
  #attempting to push update to nearby Devices using adb
  adb devices
  adb push update.sh /sdcard
  adb shell "su -c 'cd /sdcard ; export HOME=/data/GNU ; sh /sdcard/update.sh'"
  adb shell "find /data/GNU"
  adb shell "reboot"
else
cat core/module/q7pak/installtemplate > install.sh
md5sum q7os.tar.gz >> install.sh
cat q7os.tar.gz >> install.sh
chmod +x install.sh
rm -rf q7os.tar.gz
echo $compileprefix compiled successfully became install.sh
#attempting to push update to nearby Devices using adb
adb devices
adb push install.sh /sdcard
adb shell "su -c 'cd /sdcard ; export HOME=/data/GNU ; mkdir /data/GNU ; sh /sdcard/install.sh'"
adb shell "find /data/GNU"
adb shell "nohup su -c /system/bin/sh /sdcard/startq7os &"

fi

chmod -R 777 core
date



exit
fi

#
#spaceavailable=$(  df --output=avail -h "$PWD" | sed '1d;s/[^0-9]//g')
#if [ $spaceavailable -lt 2 ]; then
#  echo Run out of space Error
#  echo Unresolvable for today
#else
#echo Pass Storage
#fi



#License Generation
if [ ! -f ${origindir}/LICENSE.txt ]; then
sh ${origindir}/bootloader.sh licensegen
fi




#Go to Terminal instantly # Or Literally Fastboot
file=system/$arch/bootflag/on
if [ -f $file ] ;then
  #rmProtectFunction Preventing rm -rf core and deleting all Mount data
  bash ${origindir}/module/rmProtectFunction &
  clear
cd ${origindir}/system/$arch
if [ $limited = '1' ]; then
  echo Re Welcome Again to q7OS
  proot_${arch} -r . -w /root $ENV -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/sh /module/terminalsystemconnect
  exit
else
chroot . /bin/bash /usr/bin/screenfetch
echo Re Welcome Again to q7OS
#chroot . /bin/bash /usr/bin/fish
#chroot . /usr/bin/fish
chroot . /bin/sh /module/terminalsystemconnect
echo To deboot the system please go to the main Terminal and exit
exit
fi
fi


if [ $1 = 'help' ];then
  echo Bootloader Command
  echo bootloader.sh nonroot to launch q7os without root
  echo bootloader.sh compile to compile q7os became install.sh
  echo bootloader.sh testbuild to test current build of q7OS
  echo bootloader.sh analyzelastbuild to test current build of q7OS
  echo bootloader.sh compile updatepkg to compile q7os update package became update.sh
  echo bootloader.sh develkit to compile it became development Kit
  echo bootloader.sh gitinit to initialize the Repository
  echo bootloader.sh gitsync to sync beetween remote and local git repo
  echo bootloader.sh reset to reset system and reinstall completely the system
  exit
fi

#https://stackoverflow.com/questions/9577968/how-to-upload-files-on-github
if [ $1 = 'gitinit' ];then
rm -rf .git
git init
git add .
git remote add origin https://github.com/Questandachievement7Developer/q7os
currver=$(cat dist/ver)
echo q7os build $currver
git commit -m "Commit of q7os update build $currver "
git status -s
exit
fi

if [ $1 = 'gitsync' ];then
git add .
currver=$(cat dist/ver)
currver=$(( $currver + 1 ))
echo $currver > dist/ver
echo q7os build $currver
# dont forget to add remote origin server
# Default git remote add origin https://github.com/Questandachievement7Developer/q7os.git
git commit -m "Commit of q7os update build $currver "
#git push origin master
git push -u origin master
exit
fi

compatibilitycommand="acpid addgroup adduser adjtimex ar arp arping ash
        awk basename beep blkid brctl bunzip2 bzcat bzip2 cal cat
        catv chat chattr chgrp chmod chown chpasswd chpst chroot
        chrt chvt cksum clear cmp comm cp cpio crond crontab
        cryptpw cut date dc dd deallocvt delgroup deluser depmod
        devmem df dhcprelay diff dirname dmesg dnsd dnsdomainname
        dos2unix dpkg du dumpkmap dumpleases busybox echo ed egrep eject
        env envdir envuidgid expand expr fakeidentd false fbset
        fbsplash fdflush fdformat fdisk fgrep find findfs flash_lock
        flash_unlock fold free freeramdisk fsck fsck.minix fsync
        ftpd ftpget ftpput fuser getopt getty grep gunzip gzip hd
        hdparm head hexdump hostid hostname httpd hush hwclock id
        ifconfig ifdown ifenslave ifplugd ifup inetd init inotifyd
        insmod install ionice ip ipaddr ipcalc ipcrm ipcs iplink
        iproute iprule iptunnel kbd_mode kill killall killall5 klogd
        last length less linux32 linux64 linuxrc ln loadfont
        loadkmap logger login logname logread losetup lpd lpq lpr
        ls lsattr lsmod lzmacat lzop lzopcat makemime man md5sum
        mdev mesg microcom mkdir mkdosfs mkfifo mkfs.minix mkfs.vfat
        mknod mkpasswd mkswap mktemp modprobe more mount mountpoint
        mt mv nameif nc netstat nice nmeter nohup nslookup od
        openvt passwd patch pgrep pidof ping ping6 pipe_progress
        pivot_root pkill popmaildir printenv printf ps pscan pwd
        raidautorun rdate rdev readlink readprofile realpath
        reformime renice reset resize rm rmdir rmmod route rpm
        rpm2cpio rtcwake run-parts runlevel runsv runsvdir rx script
        scriptreplay sed sendmail seq setarch setconsole setfont
        setkeycodes setlogcons setsid setuidgid sh sha1sum sha256sum
        sha512sum showkey slattach sleep softlimit sort split
        start-stop-daemon stat strings stty su sulogin sum sv
        svlogd swapoff swapon switch_root sync sysctl syslogd tac
        tail tar taskset tcpsvd tee telnet telnetd test tftp tftpd
        time timeout top touch tr traceroute true tty ttysize
        udhcpc udhcpd udpsvd umount uname uncompress unexpand uniq
        unix2dos unlzma unlzop unzip uptime usleep uudecode uuencode
        vconfig vi vlock volname watch watchdog wc busybox wget which who
        whoami xargs yes zcat zcip"
if [ -d reqbin ]; then
  echo Busybox Exists
  export PATH=${origindir}/reqbin/
else
cp boothelper_${arch} busybox
#Installing required Binaries
#end whoops i think i just list all my program xd
mkdir reqbin
for i in $compatibilitycommand; do
cp -r busybox reqbin/$i
echo $arch $i
done
export PATH=${origindir}/reqbin/
fi
#Thanks To Pelya for pointing out shmem emulation
# https://github.com/pelya/debian-noroot/blob/master/dist/proot.sh

#ELF error and im sad :(
#export "LD_PRELOAD=bootlib/libdisableselinux.so bootlib/libandroid-shmem.so"

if [ $1 = 'reset' ]; then
  clear
  yellow
  echo Alert you have 10 seconds before the q7OS resets the installation
  echo All your data stored on q7OS will be lost after this 10 seconds
  echo and reverted back into original state
  sleep 10
  red
  echo "Resetting System! This may take a while"
  umount -rlf system
  rm -rf system
  rm -rf emulatednvram
  rm -rf *.img
  sh bootloader.sh
  exit
fi

if [ -f ${origindir}/dist/DevelopmentEnvironment ]; then
  red
  echo You are attempting to run q7OS on DevelopmentEnvironment
  echo please do not attempt to run it or the system will be bloated
  echo "[Developer notes]"
  green
  echo You might recieve this message even though you input specific parameter
  echo in this case try to change terminal or use another methed to insert parameter
  yellow
  echo "[Debug] : This is your Command $0 $1 $2 "
  exit
fi







clear
printf '\e[38;5;039m \n' blue
echo $sysinitprefix Running  $(uname -m) processor
sleep 0.1
echo $sysinitprefix Kernel Detection $(uname -r)
sleep 0.1
echo $sysinitprefix Initializing q7os on $(uname -o)
sleep 0.1
echo q7OS based on Archlinux build by questandachievement7 Developers
echo Inspired by the simplicity of manjaro Distro and The versitality of termux-arch
echo Nothing Special About this distro
printf '\e[38;5;210m ' red
echo Warning q7OS is NOT a light GNU alternative and may access your whole device components
sleep 5
echo q7OS is about to boot up we DO NOT take any responsibility if anything bad happen to your device
sleep 3
printf '\e[38;5;210m ' red
if [ ! -f /etc/init.d/000q7osinit ]; then
echo $sysinitprefix Attempting Disabling systemless mode
mount -o remount,rw /system
mount -o remount,rw /
busybox mount -o remount,rw /system
busybox mount -o remount,rw /
echo "cd ${origindir} ; /bin/sh bootloader.sh & " > /etc/init.d/000q7osinit
echo "cd ${origindir} ; /bin/sh bootloader.sh & " > /system/etc/init.d/000q7osinit
echo $sysinitprefix Attaching Preloading script for q7os
fi
printf '\e[38;5;221m ' yellow

if [ ! -d /data ]; then
  printf '\e[38;5;210m ' red
  echo "${compatprefix} Strange? /data seems to not exists or detected by the bootloader"
  echo Enforcing Boot
  sleep 2
fi

if [ ! -d /system ]; then
  printf '\e[38;5;210m ' red
  echo "${compatprefix} Error /system mount not found!"
  echo "${compatprefix} This wasnt an android at all Please be aware that it may not boot at all"
  echo "${compatprefix} Enforcing Boot"
  sleep 2
fi

deer=wdir
if [ -f $deer ]; then
  echo ah a bambi detected
  wdir=$(cat wdir)
  cd $wdir
  echo $wdir
else
  wdir=$(pwd)
  echo $wdir > $deer
  cd $wdir
fi


if [ $rootreq = '1' ]; then
  if [ -f /sbin/su ]; then
  su -c "cd $wdir ; /bin/sh bootloader.sh"
  echo ${compatprefix} Did it succeed or root is not granted
  echo ${compatprefix}  Device that detected have a root will and have to grant it
  exit
else
  echo ${compatprefix} no root detected accepting fate
  cd $wdir ; /bin/sh bootloader.sh nonroot
  exit
fi
fi







echo $sysinitprefix Checking Update Package


update=q7os.tar.gz
#dupdate=downloaded update
dupdate=/sdcard/Download/install.sh
#supdate=Sdcard Download
supdate=/sdcard/install.sh


if [ -f $update ]; then

  echo ' Superseeded by livepatchdaemon '
fi

qemu=0
#installedfolder=
##package syncronization


#cd ~/${installedfolder}


##For termux Please CD first

#systemimage
#System Image required Because on standard /data on android uses nosuid which messes up most of the sandboxing things in linux ( i dont understand what im even talking abaout)
# anyway

counting=0
if [ $limited = '0' ]; then
img=system.img
echo "$quaverprefix Initializing.."
sleep 0
mknod -m 0755 /dev/QUAVERFS0 b 7 8
cd ${NVRAMCONF}
for a in QUAVERFS_* ; do
  counting=$(( $counting + 1 ))
  mknod -m 0755 /dev/QUAVERFS${counting} b 7 8
  tgfilesystem=$(cat $a)
  if [ ! -f $tgfilesystem ]; then
    echo "$quaverprefix based on nvram configuration the filesystem is no where to be seen"
    echo "$quaverprefix Attempting to recreate filesystem"
  busybox dd if=/dev/zero of=$tgfilesystem bs=1 count=0 seek=$(cat ${a}_size)
  busybox mkfs.ext2 -F $tgfilesystem
  echo "$quaverprefix Continuing Procedure"
  fi
printf '\e[38;5;039m \n' blue
e2fsck -y $tgfilesystem
echo "$quaverprefix Checking and initializing $tgfilesystem done"
#sleep 0.3
done


#export QUAVERFS_home=${origindir}/qfs_home.img
#export QUAVERFS_usr=${origindir}/qfs_usr.img
#export QUAVERFS_sbin=${origindir}/qfs_sbin.img
#export QUAVERFS_root=${origindir}/qfs_root.img
#export QUAVERFS_etc=${origindir}/qfs_etc.img
#export QUAVERFS_boot=${origindir}/qfs_boot.img
#export QUAVERFS_cacheinst=${origindir}/qfs_cacheinst.img
#export QUAVERFS_pkgcache=${origindir}/qfs_pkgcache.img
#export QUAVERFS_init0=${origindir}/system.img

#dont forget to return
#Mounting ALL filesystem
cd ${origindir}
echo "$quaverprefix Mounting Filesystem..."
echo $pwd
mkdir ${origindir}/system
mkdir ${origindir}/system/${arch}/
#change into mknod losetup Configuration Automation
#init0

#busybox mount -o loop,rw,data=writeback $QUAVERFS_init0 system <--- This is an old argument which we only allowed to mount to /dev/loop1
# The newer mknod losetup allows us to create Custom Device for the q7OS
# /dev/QUAVERFS* devices will be created Depends of how many quaverFS disks configured on the NVRAM



if [ -f ${origindir}/dist/reconstructionflag ]; then
  echo ${sysinitprefix} Building ${arch} Package
  cat ${origindir}/dist/x86_64/x* > ${origindir}/dist/x86_64raw
  cat ${origindir}/dist/arm7/x* > ${origindir}/dist/armv7lraw
  cat ${origindir}/dist/arm8/x* > ${origindir}/dist/aarch64raw
  echo reconstruction Executed
  rm -rf ${origindir}/dist/reconstructionflag
fi









mkdir ${origindir}/system
#mkdir ${origindir}/system/${arch}/
#mkdir ${origindir}/system/${arch}/home
#mkdir ${origindir}/system/${arch}/usr
#mkdir ${origindir}/system/${arch}/sbin
#mkdir ${origindir}/system/${arch}/root
#mkdir ${origindir}/system/${arch}/etc
#mkdir ${origindir}/system/${arch}/boot
#mkdir ${origindir}/system/${arch}/syspkg
#mkdir ${origindir}/system/${arch}/pkgcache

ls ${origindir}/system

losetup /dev/QUAVERFS0 $QUAVERFS_init0
busybox mount -o rw,data=writeback /dev/QUAVERFS0 system


#losetup /dev/QUAVERFS1 $QUAVERFS_home
#busybox mount -o rw,data=writeback /dev/QUAVERFS1 ${origindir}/system/${arch}/home
#busybox mount -o loop,rw,data=writeback $QUAVERFS_home ${origindir}/system/${arch}/home

#losetup /dev/QUAVERFS2 $QUAVERFS_usr
#busybox mount -o rw,data=writeback /dev/QUAVERFS2 ${origindir}/system/${arch}/usr
#busybox mount -o loop,rw,data=writeback $QUAVERFS_usr ${origindir}/system/${arch}/usr


#losetup /dev/QUAVERFS3 $QUAVERFS_sbin
#busybox mount -o rw,data=writeback /dev/QUAVERFS3 ${origindir}/system/${arch}/sbin
#busybox mount -o loop,rw,data=writeback $QUAVERFS_sbin ${origindir}/system/${arch}/sbin

#losetup /dev/QUAVERFS4 $QUAVERFS_root
#busybox mount -o rw,data=writeback /dev/QUAVERFS4 ${origindir}/system/${arch}/root
#busybox mount -o loop,rw,data=writeback $QUAVERFS_root ${origindir}/system/${arch}/root

#losetup /dev/QUAVERFS5 $QUAVERFS_etc
#busybox mount -o rw,data=writeback /dev/QUAVERFS5 ${origindir}/system/${arch}/etc
#busybox mount -o loop,rw,data=writeback $QUAVERFS_etc ${origindir}/system/${arch}/etc


#losetup /dev/QUAVERFS6 $QUAVERFS_boot
#busybox mount -o rw,data=writeback /dev/QUAVERFS6 ${origindir}/system/${arch}/boot
#busybox mount -o loop,rw,data=writeback $QUAVERFS_boot ${origindir}/system/${arch}/boot


#losetup /dev/QUAVERFS7 $QUAVERFS_syspkg
#busybox mount -o rw,data=writeback /dev/QUAVERFS7 ${origindir}/system/${arch}/syspkg
#busybox mount -o loop,rw,data=writeback $QUAVERFS_syspkg ${origindir}/system/${arch}/syspkg

#losetup /dev/QUAVERFS8 $QUAVERFS_pkgcache
#busybox mount -o rw,data=writeback /dev/QUAVERFS8 ${origindir}/system/${arch}/pkgcache
#busybox mount -o loop,rw,data=writeback $QUAVERFS_pkgcache ${origindir}/system/${arch}/pkgcache

ls ${origindir}/system


if [ ! -f ${origindir}/system/installflag ]; then
  ls ${origindir}/system
cp -v ${origindir}/dist/${arch}raw ${origindir}/system/
cd ${origindir}/system
busybox tar -vxf ${arch}raw
ls ${origindir}/system
rm -rf ${arch}raw
echo yes > ${origindir}/system/installflag
cd ${origindir}
else
  if [ ! -f ${origindir}/system/${arch}/bin/bash ] ; then
    clear
    reset
    echo $sysinitprefix System Installation Breaks and cannot continue
    echo $sysinitprefix if you believe this is a bug please refer to q7oslog on your /sdcard
    sleep 3
    umount -rlf system
    rm -rf qfs_*
    rm -rf emulatednvram
    rm -rf ${origindir}/system/installflag
    sync
    echo $sysinitprefix Now system will reset NVRAM and Images and restart
    sleep 4
    reboot
    su -c 'reboot'
    poweroff
    exit
  else
    printf '\e[38;5;042m ' green
  fi
fi


if [ -f $img ]; then
  echo boot file found
  echo Deprecated Filesystem Function Skipping
  echo Superseeded by quaverfs
  #echo Checking Filesystem Integrity
  #e2fsck -y $img
  #echo Mounting System
  #mkdir system
  #busybox chmod 755 system
  #busybox mount -o loop,rw,data=writeback $img system
else
  size=64G
  #size=$(echo $(($(stat -f --format="%a*%S" .)))) #Its job is to fill up the free space of android system
  #size=$(( $size / 2 ))
  echo Deprecated Filesystem Function Skipping
  echo Superseeded by quaverfs
  #busybox dd if=/dev/zero of=$img bs=1 count=0 seek=$size
  #mkdir system
  #busybox chmod 755 system
  #busybox mkfs.ext2 -F $img
  #busybox mount -o loop,rw $img system
  #cp -raL dist/$arch system #method that brokes the system
  echo going into Reconstruction Mode
fi





else
  if [ -d system ]; then
  echo ${compatprefix} Running in severe limited Environtment
  busybox chmod 755 system
  echo ${compatprefix} Continuing to boot with limited mode
else
  echo ${compatprefix} System is not installed yet
  echo ${compatprefix}  all right lets see what can we do in this limited Environtment
  mkdir system
  echo ${compatprefix} Emulating Root
  #https://github.com/sdrausty/termux-archlinux
  #refrencing to Tar Extraction Certificate Access denied Ownership error Workaround
  cp -v dist/${arch}raw ${origindir}/system/
  cd system
  proot_${arch} -0 ${origindir}/reqbin/tar -vxf ${arch}raw
  cd ${origindir}
fi
fi

if [ -f $img ]; then
  echo Detected
else
  echo boot file not found
  echo Did you install busybox and symlink it together?
  echo or did you forcibly run it on non root mode?
fi
#superuser Bridge or android bridge
nohup sh su_bridged &
#origindir=$(pwd)
cp -r ${origindir}/basicpackages ${origindir}/system/$arch
if [ $1 = 'fake64bit' ]; then
cd ${origindir}/system/aarch64
qemu=1



else
  #pass display DENSITY
  wm density > ${origindir}/system/$arch/dpdensity
cd ${origindir}/system/$arch
fi
cd ${origindir}/system/$arch
file=bootflag/on
if [ -f $file ] ;then
echo system has been prepared
else
export PATH=/system/xbin:/system/bin:$PATH
mkdir ${origindir}/system/$arch
cd ${origindir}/system/$arch
mkdir system
mkdir sdcard
mkdir sysfs
mkdir efs
mkdir factory
mkdir data
mkdir d
#rmProtectFunction Preventing rm -rf core and deleting all Mount data
cd ${origindir}
nohup bash ${origindir}/module/fsProtect/rmProtectFunction &
cd ${origindir}/system/$arch
busybox mount --rbind /efs efs
busybox mount --rbind /factory factory
busybox mount --rbind /d d
busybox mount -o remount,rw /data
busybox mount --rbind /dev dev
busybox mount --rbind /sys sys
busybox mount --rbind /system system
busybox mount --rbind /sdcard sdcard
busybox mount --rbind /sysfs sysfs
busybox mount --rbind /data data
busybox mount --rbind /mnt mnt
busybox mount --rbind /run run
busybox mount --rbind /proc proc
#copying identity
for i in /* ; do
  if [ -f /$i ]; then
    echo .
  else
cp -u $i .
fi
done
fi
#dmesg


#Remember This already at system ROOT (q7OS root)
#Transfering Vendor Custom
cd ${origindir}/system/${arch}
cp -r ${origindir}/distrocustomization/masterconf/* .
cp -r ${origindir}/distrocustomization/${arch}/* .
#Revision Version
cp -r ${origindir}/dist/ver .
#transferring CustomBinary
for i in ${origindir}/custombinary/* ;do
  chmod +x $i
  cp -r $i bin/
done
#Linking Custom Services to the SystemFile
cp -r ${origindir}/bootsystemd .
cp -r ${origindir}/module .
cp -r ${origindir}/init .
cp -r ${origindir}/swapforhackedandroid .
cp -r ${origindir}/bootlib/libdisableselinux.so .
cp -r ${origindir}/bootlib/libandroid-shmem.so .

echo "        ___________ _____  ______             _   _             ";
echo "       |___  /  _  /  ___| | ___ \           | | (_)            ";
echo "  __ _    / /| | | \ \`--.  | |_/ / ___   ___ | |_ _ _ __   __ _ ";
echo " / _\` |  / / | | | |\`--. \ | ___ \/ _ \ / _ \| __| | '_ \ / _\` |";
echo "| (_| |./ /  \ \_/ /\__/ / | |_/ / (_) | (_) | |_| | | | | (_| |";
echo " \__, |\_/    \___/\____/  \____/ \___/ \___/ \__|_|_| |_|\__, |";
echo "    | |                                                    __/ |";
echo "    |_|                                                   |___/ ";
echo "                                                                ";
echo "                                                                ";
echo "                                                                ";
echo "                                                                ";
echo "                                                                ";
echo "                                                                ";
echo "                                                                ";
echo "                                                                ";
echo Starting q7os BUILD $(cat dist/ver)
echo Preparing Files..


#Replace With Launching a prootbootloader from orionAI project sequence
#and oh OrionAI is an ongoing AI project that i work internally and in couple of month it will be released as public beta
#Tee Hee ~



trap 'echo q7osterminal are not allowed to quit' SIGINT &
trap 'echo q7osterminal are not allowed to stop' SIGSTOP &
echo $sysinitprefix Locking Session
if [ $limited = '1' ];then

export PATH=bootproot/:$PATH
#cd $(dirname $0)

arch=$(uname -m)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
#command="env PROOT_NO_SECCOMP=1 proot_${arch}"
# The reason that we dont need to set PROOT_NO_SECCOMP again because it is automatically set using emulatedNVRAM at initialization
command="proot_${arch}"
command="$command -0"
command="$command -r ."
if [ -n "$(ls -A binds)" ]; then
    for f in binds/* ;do
      . $f
    done
fi

#busybox mount --rbind /efs efs
#busybox mount --rbind /factory factory
#busybox mount --rbind /d d
#busybox mount -o remount,rw /data
#busybox mount --rbind /dev dev
#busybox mount --rbind /sys sys
#busybox mount --rbind /system system
#busybox mount --rbind /sdcard sdcard
#busybox mount --rbind /sysfs sysfs
#busybox mount --rbind /data data
#busybox mount --rbind /mnt mnt
#busybox mount --rbind /run run
#busybox mount --rbind /proc proc

command="$command -b /efs"
command="$command -b /factory"
command="$command -b /d"
command="$command -b /data"
command="$command -b /sdcard"
command="$command -b /mnt"
command="$command -b /system"
command="$command -b /dev"
command="$command -b /dev"
command="$command -b /sys"
command="$command -b /sysfs"
command="$command -b /run"
command="$command -b /proc"
## uncomment the following line to have access to the home directory of termux
#command="$command -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to /
#command="$command -b /sdcard"
command="$command -w /root"
#command="$command /usr/bin/env -i"
command="$command $ENV -i"
command="$command HOME=/root"
command="$command PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command="$command TERM=$TERM"
command="$command LANG=C.UTF-8"
command="$command /bin/bash /init debug"
com="$@"
exec $command

#goooooooooooooooooooooooooo yay



else


if [ $1 = 'fake64bit' ] ; then
cp -r ../usr/bin/qemu-aarch64 bin
chroot . qemu-aarch64 bash /init debug
else
  if [ $1 = 'dbg']; then
    chroot . /bin/bash
else
chroot . /bin/bash /init debug
fi
fi


exit


fi















#i just lazy to Comment it all xd
