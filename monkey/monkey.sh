#!/bin/bash
echo "Delete pre-logs..."
adb shell "rm /sdcard/*.txt"

echo "###########################"
echo "Select Product:"
echo "1.kika	2.Pro 	3.iKey"
echo "###########################"
read KEYBOARD

PKG=""

if [ $KEYBOARD = '1' ] ; then
	PKG="com.qisiemoji.inputmethod"
elif [ $KEYBOARD = '2' ] ; then
	PKG="com.emoji.coolkeyboard"
elif [ $KEYBOARD = '3' ]; then
	PKG="com.emoji.ikeyboard"
else
	echo "wrong input"
fi

echo $PKG


echo "###########################"
echo "Clear data?(Y/N)"
echo "###########################"
read CLEAR

if [ $CLEAR = 'Y' ] || [ $CLEAR = 'y' ]; then
	PREFIX="adb shell pm clear "
	echo `$PREFIX$PKG`
fi

echo "###########################"
echo "Input(1 for crash/timeout; 2 for ignore timeouts only; 3 for Ignore both): "
echo "###########################"
read OPT


CMD=""
COMMON_PREFIX="adb shell monkey -p "
COMMON_TAIL=" --pct-touch 40 --pct-motion 40 -s 18 -v -v -v --throttle 200 180000 2>/sdcard/error.txt 1>/sdcard/info.txt | logcat -v time>/sdcard/logcat.txt"

if [ $OPT = "1" ] ; then
	echo "Non-ignores"
	CMD=$COMMON_PREFIX$PKG$COMMON_TAIL

elif [ $OPT = "2" ] ; then
	echo "Ignores timeouts only"
	IGNORE_TIMEOUT=" --ignore-timeouts "
	CMD=$COMMON_PREFIX$PKG$IGNORE_TIMEOUT$COMMON_TAIL

else
	echo "Ignore both"
	IGNORE_BOTH=" --ignore-timeouts --ignore-crashes "
	CMD=$COMMON_PREFIX$PKG$IGNORE_BOTH$COMMON_TAIL
fi
echo `$CMD`