Modules (also referred to as “task plugins” or “library plugins”) is a unit-of-code, module of code, a function, which can be used from the command line or in a playbook task. Then, exectuing the module on the remote managed node, and collects return values

Execute module from the command line.

```sh
ansible webservers -m service -a "name=httpd state=started"
ansible webservers -m ping
ansible webservers -m command -a "/sbin/reboot -t now"
```

Execute module from the Playbook task.

```yaml
---
- name: Manage webservers
  hosts: webservers
  tasks:
    - name: Start httpd service
      ansible.builtin.service:
        name: httpd
        state: started

    - name: Ping webservers to check connectivity
      ansible.builtin.ping:

    - name: Reboot webservers immediately
      ansible.builtin.command:
        cmd: /sbin/reboot -t now
```