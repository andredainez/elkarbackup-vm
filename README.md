elkarbackup-vm
==============

We are using Vagrant&Ansible to generate Elkarbackup virtual machine:

VM generation
---------------

```sh
git clone https://github.com/xezpeleta/elkarbackup-vm.git
cd elkarbackup-vm
vagrant up
```

If something fails, you always can run Ansible again:

```sh
vagrant provision
```


Troubleshooting
-----------------

Unknown SSH error? Try this:

Create file .ssh/config:

```
Host 127.0.0.1
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null
```

[More info](http://www.midwesternmac.com/blogs/jeff-geerling/fixing-ssh-unknown-error-when)
