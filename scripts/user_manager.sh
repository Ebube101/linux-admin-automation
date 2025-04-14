#!/bin/bash

# Check if run with at least two arguments
if [ "$#" -ne 2 ]; then
  echo "❌ Usage: $0 create|delete username"
  exit 1
fi

ACTION="$1"
USERNAME="$2"

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "❌ This script must be run as root. Use sudo."
  exit 1
fi

case "$ACTION" in
  create)
    if id "$USERNAME" &>/dev/null; then
      echo "⚠️ User '$USERNAME' already exists."
    else
      useradd -m -s /bin/bash "$USERNAME"
      echo "✅ User '$USERNAME' created!"
    fi
    ;;
  delete)
    if id "$USERNAME" &>/dev/null; then
      userdel -r "$USERNAME"
      echo "✅ User '$USERNAME' deleted!"
    else
      echo "⚠️ User '$USERNAME' does not exist."
    fi
    ;;
  *)
    echo "❌ Invalid action. Usage: $0 create|delete username"
    exit 1
    ;;
esac
