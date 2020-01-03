#!/bin/bash

#folder=$(zenity  --file-selection --title="Choose a directory with your movie" --directory)

folder=`dialog --title "Auto Editor" --stdout --title "Please select a folder that consist of mp4 " --fselect / 14 60`

echo $folder
rm -rf /Assistant/extension/Assistant_autoeditor/input.mp4
rm -rf /Assistant/extension/Assistant_autoeditor/output.mp4
for F in $folder/*.mp4 ; do
    file=$(echo $F | perl -pe 's/mp4$/ts/g')
    echo $file
    if [ -f $file ]
    	then
    		echo File exists Continuing other file
    	else
    		echo Encoding
    		ffmpeg -i ${F} -c copy -bsf:v h264_mp4toannexb -f mpegts $(echo $F | perl -pe 's/mp4$/ts/g');
    fi
done
ffmpeg -i "concat:$(ls -1 $folder/*.ts | perl -0pe 's/\n/|/g;s/\|$//g')" -c copy -bsf:a aac_adtstoasc /Assistant/extension/Assistant_autoeditor/input.mp4
python2 /Assistant/extension/Assistant_autoeditor/autoeditor.py
cp -r final.mp4 /sdcard #just incase
