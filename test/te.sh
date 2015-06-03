#!/bin/bash - 
#===============================================================================
#
#          FILE: te.sh
# 
#         USAGE: ./te.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015年05月25日 23:23
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

num=`ls|wc -l`
echo $num
num=$(($num-10))
echo $num

