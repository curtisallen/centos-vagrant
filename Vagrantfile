# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

MEMORY = 2056

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  config.vm.network "private_network", ip: "192.168.100.67"
  config.vm.synced_folder ".", "/workspace"
	config.vm.provision "shell", path: "provision.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = MEMORY
  end
end
