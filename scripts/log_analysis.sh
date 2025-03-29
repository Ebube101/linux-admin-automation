#!/bin/bash

LOG_FILE="~/cybersecurity/linux-admin-automation/monitoring/log_analysis.log"
SYSTEM_LOGS="/var/log/auth.log"

echo "Log Analysis started at $(date)" >> $LOG_FILE

# Check for failed login attempts
echo "Failed login attempts:" >> $LOG_FILE
grep "Failed password" $SYSTEM_LOGS >> $LOG_FILE

# Check for successful sudo usage
echo "Sudo command usage:" >> $LOG_FILE
grep "sudo" $SYSTEM_LOGS >> $LOG_FILE

# Check for suspicious user activity
echo "Suspicious user activity:" >> $LOG_FILE
grep "useradd" $SYSTEM_LOGS >> $LOG_FILE
grep "userdel" $SYSTEM_LOGS >> $LOG_FILE

echo "Log Analysis completed at $(date)" >> $LOG_FILE

