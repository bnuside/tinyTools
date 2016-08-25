#!/bin/bash
echo "1. kika	2. pro	3. iKey"
read APP
PKG=""
if [ "$APP" = "1" ] ; then
	PKG="com.qisiemoji.inputmethod"
elif [ "$APP" = "2" ] ; then
	PKG="com.emoji.coolkeyboard"
elif [ "$APP" = "3" ] ; then
	PKG="com.emoji.ikeyboard"
else
	echo "Wrong Selection, run it again"
fi

#clear app data
COMMON_PREFIX_CLEAR="adb shell pm clear "
echo `$COMMON_PREFIX_CLEAR$PKG`


#push file
COMMON_PREFIX_PUSH="adb push koala_event_sampling.properties "
COMMON_MID_PUSH="/sdcard/Android/data/"
COMMON_TAIL_PUSH="/files/koala/koala_event_sampling.properties"
echo `$COMMON_PREFIX_PUSH$COMMON_MID_PUSH$PKG$COMMON_TAIL_PUSH`

