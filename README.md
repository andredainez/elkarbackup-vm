elkarbackup-vm
==============

We are using [Vagrant](http://www.vagrantup.com/) & [Ansible](http://www.ansible.com/home) to generate an **updated Elkarbackup virtual machine**:

Tested environment:
 * VirtualBox 4.1.12
 * Vagrant 1.6.2
 * Ansible 1.6

VM generation for development testing purposes
---------------

```sh
git clone https://github.com/elkarbackup/elkarbackup-vm.git
cd elkarbackup-vm
vagrant up
vagrant provision
vagrant ssh
```

VM generation for fast deployment
---------------

```sh
git clone https://github.com/elkarbackup/elkarbackup-vm.git
cd elkarbackup-vm
./build.sh
```

The script will:
 * Update/upgrade base Debian distribution
 * Install base dependences
 * Install ElkarBackup dependences
 * Install ElkarBackup
 * Change mysql root password
 * Change system root password
 * Generate importable VM files in _./build_ directory


Using generated VM images
--------------------------

Here is an example of what is contained in _./build_ directory:

```
|-- Vagrantfile
|-- box-disk1.vmdk
|-- box.ovf
|-- metadata.json
```

So we already can import it on **VirtualBox** (__box.ovf__) or **VMWare** (__box-disk1.vmdk__)


TODO
------

 * ~~Change root password~~
 * ~~Convert VirtualBox image to other formats (vmx, raw, qcow...)~~
 * ~~Use empty Debian Wheezy base box (amd64)~~
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
