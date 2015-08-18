# Jp2Anki
function do_voice {
while read word
do
wget -q -U Mozilla -O ~/Anki/User\ 1/collection.media/$word.mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=ja&q=$word"
definition=$(iconv -f EUC-JP -t UTF-8 < ~/edict | grep "^$word " | tr "\n" " ") 
echo -e "$definition \t[sound:$word.mp3]\t $word"
done
}
mecab -O wakati -b 172032 $1 | tr " " "\n" | awk '!x[$0]++' | iconv -f EUC-JP -t UTF-8 | grep -v -P "^[\x00-\x7F]*$" | do_voice 
#drop in replacement for sort by frequency
#sort -f | uniq -c | sort -k 1nr -k 2f | cut -b 1-8 --complement
