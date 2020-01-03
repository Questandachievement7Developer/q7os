#!/bin/bash
cachednodeid=${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}
idseed=knowledge_bgproc${RANDOM}
echo $1
echo digging for $1
ask="$1"
#cache check so it can skip fetching process
FILESTRING=`echo $ask | sed 's/ /_/g'`
mkdir /Assistant/memory/cachefetch
if [ -f /Assistant/memory/cachefetch/$FILESTRING ]
 then
  echo fetching your request with learned results
  echo result may be faster but may be innacurate
  cacheidpointer=$(cat /Assistant/memory/cachefetch/$FILESTRING)
    if [ -f /Assistant/memory/cachefetch/$cacheidpointer ]
     then
      echo Cacheid found forwarding answer...
      result=$(cat /Assistant/memory/cachefetch/$cacheidpointer)
    else
      echo ouch it seems the process got interrupted
      echo cancelling request to cache
      echo forwarding to standard procedure..
      rm -rf /Assistant/memory/cachefetch/$FILESTRING
      result='Missing memory or memory is currently unavailable '
    fi
else
cp -r /Assistant/extension/Assistant_knowledge/learningandstoring.sh /Assistant/memory/deffered
echo Deffering Clean up process
bash /Assistant/memory/deffered/cleanuphtml.sh > /dev/null 2>&1 &
bash /Assistant/memory/deffered/learningandstoring.sh > /dev/null 2>&1 &
echo Continuing to download procedure
#urlfetch
bash /Assistant/extension/Assistant_knowledge/urlfetch.sh "$ask"
#rename urls list to the id
mv /Assistant/extension/Assistant_knowledge/urls /Assistant/extension/Assistant_knowledge/$idseed
cp -r /Assistant/extension/Assistant_knowledge/$idseed /Assistant/memory/deffered
#write custom script based on idseed
echo downloading
echo 'echo Processing download....' >> /Assistant/memory/deffered/${idseed}.sh
echo "ggseed=${idseed}" >> /Assistant/memory/deffered/${idseed}.sh
echo 'search=$(cat /Assistant/memory/deffered/${ggseed})' >> /Assistant/memory/deffered/${idseed}.sh
echo 'for link in $search; do ' >> /Assistant/memory/deffered/${idseed}.sh
echo 'httrack --continue "$link" -O "/Assistant/memory/web" "+*.*.*/*.*" -v' >> /Assistant/memory/deffered/${idseed}.sh
echo 'done' >> /Assistant/memory/deffered/${idseed}.sh
bash /Assistant/memory/deffered/${idseed}.sh > /dev/null 2>&1 &
#sleep 360
#killall -KILL httrack
for query in ${ask} ;do
for neurosector in /Assistant/memory/knowledge/*; do
grep -w "$query" $neurosector >> /Assistant/memory/knowbased/${idseed}.txt
done
done
echo checking the filling spill
echo "$ask"
cat /Assistant/memory/knowbased/${idseed}.txt
sleep 4
# Summarize the text
result=$(sumy lsa --length=1 --file=/Assistant/memory/knowbased/${idseed}.txt)
echo storing memory
echo $cachednodeid > /Assistant/memory/cachefetch/$FILESTRING

fi
if [ $result == '' ]
  then
    dialog --title "Orion answers" --msgbox "current answer is unavailable please ask later" 5 50
  else
    dialog --title "Orion answers" --msgbox "$result" 20 500
    echo "${result}" > /Assistant/memory/cachefetch/$cachednodeid
fi
