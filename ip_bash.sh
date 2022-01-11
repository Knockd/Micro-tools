#!/usr/bin/env bash
#$1='/home/kali/Desktop/jxbass2_masscan_rate1000'
#ip=$1
#shift
ip="/home/kali/Desktop/jxbass2"
for line in $(cat "$ip")
do
	echo $line
	#now=${line}".txt"
	grep $line  /home/kali/Desktop/jxbass2_masscan_rate1000 | cut -d " " -f 3 > "$line"
	for port in $(cat "$line"):
	do
		nmap -Pn -sV -sS -T4 -p $port "$line"  -oN "${line}" --append-output
	done
done

