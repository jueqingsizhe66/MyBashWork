#!/bin/bash - 
#===============================================================================
#
#          FILE: 0delet.sh
# 
#         USAGE: ./0delet.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015年05月25日 10:47
#      REVISION:  ---
#===============================================================================

mkdir modified; for i in `ls *.txt`;do iconv -f gb18030 -t utf-8 $i|awk '{print}'|awk '{if ($0 ~ /攻角/) {print $3;}else if($0 ~ /升力/){print $1,$4,$5}else if($0 ~ /^$/){print ''}else {print $3,$5;}}'   |sed '/密度/d'|sed '/来流动压/d'|sed '/^$/d' >modified/$i ;done; 



