#!/bin/bash

echo "Disabling root SSH login..."
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "Enabling firewall..."
sudo ufw enable
sudo ufw allow OpenSSH
sudo ufw reload
