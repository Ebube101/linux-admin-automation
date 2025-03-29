#!/bin/bash
BACKUP_DIR="/var/backups"
mkdir -p $BACKUP_DIR
tar -czvf "$BACKUP_DIR/backup_$(date +%F).tar.gz" /etc /home
