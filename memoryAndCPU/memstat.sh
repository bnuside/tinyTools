#!/bin/bash

#PKG=""
#package(){
#	if [ $1 = "ikey" ]; then
#		PKG="com.emoji.ikeyboard"
#	elif [ $1 = "kika" ]; then
#		PKG="com.qisiemoji.inputmethod"
#	elif [ $1 = "pro" ]; then
#		PKG="com.emoji.coolkeyboard"
#	else
#		echo "param error"
#		exit 0
#}
PKG="com.emoji.ikeyboard"
performance(){
	#remove old log
	#rm /data/local/tmp/cpuinfo.csv
	#rm /data/local/tmp/procrank.csv

	CPUINFO="/data/local/tmp/cpuinfo.csv"
	PROCRANK="/data/local/tmp/procrank.csv"
	echo `rm $CPUINFO`
	echo `rm $PROCRANK`
	echo "data,time,pid,vss,rss,pss,uss" >> $PROCRANK
	#dump cpu infomation per second
	COUNTER=0
	#36000s means 10 hours
	TIMES=36000
	SEP=" "
	while [ $COUNTER -lt $TIMES ]; do
		#echo $COUNTER
		date_current=`date '+%F %T'`
		#echo $date_current
		cpuinfo=`dumpsys cpuinfo | grep com.qisiemoji.inputmethod`
		echo ${COUNTER}$SEP${date_current}${cpuinfo} >> $CPUINFO	
		
		date_current=`date '+%F %T'`
		procrank=`Procrank | grep com.qisiemoji.inputmethod`
		echo ${COUNTER}$SEP${date_current}${procrank} >> $PROCRANK
		echo ${COUNTER}$SEP${date_current}${procrank}
		sleep 1
		let COUNTER=COUNTER+1
	done

	chmod 777 *.csv
}

#THREADS=0
#while [ $THREADS -lt 2 ]; do
#	sleep 1
#	monkey
#	performance
#	let THREADS=THREADS+1
#done&
performance
