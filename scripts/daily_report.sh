#!/bin/bash
# Script: Daily System Report
# Description: Generates a system report including uptime, disk usage, memory, failed login attempts, and package updates
# Usage: bash daily_report.sh

LOGFILE="/var/log/daily_report.log"

echo "==============================" > $LOGFILE
echo "  DAILY SYSTEM REPORT - $(date)  " >> $LOGFILE
echo "==============================" >> $LOGFILE

# System Uptime
echo -e "\n🔄 System Uptime:" >> $LOGFILE
uptime -p >> $LOGFILE

# Disk Usage
echo -e "\n💾 Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

# Memory Usage
echo -e "\n🧠 Memory Usage:" >> $LOGFILE
free -h >> $LOGFILE

# Failed Login Attempts
echo -e "\n🔐 Failed Login Attempts:" >> $LOGFILE
grep "Failed password" /var/log/auth.log | tail -5 >> $LOGFILE

# Package Update Status
echo -e "\n📦 Package Update Status:" >> $LOGFILE
apt list --upgradable >> $LOGFILE

echo "==============================" >> $LOGFILE
echo "Report saved to $LOGFILE"

