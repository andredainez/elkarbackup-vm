# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "xezpeleta/wheezy64"
  #config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-puppet.box"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.provider :virtualbox do |vb|
    vb.name = "elkarbackup"
  #  vb.gui = true
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/hosts-vagrant"
    ansible.limit = 'all'
    ansible.host_key_checking = false
    ansible.verbose = false
  end
end

