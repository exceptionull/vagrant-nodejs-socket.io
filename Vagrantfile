# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    config.vm.define "socketio" do |socketio|
    
        socketio.vm.box = "puppetlabs-precise64"
        socketio.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box"
        socketio.vm.hostname = "socketio.vagrant.vm"

        socketio.vm.network :private_network, ip: "192.168.22.105"
        
        # VirtualBox Specific Customization
        socketio.vm.provider :virtualbox do |vb|
            # Use VBoxManage to customize the VM. For example to change memory:
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        
        socketio.vm.provision :shell do |s|
          s.path = "preinstall.sh"
          s.args = "3.1.1-1puppetlabs1"
        end
        
        # Enable provisioning with Puppet stand alone.
        socketio.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "socketio.pp"
            puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose"
        end
        
    end
    
end
