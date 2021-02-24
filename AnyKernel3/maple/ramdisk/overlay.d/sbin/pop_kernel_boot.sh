#!/system/bin/sh

# (c) 2020 changes for pop kernel by linckandrea

# Wait to set proper init values
sleep 60

# Taken from ktweak

# remove useless logging
echo off > /proc/sys/kernel/printk_devkmsg
echo 0 > /proc/sys/kernel/sched_schedstats

for queue in /sys/block/*/queue
do
	# Do not use I/O as a source of randomness
	write "$queue/add_random" 0

	# Disable I/O statistics accounting
	write "$queue/iostats" 0
done

# taken from stock
echo 5 >  /proc/sys/vm/dirty_ratio 5
echo 1 > /proc/sys/vm/dirty_background_ratio 1
echo 0 > /sys/module/vmpressure/parameters/allocstall_threshold
echo 100 > /proc/sys/vm/swappiness

