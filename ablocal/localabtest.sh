#!/bin/bash
echo "1. kika	2. pro	3. iKey"
read APP
if [ "$APP" = "1" ] ; then
	adb shell pm clear com.qisiemoji.inputmethod
	adb push ~/Documents/koala_event_sampling.properties /sdcard/Android/data/com.qisiemoji.inputmethod/files/koala/koala_event_sampling.properties
elif [ "$APP" = "2" ] ; then
	adb shell pm clear com.emoji.coolkeyboard
	adb push ~/Documents/koala_event_sampling.properties /sdcard/Android/data/com.emoji.coolkeyboard/files/koala/koala_event_sampling.properties
elif [ "$APP" = "3" ] ; then
	adb shell pm clear com.emoji.ikeyboard
	adb push ~/Documents/koala_event_sampling.properties /sdcard/Android/data/com.emoji.ikeyboard/files/koala/koala_event_sampling.properties
else
	echo "Wrong Selection, run it again"
fi
