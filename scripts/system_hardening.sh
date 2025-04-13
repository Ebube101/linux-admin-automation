#!/bin/bash

# Ensure script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ This script must be run as root. Use sudo."
    exit 1
fi

SSHD_CONFIG="/etc/ssh/sshd_config"

echo "🔒 Disabling root SSH login..."
if grep -q "^PermitRootLogin yes" "$SSHD_CONFIG"; then
    cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak_$(date +%F_%T)"  # Backup with timestamp
    sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' "$SSHD_CONFIG"
    systemctl restart sshd
    echo "✅ Root login over SSH disabled."
else
    echo "⚠️  PermitRootLogin already set to 'no' or not explicitly set."
fi

echo "🧱 Configuring UFW firewall..."
ufw allow OpenSSH
ufw allow 80/tcp
ufw allow 443/tcp

echo "✅ Firewall rules configured:"
ufw status verbose

echo "🚀 Enabling firewall..."
ufw --force enable
ufw reload

echo "🎉 Firewall enabled and root SSH login disabled."
