#!/bin/bash

HOST_1=162.X.X.20
HOST_2=162.X.X.21
HOST_3=162.X.X.24
cat << EOF > "01_ansible_lab/inventory.yaml"
primary_group:
  hosts:
    p_host_01:
      ansible_host: $HOST_1
    p_host_02:
      ansible_host: $HOST_2

secondary_group:
  hosts:
    s_host_01:
      ansible_host: $HOST_3

host_metagroup:
  children:
    primary_group:
    secondary_group:
  vars: 
    ansible_user: root
EOF

cat << EOF > "02_ansible_workshop/inventory.yaml"
web:
  hosts:
    p_host_01:
      ansible_host: $HOST_1
    p_host_02:
      ansible_host: $HOST_2

db:
  hosts:
    s_host_01:
      ansible_host: $HOST_3

host_metagroup:
  children:
    web:
    db:
  vars: 
    ansible_user: root
EOF

cat << EOF > "03_setup_postgresql/inventory.yaml"
db:
  hosts:
    s_host_01:
      ansible_host: $HOST_1

host_metagroup:
  children:
    web:
    db:
  vars: 
    ansible_user: root
EOF