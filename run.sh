#!/bin/bash
#
# trata saida do ping.
#


IP=8.8.8.8

SIZE=100

FILE="ping.log"

echo "create file..." 
rm $FILE

echo "running ping..." 
ping $IP -c $SIZE | xargs -n1 -i bash -c 'echo `date +"%Y-%m-%d %H:%M:%S"`" {}"' >> $FILE

#FILE = read -p "Digite o nome do arquivo de log: "

# if [ $# -le 0 ]; then
#    echo -e "[Help] -- Run: $0 FILE.log \n"
#    exit 1
# fi



echo "time,pack" > data_ping.csv

#cat FILE.log | awk '{ print $1 " " $2 " " $7 }' | grep -w "icmp_seq" | sed -e 's/icmp_seq=//'
#cat $FILE | awk '{ print $1 " " $2 " " $7 }' | grep -w "icmp_seq" | sed -e 's/icmp_seq=//'

cat $FILE | awk '{ print $2 " " $9 }' | grep -w "time" | sed -e 's/time=//' >> data_ping.csv
sed -i -e 's/ /,/' data_ping.csv

python main.py