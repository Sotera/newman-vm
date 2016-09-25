# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.name = "newman-vm-v2.x"
    vb.gui = false
    vb.memory = 8192 
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--vram", "32"]
  end

  config.vm.network :forwarded_port, guest: 8787, host: 8787, auto_correct: true
  config.vm.network :forwarded_port, guest: 9200, host: 9200, auto_correct: true
  config.vm.network :forwarded_port, guest: 5601, host: 5601, auto_correct: true
  config.vm.network :forwarded_port, guest: 4040, host: 4040, auto_correct: true
  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
  config.vm.network :forwarded_port, guest: 5984, host: 5984, auto_correct: true
  config.vm.network :forwarded_port, guest: 5000, host: 5000, auto_correct: true

  config.vm.synced_folder "/Users/jlee/work/repository/newman-dev-v2.x/newman-app-v2.x", "/vagrant/newman-app-v2.x"
  config.vm.synced_folder "/Users/jlee/work/repository/newman-dev-v2.x/newman-etl-v2.x", "/vagrant/newman-etl-v2.x"

end
