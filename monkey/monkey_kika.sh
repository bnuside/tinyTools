#!/bin/bash
echo "removing old logs..."
adb shell rm /sdcard/*.txt
echo "clear kika data"
adb shell pm clear com.qisiemoji.inputmethod

echo "Input(1 stop monkey while crash/timeout occured; 2 for ignore timeouts; 3 for ignore both crashes and timeouts): "
read OPT

if [ $OPT = "1" ] ; then
	echo "Non-ignores"
	adb shell "monkey -p com.qisiemoji.inputmethod --pct-touch 40 --pct-motion 40 -s 18 -v -v -v --throttle 200 180000 2>/sdcard/error.txt 1>/sdcard/info.txt | logcat -v time>/sdcard/logcat.txt"

elif [ $OPT = "2" ]; then
	#statements
	echo "Ignore timeouts"
	adb shell "monkey -p com.qisiemoji.inputmethod --ignore-timeouts --pct-touch 40 --pct-motion 40 -s 18 -v -v -v --throttle 200 180000 2>/sdcard/error.txt 1>/sdcard/in    fo.txt | logcat -v time>/sdcard/logcat.txt"

else
	echo "Ignore both"
	adb shell "monkey -p com.qisiemoji.inputmethod --ignore-crashes --ignore-timeouts --pct-touch 40 --pct-motion 40 -s 18 -v -v -v --throttle 200 180000 2>/sdcard/error.txt 1>/sdcard/in    fo.txt | logcat -v time>/sdcard/logcat.txt"
fi
