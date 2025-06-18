#!/bin/bash

input="users.txt"

if [ ! -f "$input" ]; then
    echo "User file not found!"
    exit 1
fi

while IFS= read -r user; do
    if id "$user" &>/dev/nul; then
        userdel "$user"
        echo "User '$user' has been deleted."
    else
        echo "User '$user' does not exist."
    fi
done < "$input"
