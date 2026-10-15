#!/bin/bash

#Project : 1
#Name : System Health Report
#Author : Rozalan
#Date : October 2026

echo "======================================"
echo "         SYSTEM HEALTH REPORT"
echo "======================================"

check_memory(){
	echo "SYSTEM MEMORY :"
	free -h
	echo "------------------------------"
}

check_diskspace(){
	echo "DISK SPACE :"
	df -h
	echo "------------------------------"
}

check_process(){
	echo "RUNNING PROCESS :"
	ps aux
	echo "------------------------------"
}

check_diskalert(){
	echo "Checking Disk Threshold :"
	DISK=$(df / | awk 'NR==2 {gsub("%",""); print $(NF-1)}')
	if [ $DISK -gt 80 ]
	then
	echo "Warning! DISK is $DISK% full"
	else
	echo "Disk usage is $DISK%"
	fi
}

check_memory
check_diskspace
check_process
check_diskalert


echo "----------End of Health Check Report--------"

