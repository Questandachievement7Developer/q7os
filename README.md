# q7os ( Questandachievement7OperatingSystem )
An operating system or nested built based on archlinux that designed to unlock devices potential and pushing the device to the limit

[![Build Status](https://travis-ci.org/Questandachievement7Developer/q7os.svg?branch=master)](https://travis-ci.org/Questandachievement7Developer/q7os)

![Logo](https://github.com/Questandachievement7Developer/q7os/blob/master/logo.png)

# Do you want to try modifying and test at the same time on a sandbox?
## Try this q7OS on google colab
> https://colab.research.google.com/drive/11Uy4YL3J6MOWGu-b_8W9zUa3AP8XcElk

# QnA
## What can i use this OS for?
> Anything you want really
## So are you competing with postmarketOS or what?
> Nah were not competing were just inspired to by postmarketOS to bring Linux to any device without the hassle of host bootloader ( if using locked down bootloader device like usual android device)

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

# Tested Devices and its status

| Device                                 | Status                                                         | 
| -------------------------------------- |:--------------------------------------------------------------:|
| Samsung Galaxy Note 10.1 2014          | Running quite stable(Unless user enter a user other than root)  |
| Samsung Galaxy Tab S2                  | Running and rebooting randomly for no appearant reason       |
| Samsung Note FE                        | Running Great and stable but the Heartrate sensor is turning on randomly |
| Dell Latitude E7440 (x86_64 Manjaro Linux)| Running great with no issues                                          |
| Macbook 2011 Late (X86_64 manjaro linux)  | Running great with no issues                                          |
| Raspberry pi 3B                        | Running great but an old MaruchiTarento architechture that this OS was based on     |
| Windows 10 WSL1 (Debian)(AMD A10-9700) Asrock HD320A   | Bootloader running but crashes ( whole computer ) at setup           |
| Asus Vivobook X505Z (Custom Ryzen 5 2500U)    | Running and Overheating                                          |

>This led me to believe that the problem sourced from the custom kernel itself </ br>
>What if we include a function auto build on the q7OS that will make specialized kernel fuse it with the source specific kernel hardware and apply it automagically, that would increase the stability and compatibility to a unprecedented level!

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
For other commands such as for graphics settings, audio settings, Ai settings can be accessed through q7osconfig
and other commands can be found at the wiki


