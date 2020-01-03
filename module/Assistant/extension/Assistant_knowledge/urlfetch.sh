#Urls fetecher

echo ""
echo ".=========================================================."
echo "|                                                         |"
echo "|  COMMAND LINE GOOGLE SEARCH                             |"
echo "|  ---------------------------------------------------    |"
echo "|                                                         |"
echo "|  Version: 1.0                                           |"
echo "|  Developed by: Rishi Narang                             |"
echo "|  wrapped by: questandachievement7                       |"
echo "|  Blog: www.wtfuzz.com                                   |"
echo "|                                                         |"
echo "|  Usage: ./bootloader.sh <search strings>                     |"
echo "|  Example: ./bootloader.sh example and test                   |"
echo "|                                                         |"
echo ".=========================================================."
echo ""

if [ -z $1 ]
then
 echo "ERROR: No search string supplied."
 echo "USAGE: ./bootloader.sh <search srting>"
 echo ""
 echo -n "Anyways for now, supply the search string here: "
 read SEARCH
else
 SEARCH=$@
fi

URL="http://google.com/search?hl=en&safe=off&q="
STRING=`echo $SEARCH | sed 's/ /%20/g'`
URI="$URL%22$STRING%22"

lynx -dump $URI > gone.tmp
sed 's/http/\^http/g' gone.tmp | tr -s "^" "\n" | grep http| sed 's/\ .*//g' > gtwo.tmp
rm gone.tmp
sed '/google.com/d' gtwo.tmp > /Assistant/extension/Assistant_knowledge/urls
rm gtwo.tmp

echo "SUCCESS: Extracted `wc -l /Assistant/extension/Assistant_knowledge/urls` and listed them in '`pwd`//Assistant/extension/Assistant_knowledge/urls'
file for reference."
echo ""
cat /Assistant/extension/Assistant_knowledge/urls
echo ""

#EOF
