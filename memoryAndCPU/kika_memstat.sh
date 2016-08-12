#!/bin/bash
performance(){
	#remove old log
	rm /data/local/tmp/cpuinfo.csv
	rm /data/local/tmp/procrank.csv

	#dump cpu infomation per second
	COUNTER=0
	#36000s means 10 hours
	TIMES=36000
	while [ $COUNTER -lt $TIMES ]; do
		echo $COUNTER
		date_current=`date '+%F %T'`
		echo $date_current
		cpuinfo=`dumpsys cpuinfo | grep com.qisiemoji.inputmethod`
		echo ${date_current}${cpuinfo} >> /data/local/tmp/cpuinfo.csv	
		
		date_current=`date '+%F %T'`
		procrank=`Procrank | grep com.qisiemoji.inputmethod`
		echo ${date_current}${procrank} >> /data/local/tmp/procrank.csv
		sleep 1
		let COUNTER=COUNTER+1
	done
}

#THREADS=0
#while [ $THREADS -lt 2 ]; do
#	sleep 1
#	monkey
#	performance
#	let THREADS=THREADS+1
#done&
performance
