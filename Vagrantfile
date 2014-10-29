# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "xdata-0.2.1"

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.network :forwarded_port, guest: 8787, host: 8787, auto_correct: true
  config.vm.network :forwarded_port, guest: 9200, host: 9200, auto_correct: true


end
