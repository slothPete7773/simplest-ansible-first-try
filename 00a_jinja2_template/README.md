This lab test the Jinja template from the file `test.j2`.

The jinja value template enclosed in {{ X }} (double curly braces), where the X is the variable name. The variable name need to look at XXX (TODO: Find the reference for Jinja template variable options)

Also, I tried simple [random value](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_filters.html#random-items-or-numbers) from the `ansible.builtin.random` filter in Ansible, it is an extension of the default Jinja2 random filter,

```jinja2
Stupid Random {{ ['a','b','c'] | random }}
```