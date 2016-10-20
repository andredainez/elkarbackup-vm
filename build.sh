#! /bin/sh

d=$(pwd)
export PATH=$PATH:$d/packer

if [ -d "output-vm" ];then
    echo "WARNING: output-vm directory will be deleted!"
    rm -RI output-vm

    if [ -d "output-vm" ]; then
        echo "File not deleted. Exiting..."
        exit
    fi
fi


if packer validate elkarbackup-jessie.json; then
    packer build elkarbackup-jessie.json
else
    "Incorrect json configuration file"
    exit
fi
