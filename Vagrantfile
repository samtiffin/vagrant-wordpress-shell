# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8888

  config.vm.define "wordpress_shell" do |wordpress_shell|
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = "wordpress_shell"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "shell", path: "nginx.sh"
  config.vm.provision "shell", path: "wordpress.sh"
end
