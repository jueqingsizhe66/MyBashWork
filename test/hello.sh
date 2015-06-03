#!/bin/bash - 
#===============================================================================
#
#          FILE: hello.sh
# 
#         USAGE: ./hello.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015年05月25日 21:32
#      REVISION:  ---
#===============================================================================

fname(){
  echo "Foo"
}
 
usage(){
  echo "Usage: $0 foo bar"
  exit 1
}

fname
usage

