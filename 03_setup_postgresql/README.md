note

1. [running a shell script on the remote server.](https://stackoverflow.com/questions/21160776/how-to-execute-a-shell-script-on-a-remote-server-using-ansible)
2. [documentation](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/script_module.html#examples)


# Expose Postgresql database connection

After successfully setup the database and user. Next step is to configure the Postgresql configuration to accept request from remote connection.

Steps:

1. Edit file `/etc/postgresql/{VERSION}/main/postgresql.conf`, find the field `listen_addresses`, change from value `localhost` to `*`. **\*** indicates accepting any address.

```conf
#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------

# - Connection Settings -

listen_addresses = '*'          # what IP address(es) to listen on;
                                # comma-separated list of addresses;
                                # defaults to 'localhost'; use '*' for all
```

2. Edit the file `/etc/postgresql/{VERSION}/main/pg_hba.conf`

Add the following line to the end of file.

```
host all all 0.0.0.0/0 md5
```

3. Restart postgresql service

```sh
systemctl restart postgresql
```