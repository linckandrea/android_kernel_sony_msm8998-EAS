#!/system/bin/sh

# (c) 2020 changes for pop kernel by linckandrea

# Wait to set proper init values
sleep 30

# Set TCP congestion algorithm
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

# Set min cpu freq
echo 518400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 806400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq

# Configure cpu governor settings
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 500 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/up_rate_limit_us
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/down_rate_limit_us
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/iowait_boost_enable
echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 500 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/up_rate_limit_us
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/down_rate_limit_us
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/iowait_boost_enable

# remove useless logging
echo off > /proc/sys/kernel/printk_devkmsg
echo 0 > /proc/sys/kernel/sched_schedstats

echo "Boot pop kernel completed " >> /dev/kmsg

