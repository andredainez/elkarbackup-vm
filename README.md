elkarbackup-vm
==============

We are using [Vagrant](http://www.vagrantup.com/) & [Ansible](http://www.ansible.com/home) to generate Elkarbackup virtual machine:

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

TODO
------

 * Change root password
 * Convert VirtualBox image to other formats (vmx, raw, qcow...)
 * Use empty Debian Wheezy base images (amd64 and i386)
 * Test it with an empty Ubuntu Server 14.04 LTS image

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
