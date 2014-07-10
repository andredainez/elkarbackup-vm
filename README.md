# elkarbackup-vm

We are using [VirtualBox](http://www.virtualbox.org), [Packer](http://www.packer.io) & [Ansible](http://www.ansible.com/home) to generate an **updated Elkarbackup virtual machine** for demo/appliance purposes:

Required:
 * VirtualBox 4.1.12 or newer
 * Packer 0.6.0 or higher
 * Ansible 1.6 or higher

## Instructions

```bash
./bootstrap.sh
./build.sh
```

An updated ElkarBackup virtual machine, compatible with VirtualBox or VMWare, will be created on `output-vm/elkarbackup-vm.ova`

### Other formats

**KVM**
```bash
tar -xvf elkarbackup-vm.ova
qemu-img convert -O qcow2 elkarbackup-vm-disk1.vmdk elkarbackup-vm.qcow2
```

## Develop & Testing

We also use this code for developing or testing purposes, thanks to [Vagrant](http://www.vagrantup.com)

Required:
 * Vagrant 1.6.2 or higher

TO DO

### Troubleshooting

Unknown SSH error? Try this:

Create file _.ssh/config_:

```
Host 127.0.0.1
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null
```

[More info](http://www.midwesternmac.com/blogs/jeff-geerling/fixing-ssh-unknown-error-when)
