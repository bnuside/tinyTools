#!/bin/bash
echo "Delete pre-logs..."
adb shell "rm /sdcard/*.txt"
adb shell pm clear com.emoji.ikeyboard
echo "iKey:Input(1 for crash/timeout; 2 for ignore timeouts only; 3 for Ignore both): "
read OPT

if [ $OPT = "1" ] ; then
	echo "Non-ignores"
	adb shell "monkey -p com.emoji.ikeyboard --pct-touch 40 --pct-motion 40 -s 18 -v -v -v --throttle 200 180000 2>/sdcard/error.txt 1>/sdcard/info.txt | logcat -v time>/sdcard/logcat.txt"

elif [ $OPT = "2" ] ; then
	echo "Ignores timeouts only"
	adb shell "monkey -p com.emoji.ikeyboard --ignore-timeouts --pct-touch 40 --pct-motion 40 -s 18 -v -v -v --throttle 200 180000 2>/sdcard/error.txt 1>/sdcard/info.txt | logcat -v time>/sdcard/logcat.txt"

else
	echo "Ignore both"
	adb shell "monkey -p com.emoji.ikeyboard --ignore-crashes --ignore-timeouts --pct-touch 40 --pct-motion 40 -s 18 -v -v -v --throttle 200 180000 2>/sdcard/error.txt 1>/sdcard/info.txt | logcat -v time>/sdcard/logcat.txt"
fi
