#!/system/bin/sh

# (c) 2020 changes for pop kernel by linckandrea

# Wait to set proper init values
sleep 60

# remove useless logging
echo off > /proc/sys/kernel/printk_devkmsg
echo 0 > /proc/sys/kernel/sched_schedstats

