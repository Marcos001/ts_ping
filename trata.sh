#!/bin/bash
#
# trata saida do ping.
#

#FILE = read -p "Digite o nome do arquivo de log: "

if [ $# -le 0 ]; then
   echo -e "[Help] -- Run: $0 FILE.log \n"
   exit 1
fi

FILE=$1

#cat FILE.log | awk '{ print $1 " " $2 " " $7 }' | grep -w "icmp_seq" | sed -e 's/icmp_seq=//'
cat $FILE | awk '{ print $1 " " $2 " " $7 }' | grep -w "icmp_seq" | sed -e 's/icmp_seq=//'

