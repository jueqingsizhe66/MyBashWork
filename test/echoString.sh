#!/bin/bash - 
#===============================================================================
#
#          FILE: echoString.sh
# 
#         USAGE: ./echoString.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015年05月25日 21:07
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


clear
echo -e "\033[1m Hello World"
 # bold effect
echo -e "\033[5m Blink"
       # blink effect
echo -e "\033[0m Hello World"
 # back to noraml
 
echo -e "\033[31m Hello World"
 # Red color
echo -e "\033[32m Hello World"
 # Green color
echo -e "\033[33m Hello World"
 # See remaing on screen
echo -e "\033[34m Hello World"
echo -e "\033[35m Hello World"
echo -e "\033[36m Hello World"
 
echo -e -n "\033[0m"
  # back to noraml
echo -e "\033[41m Hello World"
echo -e "\033[42m Hello World"
echo -e "\033[43m Hello World"
echo -e "\033[44m Hello World"
echo -e "\033[45m Hello World"
echo -e "\033[46m Hello World"
 
echo -e "\033[0m Hello World"
