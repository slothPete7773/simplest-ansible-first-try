#!/bin/bash

# Prompt the user for the username
read -p "Enter the SSH username: " username

# Run the Ansible playbook with the provided username
ansible-playbook -i inventory.yaml \
    -u "$username" \
    -k \
    playbook.yaml