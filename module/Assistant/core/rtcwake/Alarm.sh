systemctl enable atd
systemctl start atd
echo 'Example formatting Alarm.sh [today|tommorow|anyday] [time]' 

Day=$1
time=$2


#example
#dateitiswoke=$(date -d "today 22:06" %s)
#soundtime="22:06"

dateitiswoke=$(date -d "$Day $time" +%s)
soundtime="$time"

rtcwake -m no -t $dateitiswoke
echo "play sound.mp3 repeat 99" | at $soundtime
