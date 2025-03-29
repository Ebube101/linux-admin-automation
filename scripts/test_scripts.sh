#!/bin/bash


echo "Automated Testing started at $(date)" 

# Test Security Audit Script
echo "Running Security Audit..." 
./security_audit.sh
if [ $? -eq 0 ]; then
    echo "Security Audit passed" 
else
    echo "Security Audit failed" 
fi

# Test Performance Monitoring Script
echo "Running Performance Monitoring..."
./performance_monitor.sh
if [ $? -eq 0 ]; then
    echo "Performance Monitoring passed" 
else
    echo "Performance Monitoring failed" 
fi

# Test Log Analysis Script
echo "Running Log Analysis..." 
./log_analysis.sh
if [ $? -eq 0 ]; then
    echo "Log Analysis passed" 
else
    echo "Log Analysis failed" 
fi

echo "Automated Testing completed at $(date)"

