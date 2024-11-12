cat $1 | awk -f script1.awk

cat $1 | awk -F , 'NF>0{print tolower($7),$2}' | sort | uniq | awk '{print $1}' | uniq -c | awk '{print "HOTELNUMBER", $2, $1}'

cat $1 | grep -Ei "(holiday inn|hilton)" | awk -F , -f script2.awk

gnuplot script.p
