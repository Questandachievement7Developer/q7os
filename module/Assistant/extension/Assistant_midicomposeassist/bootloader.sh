#!/bin/sh
#extensionLoader!
#echo $1
cd /Assistant/extension/Assistant_midicomposeassist
B=AI_midicomposeassist
#Option=$(zenity --list \
# --title="Musical Menu" \
# --column="Operation" --column="Description" \
#  "generate" "Make new composition by importing all available midi" \
#  "regenerate" "basically generate again with the same style" \
#  "read" "Read preprocessed Composision" )


HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=18

OPTIONS=("generate" "Make new composition by importing all available midi"
  "regenerate" "basically generate again with the same style"
  "read" "Read preprocessed Composision" )
    Option=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)


if [ $Option == "regenerate" ]
then
  #zenity --info --text='Right we will recreate the music based on your style'
  dialog --title "$A" --msgbox 'Right we will recreate the music based on your style' 5 50
  killall -KILL musescore
  python3.5 generate.py
  #python3.5 merge_samples.py
  zenity --info --text='Composition done'
  musescore /Assistant/extension/Assistant_midicomposeassist/final.mid
  cp -r final.midi /Assistant/memory
  cd /Assistant
fi
if [ $Option == "generate" ]
	then
		dialog --title "$A" --msgbox 'Right we will come up with a musical piece based on your style requires 2 samples only' 5 50
		#zenity --info --text='Right we will come up with a musical piece based on your style requires 2 samples only'
		killall -KILL musescore
		echo neuraldbg2 cd into extension composer
    clear
    echo '------[Midi Interfaces]-------'
    arecordmidi -l
    zenity --info --text='First select your midi port Look in the console'
    sleep 5
    Port=$(dialog --title "Midiinterfacer" --inputbox "Type in the midi port" 8 40 2>&1 >/dev/tty))
    rm -rf Music_Midi/*
    mkdir Music_Midi
    dialog --title "$A" --msgbox 'Play your first music' 5 50
    #zenity --info --text='Play your first music'
    arecordmidi -p $Port Music_Midi/midi1.mid &
    sleep 4
    zenity --info --text='press ok if you are done'
    dialog --title "$A" --msgbox 'press ok if you are done' 5 50
    killall -w arecordmidi
    dialog --title "$A" --msgbox 'Play your second music' 5 50
    #zenity --info --text='Play your second music '
    arecordmidi -p $Port Music_Midi/midi2.mid &
    sleep 4
    #zenity --info --text='press ok if you are done'
    dialog --title "$A" --msgbox 'press ok if you are done' 5 50
    killall -w arecordmidi
      zenity --info --text='Doing some mixing'
  	python3.5 generate.py
  	#python3.5 merge_samples.py
  	zenity --info --text='Composition done'
  	musescore /Assistant/extension/Assistant_midicomposeassist/final.mid
  	cp -r final.midi /Assistant/memory
  	cd /Assistant
fi

if [ $Option == "read" ]
		then
			musescore /Assistant/extension/Assistant_midicomposeassist/final.mid
fi
