# Ansible workshop

This workshop mostly copy from [this Youtube](https://www.youtube.com/watch?v=kWSlAGp4Z1k&t=1981s).

## Prerequisite

1. Some server(s) for managed server nodes. I used some cheap Droplets on Digitalocean to quickly provision and delete droplets.

## Network Lab Diagram

- TODO


## Instruction

0. Prepare the host addresses in the script `setup.sh` and execute it to prepare host address for Ansible in `inventory.yaml` file.

very simple, just demonstration, test connection

*draft*

1. Install package
2. setup Inventory (simple name)
3. test host from inventory
4. setup Playbook (simple Ping)
5. test playbook with simple play

## Instruction 2

*draft*

more advance, according to diagram

1. change host names in the Inventory ()
```sh
$ ansible all -m ping -i 02_ansible_workshop/inventory.yaml
$ ansible web -m ping -i 02_ansible_workshop/inventory.yaml
$ ansible db -m ping -i 02_ansible_workshop/inventory.yaml
```

2. setup Playbook for install dependencies and packages

```sh
$ ansible-playbook 02_ansible_workshop/playbook.yaml -i 02_ansible_workshop/inventory.yaml
```

ansible-playbook 00a_jinja2_template/playbook.yaml -i 00a_jinja2_template/inventory.yaml