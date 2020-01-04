# q7os
An operating system or nested built based on archlinux that designed to unlock devices potential and pushing the device to the limit
## What can i use this OS for?
> Anything you want really

## Here what you need to know about q7OS in current state
1. q7OS will be available in the github this week and the filesize is around (1.5GB in total yes thats the source)
2. q7OS will able to run on almost any of these architechture ( armv7 armv8 x86_64 )
3. q7OS have an built in experimental windows x86_64 win32 app runner although it is still a stub code
4. q7OS will adapt based on the hardware of what you choose (Literally import drivers for example from your android device)
5. q7OS include an MaruchiTorento AI which is an modular AI (yes develop anything in it)
6.  q7OS having a problem accessing framebuffer device so it uses xserverxsdl 
7. Theoreatically it should be able to run without root permission but proot does not work at the moment 
8. At root mode or normal mode q7OS will store data using qfs system that based on ext2
9. At proot or non normal mode q7OS will only store data on a folder
10. q7OS might crash your device using GNU/Linux machine or even just WSL (might be kernel disagreement)
11. q7OS will translates openGLES 2.1 to openGL 2.1 (or any setting below it) (This can be changed through q7ossettings command)
12. Currently q7OS only run at chroot container not yet host mode ( Not even proot mode )
Of course you are free to ask me about its specifical details of q7OS

# OS Usages
## Bootloader
You can install the system by using the precompiled shell package on release tab! or you can git clone this repository and do
> sudo sh bootloader.sh compile <br /> 
> sudo sh ../install.sh <br /> 
**Note: To change install directory, you have to change HOME Variable**
### Launch the OS
> sudo sh startq7os
### Other commands
For other commands that available for the bootloader, you can do 
> sudo sh bootloader.sh help

## System commands
For other commands such as for graphics settings, audio settings, Ai settings can be accessed through q7ossetting
and other commands can be found at the wiki


