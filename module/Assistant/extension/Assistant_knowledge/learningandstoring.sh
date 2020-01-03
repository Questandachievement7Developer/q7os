cd /Assistant/memory/
mkdir htmlconvertqueue
mkdir knowledge
find . -name \*.html -exec cp {} htmlconvertqueue \;
for i in /Assistant/memory/htmlconvertqueue/*.html; do
echo learning and storing $i
neuronid0=${RANDOM}
neuronid1=${RANDOM}
neuronid2=${RANDOM}
neuronid3=${RANDOM}
neuronid4=${RANDOM}
neuronid5=${RANDOM}
neuronid6=${RANDOM}
neuronid7=${RANDOM}
if [ -f /Assistant/memory/knowledge/$neuronid0$neuronid1$neuronid2$neuronid3$neuronid4$neuronid5$neuronid6$neuronid7.txt ]
  then
    echo exists doesnt have to store again
  else
    html2text --decode-errors=ignore $i > /Assistant/memory/knowledge/$neuronid0$neuronid1$neuronid2$neuronid3$neuronid4$neuronid5$neuronid6$neuronid7 &
    #cat /Assistant/memory/knowledge/$neuronid.txt
fi
done
