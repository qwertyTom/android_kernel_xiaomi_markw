#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/init.inferno.rc"

echo "# Inferno Kernel" >> $CONFIGFILE
echo "# initialization script by Yudi Widiyanto (yudiwidiyanto7@gmail.com)" >> $CONFIGFILE
echo "# Zero ProjectX Â 2017" >> $CONFIGFILE

echo "" >> $CONFIGFILE

echo "on property:sys.boot_completed=1" >> $CONFIGFILE

echo "" >> $CONFIGFILE

echo "#default freq min/max, gov and i/o sched" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 652800" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 2016000" >> $CONFIGFILE
echo "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactive" >> $CONFIGFILE
echo "write /sys/block/mmcblk0/queue/scheduler sio" >> $CONFIGFILE

echo "#gpu" >> $CONFIGFILE
echo "write /sys/class/kgsl/kgsl-3d0/devfreq/min_freq 133000000" >> $CONFIGFILE
echo "write /sys/class/kgsl/kgsl-3d0/devfreq/max_freq 650000000" >> $CONFIGFILE
echo "write /sys/class/kgsl/kgsl-3d0/max_gpuclk 650000000" >> $CONFIGFILE

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

echo "#set vibrator intensity" >> $CONFIGFILE
echo "write /sys/class/timed_output/vibrator/vtg_level 1908" >> $CONFIGFILE

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

echo "  # This Command For Enable Zram Actived" >> /system/etc/init.qcom.post_boot.sh
echo "  swapoff /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 1 > /sys/block/zram0/reset" >> /system/etc/init.qcom.post_boot.sh
echo "  echo 1073741824 > /sys/block/zram0/disksize" >> /system/etc/init.qcom.post_boot.sh
echo "  mkswap /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
echo "  swapon /dev/block/zram0" >> /system/etc/init.qcom.post_boot.sh
