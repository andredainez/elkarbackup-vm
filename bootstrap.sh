#! /bin/sh

URL_BASEVM='http://ftp.tknika.net/elkarbackup/wheezy64.tar.gz'


d=$(pwd)
os=`uname`

# VirtualBox needed


# Download Packer
if [ -d "$d/packer" ]; then
    echo "Packer.io already downloaded"
    echo "Nothing to do"
else
    mkdir $d/packer && cd $d/packer
    if [ "$os" = "Linux" ];then
        wget https://dl.bintray.com/mitchellh/packer/0.6.0_linux_amd64.zip
        unzip 0.6.0_linux_amd64.zip && rm -f 0.6.0_linux_amd64.zip
    elif [ "$os" = "Darwin" ];then
        curl -L -O https://dl.bintray.com/mitchellh/packer/0.6.0_darwin_amd64.zip
        unzip 0.6.0_darwin_amd64.zip && rm -f 0.6.0_darwin_amd64.zip
    else
        echo "Not supported OS"
        exit
    fi
fi

# Download base VM
if [ -d "$d/base-vm" ]; then
    echo "Base VM already exists"
    echo "Nothing to do"
else
    mkdir $d/base-vm && cd $d/base-vm
    if [ "$os" = "Linux" ];then
        wget -c $URL_BASEVM
    elif [ "$os" = "Darwin" ];then
        curl -L -O $URL_BASEVM
    else
        echo "Not supported OS"
    fi
    tar xzvf wheezy64.tar.gz && rm -f wheezy64.tar.gz
fi
