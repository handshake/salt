# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "salt-dev"
    # config.vm.box_url = "http://domain.com/path/to/above.box"

    config.vm.define "salt-dev", primary: true do |machine|
        machine.vm.provider "virtualbox" do |vm|
            vm.customize [
                "modifyvm", :id,
                "--cpus", 2,
                "--memory", 2048,
                "--ioapic", "on",
            ]

        end
    end

    ## For masterless, mount your salt file root
    config.vm.synced_folder "state", "/srv/salt/state"
    config.vm.synced_folder "pillar", "/srv/salt/pillar"

    config.vm.provision :salt do |salt|
        salt.minion_config = "salt-dev.conf"
        salt.run_highstate = true
    end

end
