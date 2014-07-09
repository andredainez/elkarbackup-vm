#! /bin/sh

DISTRO="wheezy"
BOXNAME="elkarbackup-vm"
IMGDIR="./images"

echo "Creating and provisioning $BOXNAME over $DISTRO..."

d=$(pwd)

find $d -name ".vagrant" -prune -exec rm -fR {} \;
if [ -d $d/$IMGDIR ];then
    rm -R $d/$IMGDIR
    if [ -d $d/$IMGDIR ]; then
        echo "Cancelled!"
    fi
fi

cd $d/src/$DISTRO
up=`vagrant up`

echo "Up=$up"

if [ ! "$up" ];then
    echo "ERROR: trying again with 'vagrant provision' command..."
    up=`vagrant provision`
fi

if [ "$up" ];then
    echo "VM created and provisioned succesfully"

    if [ ! -d "$d/$IMGDIR" ]; then
      mkdir $d/$IMGDIR
      mkdir $d/$IMGDIR/vagrant
      mkdir $d/$IMGDIR/kvm
      mkdir $d/$IMGDIR/virtualbox
      mkdir $d/$IMGDIR/vmware
    fi

    echo "Creating box package..."
    vagrant package --output $d/$IMGDIR/vagrant/$BOXNAME.box
    echo "Unpacking the box..."
    tar -xf $d/$IMGDIR/vagrant/$BOXNAME.box -C $d/$IMGDIR/
    # VMWare
    cp $d/$IMGDIR/box-disk1.vmdk $d/$IMGDIR/vmware/box-disk1.vmdk
    # KVM raw (veeeery slooow)
    #VBoxManage clonehd $d/$IMGDIR/box-disk1.vmdk $d/$IMGDIR/kvm/$BOXNAME.raw --format RAW
    #qemu-img convert -O raw $d/$IMGDIR/box-disk1.vmdk $d/$IMGDIR/kvm/$BOXNAME.raw
    # VirtualBox
    mv $d/$IMGDIR/box-disk1.vmdk $d/$IMGDIR/virtualbox/box-disk1.vmdk
    mv $d/$IMGDIR/box.ovf $d/$IMGDIR/virtualbox/$BOXNAME.ovf

    rm -f $d/$IMGDIR/Vagrantfile
    echo "Box unpacked. Removing vagrant vm..."
    vagrant destroy --force
    #echo "If it returns an error, try to do it manually: 'vagrant destroy --force'"
    echo "Finished! Summary:"
    echo "\n"
    # Summary
    cd $d/$IMGDIR/
    pwd
    du -sh *
else
    echo "ERROR: unknown error"
fi
