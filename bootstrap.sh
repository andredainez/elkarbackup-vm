#! /bin/sh

URL_BASEVM='https://github.com/xezpeleta/vagrant-debian-jessie-64/releases/download/v8.6/debian-jessie.ova'


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
	wget https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_linux_amd64.zip
        unzip packer*.zip && rm -f packer*.zip
    elif [ "$os" = "Darwin" ];then
        curl -L -O https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_darwin_amd64.zip
        unzip packer*.zip && rm -f packer*.zip
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
fi
