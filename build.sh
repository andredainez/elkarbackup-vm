#! /bin/sh

pwd=$(pwd)
export PATH=$PATH:$pwd/packer

if packer validate elkarbackup.json; then
    packer build elkarbackup.json
else
    "Incorrect json configuration file"
    exit
fi
