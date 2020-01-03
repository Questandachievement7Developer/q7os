mkdir ProcessedCam
echo Automatic Stabilizer
while true; do
for f in *.mp4; do
if [ -f ProcessedCam/finish_$f ]; then
echo CameraProcessed
else
#ffmpeg -i $f -y -vf vidstabdetect=stepsize=2:shakiness=7:accuracy=9:result=transform_vectors.trf -f null -
#ffmpeg -i $f -y -vf vidstabtransform=input=transform_vectors.trf:zoom=0:smoothing=17,unsharp=5:5:0.8:3:3:0.4 -vcodec libx264 -preset ultrafast -tune #film -crf 18 -acodec copy ProcessedCam/Stabilized_${f}
#ffmpeg -i  ProcessedCam/Stabilized_$f -y -vf  minterpolate=48,tblend=all_mode=average,framestep=2 ProcessedCam/StabilizedBlurred0_${f}
#ffmpeg -i  ProcessedCam/Stabilized_$f -y -vf  scale=3840:2160,unsharp=5:5:2 ProcessedCam/Processed_${f}

rm final*
ffmpeg -i $f -y -vf vidstabdetect=stepsize=2:shakiness=7:accuracy=9:result=transform_vectors.trf -f null -
ffmpeg -i $f -y -vf vidstabtransform=input=transform_vectors.trf:zoom=0:smoothing=17,unsharp=5:5:0.8:3:3:0.4 -vcodec libx264 -preset ultrafast -tune film -crf 18 -acodec copy Processed_0.mkv
ffmpeg -i  Processed_0.mkv -y -vf  minterpolate=48,tblend=all_mode=average,framestep=2 Processed_1.mkv
ffmpeg -i Processed_1.mkv -filter "minterpolate='fps=60'" Processed_2.mkv
ffmpeg -i  Processed_2.mkv -y -vf  scale=1920:1080,unsharp=5:5:2 ProcessedCam/Processed_${f}
rm -rf buffer.mkv Processed* raw.mkv


echo meow > ProcessedCam/finish_$f
mv ProcessedCam/Processed_$f $f
rm -rf ProcessedCam/StabilizedBlurred0* ProcessedCam/Stabilized_* processingfile* 
echo $f
fi

done
sleep 15
done
