adb push libpagemap.so /data/local/tmp/
adb push Procrank /data/local/tmp/
adb push procmem /data/local/tmp/

adb shell su -c "mount -o remount,rw /system"

adb shell su -c "cp /data/local/tmp/libpagemap.so /system/lib"
adb shell su -c "cp /data/local/tmp/Procrank /system/xbin"
adb shell su -c "cp /data/local/tmp/procmem /system/xbin"

adb shell su -c "chmod 777 /system/lib/libpagemap.so"
adb shell su -c "chmod 777 /system/xbin/Procrank"
adb shell su -c "chmod 777 /system/xbin/procmem"