#!/bin/bash
echo $1
echo Bootloader for Artistic Style 0.2Beta


net=skills.bin
if [ -f $net ] ; then
echo Neural Network Available
else
wget http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat
mv imagenet-vgg-verydeep-19.mat skills.bin
fi





HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=18

OPTIONS=("generate" "Paint new picures for you"
  		 "view" "View latest painting" )
    Option=$(dialog --clear \
                --backtitle "$B" \
                --title "$B" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

if [ $Option == "view" ]
	then
		gthumb /Assistant/extension/Assistant_Artist/result.jpg
		#echo what
fi

if [ $Option == "generate" ]
	then
		echo Bootloader for Artistic Style 0.2Beta
		zenity --info --text='Please select the image that you want to convert into painting'
    FILEconv=`dialog --title "MainImage_selector" --stdout --title "Please choose a file image that you want to convert into painting " --fselect / 14 48`
    case $? in
             0)
                    echo "\"$FILE\" selected.";;
             1)
                    echo "No file selected.";;
            -1)
                    echo "An unexpected error has occurred.";;
    esac
		zenity --info --text='Please select the painting style refrence'
    FILEpainting=`dialog --title "MainImage_selector" --stdout --title "Please choose a file image for a style refrence " --fselect / 14 48`
    case $? in
             0)
                    echo "\"$FILE\" selected.";;
             1)
                    echo "No file selected.";;
            -1)
                    echo "An unexpected error has occurred.";;
    esac
    qualityres=800
    learningrate=10
    quality=1000
    qualityres=$(dialog --title "Quality Slider Option" --inputbox "Enter resolution pixel example 800 or 1000 but beware of the memory usage" 8 40 2>&1 >/dev/tty)
    #qualityres=$(zenity --scale --title "Quality Slider Option" --text "Please Select the resolution of the painting" --min-value=600 --max-value=10000 --value=800)
    #learningrate=$(zenity --scale --title "Quality Slider Option" --text "Please Select the style acceptance intensity of the algorithm" --min-value=1 --max-value=10000 --value=10)
    learningrate=$(dialog --title "Quality Slider Option" --inputbox "Please Select the style acceptance intensity of the algorithm default 10" 8 40 2>&1 >/dev/tty)
    convert "${FILEconv}" -resize ${qualityres}x${qualityres} /Assistant/extension/Assistant_Artist/input.jpg # Downscale Source image
    convert "${FILEpainting}" -resize ${qualityres}x${qualityres} /Assistant/extension/Assistant_Artist/style.jpg # Downscale Artistic Source image
    #quality=$(zenity --scale --title "Quality Slider Option" --text "Please Select the quality of the painting" --min-value=1000 --max-value=10000 --value=1000)
    quality=$(dialog --title "Quality Slider Option" --inputbox "Please Select the quality of the painting default 1000" 8 40 2>&1 >/dev/tty)
    zenity --info --text='Okay yip yip we are going to paint your own art! please wait this take a loong time'
    cd /Assistant/extension/Assistant_Artist
		python3.5 /Assistant/extension/Assistant_Artist/generate.py --content /Assistant/extension/Assistant_Artist/input.jpg --styles /Assistant/extension/Assistant_Artist/style.jpg --output /Assistant/extension/Assistant_Artist/result.jpg --overwrite --iterations "${quality}" --learning-rate ${learningrate}
		gthumb /Assistant/extension/Assistant_Artist/result.jpg
		echo done
fi
