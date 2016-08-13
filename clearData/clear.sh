#
echo "1 kika; 2 pro; 3 ikey"
read APP
if [ $APP = "1" ] ; then
	adb shell pm clear com.qisiemoji.inputmethod
elif [ $APP = "2" ] ; then
	adb shell pm clear com.emoji.coolkeyboard
elif [ $APP = "3" ] ; then
	adb shell pm clear com.emoji.ikeyboard
else
	echo "Invalid input"
fi
