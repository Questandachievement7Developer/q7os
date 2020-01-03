#!/bin/sh
#extensionLoader!
#echo $1

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=18

OPTIONS=("generate" "Make new composition by importing all available midi" \
  "read" "Read preprocessed Composision" )
    Option=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)


if [ $Option == "generate" ]
	then
		#zenity --info --text='Right we will come up with a musical piece it might take ~4 minutes or more depending on the complexity'
		 dialog --title "$A" --msgbox 'Right we will come up with a musical piece it might take ~4 minutes or more depending on the complexity' 5 50
		killall -KILL musescore
		echo neuraldbg2 cd into extension composer
	  	cd /Assistant/extension/Assistant_Composer/models
 		  cp -r **/*.config .
  		mv *.config 1.config
      cp -r /**/*.midi Music_Midi
      find . -name /\*.mid -exec cp {} Music_Midi \;
  		cd /Assistant/extension/Assistant_Composer
  		python3.5 generate.py
  		#python2 merge_samples.py
  		 dialog --title "$A" --msgbox 'Composition done' 5 50
  		#zenity --info --text='Composition done'
  		musescore /Assistant/extension/Assistant_Composer/final.mid
  		cp -r final.midi /Assistant/memory
  		cd /Assistant
fi

if [ $Option == "read" ]
		then
			musescore /Assistant/extension/Assistant_Composer/final.mid
fi
