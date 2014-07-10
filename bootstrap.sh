#! /bin/sh

URL_BASEVM='http://ftp.tknika.net/elkarbackup/wheezy64.tar.gz'


d=$(pwd)

# VirtualBox needed


# Download Packer
if [ -d "$d/packer" ]; then
    echo "Packer.io already downloaded?"
else
    mkdir $d/packer && cd $d/packer
    wget https://dl.bintray.com/mitchellh/packer/0.6.0_linux_amd64.zip
    unzip 0.6.0_linux_amd64.zip
fi

# Download base VM
if [ -d "$d/base-vm" ]; then
    echo "Base VM already exists?"
else
    mkdir $d/base-vm && cd $d/base-vm
    wget -c $URL_BASEVM
    tar xzvf wheezy64.tar.gz
fi
