
#clear
mkdir trustzone
export PATH=/usr/local/bin:$PATH
A=$(pwd)
archt=$(uname -m)
pacman -Sy python python2 python-setuptools python2-setuptools base-devel --noconfirm --needed
pacman -S --needed dialog --noconfirm
python3.5 --version
#sleep 4
B="[マルチタレントBootloader_0.13 Helianthus Update] ${archt} version"
#verity trust check
echo $B Checking whole file
mkdir trustzone
/Assistant/trustzone/*.tz -size 0 -print0 |xargs -0 rm --
find /Assistant/trustzone -empty -type f -exec rm '{}' ';'
echo $B For updating OrionAI please reregister whole binary in this folder
 umount /Assistant
    #rm -rf /Assistant
    mkdir /Assistant
    echo $B Allocating Memory
    mount -t tmpfs -o size=128M tmpfs /Assistant
    echo $B Loading memory into memory
    #cp -r --exclude ${A}/locinst ${A} /Assistant
    ln -s ${A}/memory /Assistant
    echo $B Loading Woggle Core V1.2
    ln -s ${A}/bootloader.sh /Assistant
    #ln -s ${A}/installdependencies.py /Assistant
    ln -s ${A}/.buildconfig. /Assistant
    ln -s ${A}/UI.py /Assistant
    ln -s ${A}/neuralprocessing.py /Assistant
    ln -s ${A}/cliui.sh /Assistant
    ln -s ${A}/neuralnetwork.sqlite /Assistant
    echo $B Loading Extension Skills
    ln -s ${A}/extension /Assistant
    ln -s ${A}/nextengine /Assistant
    echo $B Loading Machine Learning Source Folder
    ln -s ${A}/learn_src /Assistant
    echo $B Loading soundfx
    ln -s ${A}/sfx /Assistant
    #mv -v /Assistant/Assistant/* /Assistant
    ln -s ${A}/locinst /Assistant/locinst
    #chmod -R 777 /Assistant
counttotal=0
for i in /Assistant/trustzone/*.tz; do
counttotal=$(($counttotal + 1))
done
count=1
echo Starting flag

if [ $2 == 'untrust' ]; then
echo THIS OPTION IS NOT RECOMENDED
else
for i in /Assistant/trustzone/*.tz; do
if md5sum -c $i --quiet ; then
count=$(($count + 1))
percent=$(( ( $count * 100 ) / $counttotal ))
if ! (( $percent % 5 )) ; then
dialog --title "$B" --gauge "Booting OrionAI" 7 70 $percent &
fi
#echo $B Checking trusted binary... $i
else
sleep 2
clear
killall -KILL dialog
echo $B Fatal Error Has been occoured and AI execution cannot continues
echo "ERROR SOURCE MODULE : $i"
sleep 4
reset
exit
fi
done
fi

clear
echo $B Trustzone passed

#pacman -S zenity --needed
#apt-get install zenity
fileverf=/instdone
Option=$1
additionalparam=$2
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=18

if [ "$EUID" -ne 0 ]
  then
    echo "$B  running as nonroot"
    echo "$B  Failed to execute command exitting..."
    exit
fi

if [ -f $fileverf ]; then
  echo $B installed and verified
else
  echo $B Install state is unverified
  sleep 4
  rm -f /var/lib/pacman/db.lck
  echo $B Preparing Orion Dependencies
  echo $B Syncronizing Dependencies
  umount /Assistant
  #rm -rf /Assistant
  mkdir /Assistant
  cd /Assistant
  ln -s ${A}/memory /
  ln -s ${A}/extension /Assistant/extension
  ln -s ${A}/locinst /Assistant/locinst
  ln -s ${A}/installdependencies.py /Assistant
  chmod -R 777 /Assistant
  bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
  python2 installdependencies.py
  echo $B Cleaning Setup
  bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh stop
  ##swapoff -a
  exit
fi

#menuclistart

if [ $Option == "menu" ]
  then
### display main menu ###

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=18
BACKTITLE="Backtitle here"
TITLE="Title here"

OPTIONS=("boot" "basically to boot the Maruchi Tarento in a complete way"
"neuralserverdbg" " basically only boot the neuralserver and debug it"
"chathumaninterface" "Human socializing interface"
"skillboot" "basically to boot the Maruchi Tarento Skills"
"unload" "Unload most of the process from the memory"
"boost" "Boost orionAI performance to its newest state"
"resetmemory" "reset orion knowledge"
"trustrevalidate" "revalidate trust"
"install" "Install necessarry dependencies to run"
"memhack" "Taste the exploiting tools of memory extension module"
"mountdev" "developer testing mount"
"importdependencies" "update python2 and python3 local dependencies"
"customentry" "send custom command to Orion" )

Option=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)



fi

if [ $Option == "trustrevalidate" ] ; then
echo Please wait this may take 30 minutes
rm -rf /Assistant/trustzone
mkdir /Assistant/trustzone
counttotal=0
for i in $(find /Assistant/memory); do
counttotal=$(($counttotal + 1))
done
count=1
reset
for i in $(find /Assistant/memory); do
count=$(($count + 1))
percent=$(( ( $count * 100 ) / $counttotal ))
echo "Systemfile registered $count / $counttotal"
echo "Process progress $percent %"
md5sum $i > /Assistant/trustzone/$count.tz
#cat /Assistant/trustzone/$count.tz
done

clear
echo $B orion trustzone has been registered
sleep 4
bash /Assistant/bootloader.sh menu untrust
fi

if [ $Option == "menuaa" ]
  then
    Option=$(zenity --list \
     --title="maruchitarento Bootloader Menu 0.7 rc1" \
     --column="Operation" --column="Description" \
      "boot" "basically to boot the Maruchi Tarento" \
      "skillboot" "basically to boot the Maruchi Tarento Skills" \
      "unload" "Unload most of the process from the memory" \
      "install" "Install necessarry dependencies to run" \
      "memhack" "Taste the hacking memory extension module" \
      "rpisetup" "same as install but having a special procedures for arm based device" \
      "mountdev" "developer testing mount" \
      "importdependencies" "update python2 and python3 local dependencies" \
      "compile" "compile current orion version as a distributeable package" \
      "customentry" "send custom command to Orion"
      "reload" "Reload New Configuration and reopens the boot menu")
      echo $Option
fi

if [ $Option == "customentry" ]
	then
	echo -n "orionboot> "
	read Option
fi

if [ $Option == "skillboot" ]
  then
  	bash bootloader.sh mountdev
    OPTIONS=("Painter" "MaruchiTarento painting skills"
      "AutoEdit" "Maruchi Tarento Editing Skills"
      "ComposeAssist" "Maruchi Tarento Helping Composing skills"
      "Composer" "Compose Music using existing midi"
      "LiteratureGenerator" "basically generate literature"
      "LiteratureGeneratorPorted" "same as above butmore faster")
    Option=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

    echo $Option
    sleep 2
      if [ $Option == "Painter" ]
      	then
      		bash /Assistant/extension/Assistant_Artist/bootloader.sh
      		bash /Assistant/bootloader.sh menu untrust
      fi
      if [ $Option == "AutoEdit" ]
      	then
      		bash /Assistant/extension/Assistant_autoeditor/bootloader.sh
      		bash /Assistant/bootloader.sh menu untrust
      fi
      if [ $Option == "ComposeAssist" ]
      	then
      		bash /Assistant/extension/Assistant_midicomposeassist/bootloader.sh
      		bash /Assistant/bootloader.sh menu untrust
      fi
      if [ $Option == "Composer" ]
      	then
      		bash /Assistant/extension/Assistant_Composer/bootloader.sh
      		bash /Assistant/bootloader.sh menu untrust
      fi
      if [ $Option == "LiteratureGenerator" ]
      	then
      		bash /Assistant/extension/Assistant_LiteratureGenerator/bootloader.sh
      		bash /Assistant/bootloader.sh menu untrust
      fi
      if [ $Option == "LiteratureGeneratorPorted" ]
         then
                bash /Assistant/extension/Assistant_LiteratureGenerator_Ported/bootloader.sh
		bash /Assistant/bootloader.sh menu untrust
	fi
  bash /Assistant/bootloader.sh menu untrust
fi

if [ $Option == "importdependencies" ]
  then
  	cp -rv /usr/lib/python2.7/site-packages/* locinst/python2repo
  	cp -rv /usr/lib/python3.7/site-packages/* locinst/python3repo
  	zenity --info --text='Syncronizing Dependencies successfull!'
  	exit
fi
if [ $Option == "mountdev" ]
  then
    umount /Assistant
    #rm -rf /Assistant
    mkdir /Assistant
    echo $B Allocating Memory
    mount -t tmpfs -o size=128M tmpfs /Assistant
    echo $B Loading memory into memory
    #cp -r --exclude ${A}/locinst ${A} /Assistant
    ln -s ${A}/memory /Assistant
    echo $B Loading Woggle Core V1.2
    ln -s ${A}/bootloader.sh /Assistant
    #ln -s ${A}/installdependencies.py /Assistant
    ln -s ${A}/.buildconfig. /Assistant
    ln -s ${A}/UI.py /Assistant
    ln -s ${A}/core /Assistant
    ln -s ${A}/neuralprocessing.py /Assistant
    ln -s ${A}/cliui.sh /Assistant
    ln -s ${A}/neuralnetwork.sqlite /Assistant
    echo $B Loading Extension Skills
    ln -s ${A}/extension /Assistant
    ln -s ${A}/nextengine /Assistant
    echo $B Loading Machine Learning Source Folder
    ln -s ${A}/learn_src /Assistant
    echo $B Loading soundfx
    ln -s ${A}/sfx /Assistant
    #mv -v /Assistant/Assistant/* /Assistant
    ln -s ${A}/locinst /Assistant/locinst
    chmod -R 777 /Assistant
    echo $B Assuming Memory load successfully executed
    echo $B Booting Ramdisk..
    echo $B Hacking Memory...
    bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
    zenity --info --text='dev_mounted!' &
    exit
fi

if [ $Option == "compile" ]
  then
    echo --------------------------------
    echo $B Maruchi tarento compiler
    echo target architecture : ALL
    echo Container : autoCompability x86 crossplatform arm
    echo --------------------------------
    sleep 4
    rm -rf orionpkg
    rm -rf memory/memcache
    rm -rf memory/voicedata/
    mkdir memory/voicedata
    mkdir orionpkg
    mkdir orionpkg/img
# Copy all required runtime file Edit this is you feel it is necessarry
    cp -rv memory orionpkg/img
    cp -rv extension orionpkg/img
    cp -rv locinst orionpkg/img
    cp -rv nextengine orionpkg/img
    cp -rv sfx orionpkg/img
    cp -rv bootloader.sh orionpkg/img
    cp -rv installdependencies.py orionpkg/img
    cp -rv neuralprocessing.py orionpkg/img
    cp -rv start orionpkg
    cp -rv UI.py orionpkg/img
#Archivaltime Image creation
    tar -zcvf orionpkg/bin orionpkg/img/
    rm -rf orionpkg/img
#Archivaltime Dist archive creation
    tar -zcvf orion.tar.gz orionpkg/
    chmod -R 777 orion.tar.gz
#done
#Clean
    rm -rf orionpkg
    zenity --info --text='ready to distribute' &
    exit
fi

if [ $Option == "help" ]
  then
    echo $B List of available command
    echo Well since you are in here how about you dig around with the bootloader script
    exit
fi
if [ $Option == "memhack" ]
  then
    mkdir /Assistant
    ln -s ${A}/extension /Assistant
    echo $B Loading partially extension skills
    bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
fi

if [ $Option == "boost" ]
  then
    echo $B cleaning...
    rm -rf memory/deffered/*
    mkdir memory/deffered
fi

if [ $Option == "rpisetup" ]
  then
    mkdir /Assistant
    ln -s ${A}/bootloader.sh /Assistant
    apt-get update
    apt-get install upgrade
    apt-get install plasma-desktop
    cd /tmp
    wget https://nodejs.org/dist/v8.2.1/node-v8.2.1-linux-armv7l.tar.xz
    tar xfv node-v8.2.1-linux-armv7l.tar.xz
    cd node-v8.2.1-linux-armv7l
    cp -R * /usr/local/
    npm install -g electron@1.6.11 --unsafe-perm=true --allow-root
    bash /Assistant/bootloader.sh install
fi

if [ $Option == "reload" ]
  then
    killall -KILL python3
    killall -KILL python2
    killall -KILL orionAI
    echo $B Liberating memory address
    bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh stop
    #umount /Assistant
    ##rm -rf /Assistant
    bash /Assistant/bootloader.sh
fi
if [ $Option == "upload" ]
  then
    echo $B Loading Disk into memory
    #cp -r --exclude ${A}/locinst ${A} /Assistant
    echo $B Loading Woggle Core V1.2
    ln -s ${A}/bootloader.sh /Assistant
    #ln -s ${A}/installdependencies.py /Assistant
    ln -s ${A}/.buildconfig. /Assistant
    ln -s ${A}/neuralprocessing.py /Assistant
    ln -s ${A}/neuralnetwork.sqlite /Assistant
    echo $B Loading Extension Skills
    ln -s ${A}/extension /Assistant
    echo $B Loading Machine Learning Source Folder
    ln -s ${A}/learn_src /Assistant
    echo $B Loading soundfx
    ln -s ${A}/sfx /Assistant
    exit
fi
if [ $Option == "unload" ]
  then
  	killall -KILL python3
    killall -KILL python2
    killall -KILL httrack
    killall -KILL html2text
    echo $B Liberating memory address
    bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh stop
    umount /Assistant
    #rm -rf /Assistant
    #swapoff -a
    exit
fi
if [ $Option == "import" ]
  then
    echo $B Dumping all memory to disk
    cp -r /Assistant/ ${A}
    exit
fi
if [ $Option == "install" ]
  then
    rm -f /var/lib/pacman/db.lck
    pacman -Sy python python2 python-setuptools python2-setuptools --noconfirm --needed
    echo $B Preparing Orion Dependencies
    echo $B Syncronizing Dependencies
    umount /Assistant
    #rm -rf /Assistant
    mkdir /Assistant
    cd /Assistant
    ln -s ${A}/memory /
    ln -s ${A}/extension /Assistant/extension
    ln -s ${A}/locinst /Assistant/locinst
    ln -s ${A}/installdependencies.py /Assistant
    chmod -R 777 /Assistant
    bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
    python2 installdependencies.py
    python2 installdependencies.py
    echo $B Cleaning Setup
    bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh stop
    ##swapoff -a
    exit
fi

if [ $Option == "neuralserverdbg" ]
  then
    echo $B Initializing neural server
    cp -r ${A}/locinst/.bashrc /home/orion/.bashrc
    #cp -r ${A}/output.wav /home/orion/.bashrc
    #cp -r ${A}/output0.wav /home/orion/.bashrc
    A=$(pwd)
    echo $B $Option
    sleep 2
    echo $B Preparing Compatibility Container...
    FILE=/Assistant/neuralprocessing.py
    if [ -f $FILE ]; then
      bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
      echo $B Boot device Found!
      echo $B Continuing booting
    else
      #intialize Ramdisk
      umount /Assistant
      #rm -rf /Assistant
      mkdir /Assistant
      echo $B Allocating Memory
      mount -t tmpfs -o size=128M tmpfs /Assistant
      echo $B Loading memory into memory
      #cp -r --exclude ${A}/locinst ${A} /Assistant
      ln -s ${A}/memory /Assistant
      echo $B Loading Woggle Core V1.2
      ln -s ${A}/bootloader.sh /Assistant
      ln -s ${A}/cliui.sh /Assistant
      #ln -s ${A}/installdependencies.py /Assistant
      ln -s ${A}/.buildconfig. /Assistant
      ln -s ${A}/UI.py /Assistant
      ln -s ${A}/core /Assistant
      ln -s ${A}/neuralprocessing.py /Assistant
      ln -s ${A}/neuralnetwork.sqlite /Assistant
      echo $B Loading Extension Skills
      ln -s ${A}/extension /Assistant
      ln -s ${A}/nextengine /Assistant
      echo $B Loading Machine Learning Source Folder
      ln -s ${A}/learn_src /Assistant
      echo $B Loading soundfx
      ln -s ${A}/sfx /Assistant
      #mv -v /Assistant/Assistant/* /Assistant
      ln -s ${A}/locinst /Assistant/locinst
      chmod -R 777 /Assistant
      echo $B Assuming Memory load successfully executed
      echo $B Booting Ramdisk..
      echo $B Hacking Memory...
      echo $B starting deffered Background process...
      defferedprocess="/Assistant/memory/deffered"
      countdeffered=0
      for run in ${defferedprocess}/*.sh; do
        bash ${run} > /Assistant/memory/defferedprocesslog.txt 2>&1 &
        countdeffered=$(( $countdeffered + 1 ))
        echo $B $countdeffered deffered process has be launched
        sleep 0
      done
      bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
    fi
    cd /Assistant
    mkdir /Assistant/runtimelog
    runtimeid=$( date +%s )
    echo $B 'hello, hi' > /Assistant/bootmsg.txt
    mimic /Assistant/bootmsg.txt &
    rm /Assistant/bootmsg.txt
    pacman -S python2 python3 --needed
    #python need an elevated access to access a hardware or emulation thingy (eg. keyboard stuff)
    #suudo pyython2 /AssistantI/neeuralprocessing.pyy
    chmod -R 777 /home/orion
    mkdir /home/orion
    mkdir /home/orion/.local
    mkdir /home/orion/.cache
    mkdir /home/orion/.local/share
    #-u orion cool-retro-term
    python2 /Assistant/UI.py &

    #cd /Assistant/nextengine/orionUI
    #npm start &
    echo $B Booting nextengine UI
    sleep 4
    cd /Assistant
    #suudo mkdir
    #clear
    python2 /Assistant/neuralprocessing.py
    bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh stop &
    #swapoff -a
    dialog --title "$A" --msgbox "Whoa did Orion server crashed or just stopped?" 5 50
    #zenity --error --text='Server Stopped and Maruchi Tarento no longer respond' &
    counttotal=0
    for i in $(find /Assistant/memory); do
    counttotal=$(($counttotal + 1))
    done
    count=1
    reset
    for i in $(find /Assistant/memory); do
    count=$(($count + 1))
    percent=$(( ( $count * 100 ) / $counttotal ))
    echo "Systemfile registered $count / $counttotal"
    echo "Process progress $percent %"
    md5sum $i > /Assistant/trustzone/$count.tz
    #cat /Assistant/trustzone/$count.tz
    done
    killall -KILL python3
    killall -KILL orionAI
    killall -KILL python2
    exit
fi
if [ $Option == "boot" ]
  then
    echo $B Initializing
    cp -r ${A}/locinst/.bashrc /home/orion/.bashrc
    #cp -r ${A}/output.wav /home/orion/.bashrc
    #cp -r ${A}/output0.wav /home/orion/.bashrc
    A=$(pwd)
    echo $B $Option
    sleep 2
    echo $B Preparing Compatibility Container...
    FILE=/Assistant/neuralprocessing.py
    if [ -f $FILE ]; then
      bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
      echo $B Boot device Found!
      echo $B Continuing booting
    else
      #intialize Ramdisk
      umount /Assistant
      #rm -rf /Assistant
      mkdir /Assistant
      echo $B Allocating Memory
      mount -t tmpfs -o size=128M tmpfs /Assistant
      echo $B Loading memory into memory
      #cp -r --exclude ${A}/locinst ${A} /Assistant
      ln -s ${A}/memory /Assistant
      echo $B Loading Woggle Core V1.2
      ln -s ${A}/bootloader.sh /Assistant
      ln -s ${A}/cliui.sh /Assistant
      #ln -s ${A}/installdependencies.py /Assistant
      ln -s ${A}/.buildconfig. /Assistant
      ln -s ${A}/UI.py /Assistant
      ln -s ${A}/core /Assistant
      ln -s ${A}/neuralprocessing.py /Assistant
      ln -s ${A}/neuralnetwork.sqlite /Assistant
      echo $B Loading Extension Skills
      ln -s ${A}/extension /Assistant
      ln -s ${A}/nextengine /Assistant
      echo $B Loading Machine Learning Source Folder
      ln -s ${A}/learn_src /Assistant
      echo $B Loading soundfx
      ln -s ${A}/sfx /Assistant
      #mv -v /Assistant/Assistant/* /Assistant
      ln -s ${A}/locinst /Assistant/locinst
      chmod -R 777 /Assistant
      echo $B Assuming Memory load successfully executed
      echo $B Booting Ramdisk..
      echo $B Hacking Memory...
      echo $B starting deffered Background process...
      defferedprocess="/Assistant/memory/deffered"
      countdeffered=0
      for run in ${defferedprocess}/*.sh; do
        bash ${run} > /Assistant/memory/defferedprocesslog.txt 2>&1 &
        countdeffered=$(( $countdeffered + 1 ))
        echo $B $countdeffered deffered process has be launched
        sleep 0
      done
      bash /Assistant/extension/Assistant_MemoryExtender/lzo.sh start
    fi
    cd /Assistant
    mkdir /Assistant/runtimelog
    runtimeid=$( date +%s )
    echo $B 'hello, hi' > /Assistant/bootmsg.txt
    mimic /Assistant/bootmsg.txt &
    rm /Assistant/bootmsg.txt
    pacman -S python2 python3 --needed
    #python need an elevated access to access a hardware or emulation thingy (eg. keyboard stuff)
    #suudo pyython2 /AssistantI/neeuralprocessing.pyy
    chmod -R 777 /home/orion
    mkdir /home/orion
    mkdir /home/orion/.local
    mkdir /home/orion/.cache
    mkdir /home/orion/.local/share
    #-u orion cool-retro-term
    python2 /Assistant/UI.py &

    #cd /Assistant/nextengine/orionUI
    #npm start &
    echo $B Booting Neurral Server
    sleep 4
    cd /Assistant
    #suudo mkdir
    #clear
    echo $B Neural Server Is RUNNING
    python2 /Assistant/neuralprocessing.py > /dev/null 2>&1 &
    counttotal=0
    for i in $(find /Assistant/memory); do
    counttotal=$(($counttotal + 1))
    done
    count=1
    reset
    for i in $(find /Assistant/memory); do
    count=$(($count + 1))
    percent=$(( ( $count * 100 ) / $counttotal ))
    echo "Systemfile registered $count / $counttotal"
    echo "Process progress $percent %"
    md5sum $i > /Assistant/trustzone/$count.tz
    #cat /Assistant/trustzone/$count.tz
    done


    #swapoff -a
    dialog --title "$A" --msgbox "Neural Server Has been launched" 5 50
    #zenity --error --text='Server Stopped and Maruchi Tarento no longer respond' &
	bash bootloader.sh menu untrust
fi
#clear
sleep 2
if [ $Option == "customentry" ]
	then
  python3.5 --version
  bash bootloader.sh customentry
fi
echo debug bootloader





echo $B Unknown command
exit
