#!/bin/sh
#extensionLoader!
#echo $1
B='Literature Generation'

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=18

OPTIONS=("generate" "Make New Literature based on Existing Writer"
  "train" "Train orion to learn new style and knowledge"
  "exit" "exit"
  "reset" "reset all data literally delete everything"
  "read" "Read preprocessed Literature Composision" )
    Option=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)


if [ $Option == "reset" ]
	then
		dialog --title "$A" --msgbox 'If you click OK your previous work will be deleted!' 5 50
		#zenity --warning --text='If you click OK your previous work will be deleted!'
    rm -rf data/artists/*
    mkdir data/artists
fi
if [ $Option == "generate" ]
	then
		echo neuraldbg2 cd into extension composer
      OPTIONS=("Slot1" "Make New Literature based on Existing Writer Slot 1"
      "Slot2" "Make New Literature based on Existing Writer Slot 2"
      "Slot3" "Make New Literature based on Existing Writer Slot 3"
      "Slot4" "Make New Literature based on Existing Writer Slot 4"
      "Slot5" "Make New Literature based on Existing Writer Slot 5"
      "Slot6" "Make New Literature based on Existing Writer Slot 6"
      "Slot7" "Make New Literature based on Existing Writer Slot 7"
      "Slot8" "Make New Literature based on Existing Writer Slot 8"
      "Slot9" "Make New Literature based on Existing Writer Slot 9"
      "Slot10" "Make New Literature based on Existing Writer Slot 10" )
   		 SlotSelection=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
	  	cd /Assistant/extension/Assistant_LiteratureGenerator/code
	  dialog --title "$A" --msgbox 'Generating...' 5 50
      #zenity --info --text='Generating...'
      sleep 4
      echo '10'
      echo '# Outputing Words'
      python3.5 runner.py -a $SlotSelection -l ../save/models/$SlotSelection/$SlotSelection.ckpt-10000 -t /Assistant/extension/Assistant_LiteratureGenerator/final.txt
      echo '60' ; sleep 3
      echo '# Finalizing'
      cd /Assistant/extension/Assistant_LiteratureGenerator
      echo '100' ; sleep 3
      echo '# done'
      dialog --title "$A" --msgbox 'Done!' 5 50
fi

if [ $Option == "read" ]
		then
			nano /Assistant/extension/Assistant_LiteratureGenerator/final.txt
fi

if [ $Option == "exit" ]
		then
			exit
fi

if [ $Option == "train" ]
		then
      zenity --info --text='Select your save slot'
      OPTIONS=("Slot1" "Make New Literature Model based on Existing Writer Slot 1" \
        "Slot2" "Make New Literature Model based on Existing Writer Slot 2"
        "Slot3" "Make New Literature Model based on Existing Writer Slot 3"
        "Slot4" "Make New Literature Model based on Existing Writer Slot 4"
        "Slot5" "Make New Literature Model based on Existing Writer Slot 5"
        "Slot6" "Make New Literature Model based on Existing Writer Slot 6"
        "Slot7" "Make New Literature Model based on Existing Writer Slot 7"
        "Slot8" "Make New Literature Model based on Existing Writer Slot 8"
        "Slot9" "Make New Literature Model based on Existing Writer Slot 9"
        "Slot10" "Make New Literature Model based on Existing Writer Slot 10" )
      SlotSelection=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
      cd /Assistant/extension/Assistant_LiteratureGenerator
      mkdir data/artists/$SlotSelection
      cd data/artists/$SlotSelection
      dialog --title "$A" --msgbox 'Copy paste the Literature to the text editor when the editor pops open' 5 50
      #zenity --info --text='Copy paste the Literature to the text editor when the editor pops open'
      nano Literature.txt
      #zenity --info --text='okay Training sequence initiated'
      dialog --title "$A" --msgbox 'okay Training sequence initiated' 5 50
      cd /Assistant/extension/Assistant_LiteratureGenerator/code
      echo '# Learning Vocabularies and Grammar '
      #echo '4' ; sleep 1 ; echo '24' ; sleep 1 ; echo '37' ; sleep 1 ; echo '44' ; sleep 1 ; echo '47' ; sleep 1
      #echo '50' ; sleep 4 ; echo '50' ; sleep 65 ; echo '54' ; sleep 33 ; echo '56' ; sleep 44 ; echo '59' ; sleep 41 ; echo '60' ; sleep 4 ;
      python3.5 runner.py -a $SlotSelection -m $SlotSelection
      killall -w python3.5
      echo '# Saving State'
      echo '70' ; sleep 4
      pwd
      cd /Assistant/extension/Assistant_LiteratureGenerator
      echo '100' ; sleep 3
      echo '# done'
      dialog --title "$A" --msgbox 'Done!' 5 50
fi
#base command for generate python3.5 runner.py -a linkin_park -l ../save/models/lp_model/linkin_park.ckpt-10000 -t
#base command for train python3.5 runner.py -a linkin_park -m lp_model
bash bootloader.sh
