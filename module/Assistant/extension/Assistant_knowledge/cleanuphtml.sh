find /Assistant/memory/web/ -iname "*tmp*" -exec rename .tmp.html .html '{}' \; &
cd /Assistant/memory/web
declare -A arr
shopt -s globstar
#dialog --title "Webspider" --msgbox "Cleaning files before starting cache" 5 50 &
count=0
for file in **; do
  [[ -f "$file" ]] || continue

  read cksm _ < <(md5sum "$file")
  if ((arr[$cksm]++)); then
    echo "cleaning redundant web $count file"
    count=$(($count + 1))
  fi
done
