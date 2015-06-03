#去除无用的信息: mkdir modified; for i in `ls *.txt`;do iconv -f gb18030 -t utf-8 $i|awk '{print}'|awk '{if ($0 ~ /攻角/) {print $3;}else if($0 ~ /升力/){print $1,$4,$5}else if($0 ~ /^$/){print ''}else {print $3,$5;}}'   |sed '/密度/d'|sed '/来流动压/d'|sed '/^$/d' >modified/$i ;done; 

###1: sh fenlei.sh   mkdir dir with the attach angle
###2: sh fileinto.sh put the files responding to the same attack angle into
                     the same folder
###3: sh blank.sh    let the files in the folder clean(without blank lines)
###4: sh cal.sh      (sum of the same angle and average)

