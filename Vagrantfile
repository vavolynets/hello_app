# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
    config.cache.synced_folder_opts = {
        owner: "_apt",
        group: "_apt"
}
  end
  config.vm.define :lab do |lab|
    lab.vm.network :"private_network", ip: "10.10.10.10"
    lab.vm.provision :shell, path: "scripts/bootstrap.sh"
    lab.vm.provision :shell,
      inline: 'PYTHONUNBUFFERED=1 ansible-playbook \
        /vagrant/ansible/rails.yml -c local'
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_install = true
    config.vbguest.no_remote = true
  end
end
