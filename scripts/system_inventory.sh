#!/bin/bash

echo "System Inventory Report"
echo "-----------------------"
echo "CPU Info:"
lscpu | grep "Model name"

echo "Memory Usage:"
free -h

echo "Disk Usage:"
df -hT