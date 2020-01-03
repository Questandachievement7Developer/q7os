#!/bin/bash
archt=$(uname -m)
echo detecting cpu
cd /Assistant/locinst
builddir='/Assistant/locinst/epicbuilder'
pacman -S git --noconfirm --overwrite '*' --needed
mkdir $builddir
if [ $archt == 'aarch64' ]; then
  echo detected Embbedded device
  echo Unsupported device port routine has been started
  echo since this is unsupported device we going to force to just run the software
  echo Cheers
  echo there is a big chance that this is running on restricted device with no Access with the system whatsoever
  echo Lets try the traditional python way
  curl -sL --insecure https://bootstrap.pypa.io/get-pip.py | python3.5 -
  curl -L https://github.com/lherman-cs/tensorflow-aarch64/releases/download/r1.4/tensorflow-1.4.0rc0-cp35-cp35m-linux_aarch64.whl > /tmp/tensorflow-1.4.0rc0-cp35-cp35m-linux_aarch64.whl
  python3.5 -m pip install /tmp/tensorflow-1.4.0rc0-cp35-cp35m-linux_aarch64.whl
  #ramclearance
	stdmult=2
	echo Preparing Memory for epic compilation
	echo doing some hacky clearing method
	echo This is inspired by windows program called memory cleaner
	for cycle in {1..1000..100} ; do
	Percentage=$(( $cycle / 100 ))
	memclsmult=$(( $cycle * 2 ))
	echo Preparing memory $Percentage
	stress -m $memclsmult -t 1 > /dev/null 2>&1
	done
  pacman -S --noconfirm lshw --needed --overwrite '*'
  lshw
  #Ultimate thanks to https://collaborate.linaro.org/display/BDTS/Building+and+Installing+Tensorflow+on+AArch64
  #cd $builddir
  #Porting JDK to aarch64
  pacman -Sy --noconfirm
  #echo Installing JDK on this unsupported device
  pacman -S jdk8-openjdk --noconfirm --needed --overwrite '*'
  #echo Installing
  pacman -S python-wheel --noconfirm --needed --overwrite '*'
  #echo Building Bazel On this totally unsupported device
  pacman -S unzip python2-pkgconfig python-pkgconfig zlib --noconfirm --needed --overwrite '*'
  #echo bazelengine_aarch64 is building
  #wget https://github.com/bazelbuild/bazel/releases/download/0.5.4/bazel-0.5.4-dist.zip
  #mkdir $builddir/bazelbuild
  #cp -rv /Assistant/locinst/bazelengine_aarch64 $builddir
  #cd $builddir/bazelengine_aarch64
  #bash compile.sh
  #cp -rv output/bazel /usr/local/bin/
  #echo Building Tensorflow on this unsurpported devices
  #cd $builddir
  #git clone https://github.com/tensorflow/tensorflow.git
  #cd $builddir/tensorflow
  #bash configure
  #bazel build -c opt --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" --verbose_failures tensorflow/tools/pip_package:build_pip_package
  #bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
  for a in /tmp/tensorflow_pkg/tensorflow*.whl; do
  python2 -m pip install $a
  python3 -m pip install $a
  done
  rm -rf $builddir
  echo its done and it will probably fails
  sleep 10
  exit

else
  echo $archt architechture detected this is not for your device
  exit
fi
