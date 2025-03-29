#!/bin/bash

if [ "$1" == "create" ]; then
  sudo useradd -m -s /bin/bash "$2"
  echo "User $2 created!"
elif [ "$1" == "delete" ]; then
  sudo userdel -r "$2"
  echo "User $2 deleted!"
else
  echo "Usage: $0 create|delete username"
fi
