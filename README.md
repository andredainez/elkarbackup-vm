elkarbackup-vm
==============

We are using [Vagrant](http://www.vagrantup.com/) & [Ansible](http://www.ansible.com/home) to generate an **updated Elkarbackup virtual machine**:

VM generation
---------------

```sh
git clone https://github.com/xezpeleta/elkarbackup-vm.git
cd elkarbackup-vm
vagrant up
```

The _vagrant up_ command will create and start a VM and it will use Ansible for provisioning:
 * Update/Upgrade Debian distribution
 * Install dependences
 * Install elkarbackup


**Note**: if something fails during the provisioning, you always can run Ansible again:

```sh
vagrant provision
```


Export the VM
---------------

[Create the box](https://docs.vagrantup.com/v2/virtualbox/boxes.html) with:
```
vagrant package
```


TODO
------

 * ~~Change root password~~
 * Convert VirtualBox image to other formats (vmx, raw, qcow...)
 * Use empty Debian Wheezy base box (amd64 and i386)
 * Test it with an empty Ubuntu Server 14.04 LTS base box

Troubleshooting
-----------------

Unknown SSH error? Try this:

Create file _.ssh/config_:

```
Host 127.0.0.1
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null
```

[More info](http://www.midwesternmac.com/blogs/jeff-geerling/fixing-ssh-unknown-error-when)
