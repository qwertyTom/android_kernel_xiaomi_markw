#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/init.inferno.rc"

echo "# Inferno Kernel" >> $CONFIGFILE
echo "# initialization script by Yudi Widiyanto (yudiwidiyanto7@gmail.com)" >> $CONFIGFILE
echo "# Zero ProjectX Â 2017" >> $CONFIGFILE
echo "" >> $CONFIGFILE
echo "on property:sys.boot_completed=1" >> $CONFIGFILE
echo "" >> $CONFIGFILE

echo "#min freq" >> $CONFIGFILE
cpu0=`grep selected.1 /tmp/aroma/cpu0.prop | cut -d '=' -f2`
if [ $cpu0 = 1 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 652800" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 652800" >> $CONFIGFILE
elif [ $cpu0 = 2 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 1036800" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 1036800" >> $CONFIGFILE
else
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 1401600" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 1401600" >> $CONFIGFILE
fi

echo "" >> $CONFIGFILE

echo "#max freq" >> $CONFIGFILE
cpu0=`grep selected.2 /tmp/aroma/cpu0.prop | cut -d '=' -f2`
if [ $cpu0 = 1 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 2016000" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 2016000" >> $CONFIGFILE
elif [ $cpu0 = 2 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1958400" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 1958400" >> $CONFIGFILE
elif [ $cpu0 = 3 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1804800" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 1804800" >> $CONFIGFILE
else
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1689600" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 1689600" >> $CONFIGFILE
fi

echo "" >> $CONFIGFILE

echo "#set cpu governor" >> $CONFIGFILE
gov=`grep selected.0 /tmp/aroma/gov.prop | cut -d '=' -f2`
if [ $gov = 1 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor conservative" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor conservative" >> $CONFIGFILE
elif [ $gov = 2 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor impulse" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor impulse" >> $CONFIGFILE
elif [ $gov = 3 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactive" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor interactive" >> $CONFIGFILE
elif [ $gov = 4 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor lionfish" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor lionfish" >> $CONFIGFILE
elif [ $gov = 5 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ondemand" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor ondemand" >> $CONFIGFILE
elif [ $gov = 6 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor performance" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor performance" >> $CONFIGFILE
elif [ $gov = 7 ]; then
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor powersave" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor powersave" >> $CONFIGFILE
else
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor userspace" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor userspace" >> $CONFIGFILE
fi

echo "" >> $CONFIGFILE

#set io scheduler
SCHED=`grep selected.1 /tmp/aroma/sched.prop | cut -d '=' -f2`
if [ $SCHED = 1 ]; then
echo "write /sys/block/mmcblk0/queue/scheduler cfq" >> $CONFIGFILE
elif [ $SCHED = 2 ]; then
echo "write /sys/block/mmcblk0/queue/scheduler deadline" >> $CONFIGFILE
elif [ $SCHED = 3 ]; then
echo "write /sys/block/mmcblk0/queue/scheduler fiops" >> $CONFIGFILE
elif [ $SCHED = 4 ]; then
echo "write /sys/block/mmcblk0/queue/scheduler maple" >> $CONFIGFILE
elif [ $SCHED = 5 ]; then
echo "write /sys/block/mmcblk0/queue/scheduler noop" >> $CONFIGFILE
elif [ $SCHED = 6 ]; then
echo "write /sys/block/mmcblk0/queue/scheduler sio" >> $CONFIGFILE
elif [ $SCHED = 7 ]; then
echo "write /sys/block/mmcblk0/queue/scheduler sioplus" >> $CONFIGFILE
else
echo "write /sys/block/mmcblk0/queue/scheduler zen" >> $CONFIGFILE
fi

echo "" >> $CONFIGFILE
#read ahead tune up
SCHED=`grep selected.2 /tmp/aroma/sched.prop | cut -d '=' -f2`
if [ $SCHED = 1 ]; then
echo "write /sys/block/mmcblk0/queue/read_ahead_kb 256" >> $CONFIGFILE
elif [ $SCHED = 2 ]; then
echo "write /sys/block/mmcblk0/queue/read_ahead_kb 512" >> $CONFIGFILE
elif [ $SCHED = 3 ]; then
echo "write /sys/block/mmcblk0/queue/read_ahead_kb 768" >> $CONFIGFILE
else
echo "write /sys/block/mmcblk0/queue/read_ahead_kb 1024" >> $CONFIGFILE
fi

echo "" >> $CONFIGFILE

echo "#KCAL " >> $CONFIGFILE
misc=`grep selected.1 /tmp/aroma/misc.prop | cut -d '=' -f2`
if [ $misc = 2 ]; then
echo "write /sys/devices/platform/kcal_ctrl.0/kcal \"217 215 255"\" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_sat 265" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_val 253" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_cont 250" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_hue 0" >> $CONFIGFILE
elif [ $misc = 3 ]; then
echo "write /sys/devices/platform/kcal_ctrl.0/kcal \"223 223 255"\" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_sat 271" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_val 255" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_cont 255" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_hue 0" >> $CONFIGFILE
elif [ $misc = 4 ]; then
echo "write /sys/devices/platform/kcal_ctrl.0/kcal \"232 237 256"\" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_sat 300" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_val 255" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_cont 255" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_hue 0" >> $CONFIGFILE
elif [ $misc = 5 ]; then
echo "write /sys/devices/platform/kcal_ctrl.0/kcal \"230 232 255"\" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_sat 274" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_val 247" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_cont 268" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_hue 0" >> $CONFIGFILE
elif [ $misc = 6 ]; then
echo "write /sys/devices/platform/kcal_ctrl.0/kcal \"232 228 255"\" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_sat 251" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_val 254" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_cont 256" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_hue 1515" >> $CONFIGFILE
else
echo "write /sys/devices/platform/kcal_ctrl.0/kcal \"256 256 256"\" >> $CONFIGFILE
echo "write /sys/devices/platform/kcal_ctrl.0/kcal_sat 255" >> $CONFIGFILE
fi

echo "" >> $CONFIGFILE

echo "#set vibrator intensity" >> $CONFIGFILE
misc=`grep selected.2 /tmp/aroma/misc.prop | cut -d '=' -f2`
if [ $misc = 1 ]; then
echo "write /sys/class/timed_output/vibrator/vtg_level 1322" >> $CONFIGFILE
elif [ $misc = 2 ]; then
echo "write /sys/class/timed_output/vibrator/vtg_level 1908" >> $CONFIGFILE
else
echo "write /sys/class/timed_output/vibrator/vtg_level 3045" >> $CONFIGFILE
fi

misc=`grep selected.3 /tmp/aroma/misc.prop | cut -d '=' -f2`
if [ $misc = 1 ]; then
echo "  # This Command For Enable Zram Actived" >> /system/etc/init.qcom.post_boot.sh
echo "  swapoff /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 1 > /sys/block/zram0/reset" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 824180736 > /sys/block/zram0/disksize" >> /system/etc/init.qcom.post_boot.sh
echo "  mkswap /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  swapon /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
elif [ $misc = 2 ]; then
echo "  # This Command For Enable Zram Actived" >> /system/etc/init.qcom.post_boot.sh
echo "  swapoff /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 1 > /sys/block/zram0/reset" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 1073741824 > /sys/block/zram0/disksize" >> /system/etc/init.qcom.post_boot.sh
echo "  mkswap /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  swapon /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
else
echo "  # This Command For Enable Zram Actived" >> /system/etc/init.qcom.post_boot.sh
echo "  swapoff /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 1 > /sys/block/zram0/reset" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 1610612736 > /sys/block/zram0/disksize" >> /system/etc/init.qcom.post_boot.sh
echo "  mkswap /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  swapon /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
fi

echo "" >> $CONFIGFILE

echo "# Tune up swap" >> $CONFIGFILE
echo "write /sys/block/zram0/comp_algorithm lz4" >> $CONFIGFILE
echo "write /proc/sys/vm/swappiness 50" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_background_ratio 25" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_ratio 50" >> $CONFIGFILE
echo "write /proc/sys/vm/vfs_cache_pressure 50" >> $CONFIGFILE
echo "write /proc/sys/vm/min_free_kbytes 4096" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_writeback_centisecs 600" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_expire_centisecs 350" >> $CONFIGFILE

echo "" >> $CONFIGFILE

echo "# LMK Tune up" >> $CONFIGFILE
echo "write /sys/module/lowmemorykiller/parameters/minfree 2048,4096,8192,16384,24576,32768" >> $CONFIGFILE

echo " " >> $CONFIGFILE

echo "on charger" >> $CONFIGFILE
echo "# downscaling swap when charger" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_background_ratio 5" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_ratio 35" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_writeback_centisecs 300" >> $CONFIGFILE
echo "write /proc/sys/vm/dirty_expire_centisecs 175" >> $CONFIGFILE
