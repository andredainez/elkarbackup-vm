#! /bin/sh

boxname="elkarbackup-vm.box"

echo "Creating and provisioning VM..."
up=`vagrant up`

echo "Up=$up"

if [ ! "$up" ];then
    echo "ERROR: trying again with 'vagrant provision' command..."
    up=`vagrant provision`
fi

if [ "$up" ];then
    echo "VM created and provisioned succesfully"
    echo "Creating box package..."
    mkdir build && cd build
    vagrant package --output $boxname
    echo "Unpacking the box..."
    tar -xf $boxname

    echo "Box unpacked. Removing vagrant vm..."
    vagrant destroy --force
    echo "If it returns an error, try to do it manually: 'vagrant destroy --force'"
    echo "Finished!"
else
    echo "ERROR: unknown error"
fi
