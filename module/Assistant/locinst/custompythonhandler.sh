#!/bin/bash
#whaaaaaat thankyyyouuuuuu
# i was depressed when started to build that i never
#https://help.dreamhost.com/hc/en-us/articles/115000702772-Installing-a-custom-version-of-Python-3
echo Installing python custom python3 version
builddir='/Assistant/locinst/python35'
pythoninstfile='/Assistant/locinst/pythoninst'
rm -rf $builddir
mkdir $builddir
cd $builddir
pwd
sleep 4
cd $builddir
wget https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tgz
tar zxvf Python-3.5.6.tgz
cd $builddir/Python-3.5.6
pacman -S --needed --noconfirm openssl
bash configure
LDFLAGS=-L/usr/lib/openssl-1.0 CFLAGS="-DOPENSSL_NO_SSL3 -I/usr/include/openssl-1.0" make
#LDFLAGS=-L/usr/lib/openssl-1.0 CFLAGS="-DOPENSSL_NO_SSL3 -I/usr/include/openssl-1.0" make test
echo Install
sleep 5
LDFLAGS=-L/usr/lib/openssl-1.0 CFLAGS="-DOPENSSL_NO_SSL3 -I/usr/include/openssl-1.0" make install
export PATH=/usr/local/bin:$PATH
#echo export PATH=/usr/local/bin:$PATH >> ~/.bashrc
#export PATH=/usr/local/bin
python3.5 --version
echo installing basic stuff
#for setuptools
curl -sL --insecure https://bootstrap.pypa.io/get-pip.py | python3.5 -
#cd $pythoninstfile/setuptools
#python3.5 bootstrap.py
#python3.5 setup.py install
#cd $pythoninstfile/pip
#python3.5 setup.py install
#cd $pythoninstfile/six
#python3.5 setup.py install
#cd $pythoninstfile/cffi
#python3.5 setup.py install
#cd $pythoninstfile/cryptography
#python3.5 setup.py install
#cd $pythoninstfile/ssl
#python3.5 setup.py install







#hey there! if you want to unistall this you can just type command whereis python3.5
#then delete everything that whereis spits out

echo meoww
cd /Assistant
