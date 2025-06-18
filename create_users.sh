#!/bin/bash

input="users.txt"

if [ ! -f "$input" ]; then
    echo "User file not found!"
    exit 1
fi

while IFS= read -r user; do
    if id "$user" &>/dev/nul; then
        echo "User '$user' already exists."
    else
        useradd "$user"
        echo "Created user '$user'."
    fi
done < "$input"
