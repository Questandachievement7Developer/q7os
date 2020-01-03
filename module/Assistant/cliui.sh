#!/bin/bash
A='CLIUI'
msgrecieve=$(cat /Assistant/recieve.txt)
    if [ $msgrecieve == 'NAN' ]
      then
        msgrecieve='No message recieved'
        #dialog --title "$A" --msgbox "$msgrecieve" 5 50
      else
        if [ $msgrecieve == '' ]  
          then
            echo skipping recieve
          else
            dialog --title "Orion Says" --msgbox "$msgrecieve" 5 50
        #sleep 5
       fi
    rm /Assistant/recieve.txt
    fi
#dialog --title $A --msgbox 'Project MaruchiTarento Developed by questandachievement7' 5 50
  msgsend=$(dialog --title "Message sender" --inputbox "Send Message to Orion" 8 40 2>&1 >/dev/tty)
  echo $msgsend > /Assistant/send.txt
