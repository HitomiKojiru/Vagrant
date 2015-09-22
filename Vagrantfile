# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # fix tty errors on ubuntu
    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    config.vm.box = "ubuntu/trusty64"

    config.vm.define "communityVM", primary: true do |communityvm|

        communityvm.vm.provider :virtualbox do |vb|
            #set this to true if you need to debug why the machine isn't starting up it will spawn a terminal window in virtual box that you can view
            vb.gui = false
            vb.customize ["modifyvm", :id, "--memory", "2048"]
            vb.customize ["modifyvm", :id, "--vram", "12"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.name = "community"
        end

        #setup personal ssh key for git
        communityvm.vm.provision :file, :source => '~/.ssh/github_rsa', :destination => '/home/vagrant/.ssh/github_rsa'
        communityvm.vm.provision :file, :source => '~/.ssh/config', :destination => '/home/vagrant/.ssh/config'
        communityvm.vm.provision "shell", inline: "chmod 0600 /home/vagrant/.ssh/github_rsa"
        communityvm.vm.provision "shell", inline: "chmod 0600 /home/vagrant/.ssh/config"

        communityvm.vm.network "private_network", ip: "192.168.56.25"

        # Install Ansible
#        communityvm.vm.provision :shell,
#            :keep_color => true,
#            :inline => "cd /vagrant/scripts && ./ansible.sh"

        # setup baseline box
#        communityvm.vm.provision :shell,
#            :keep_color => true,
#            :inline => "export PYTHONUNBUFFERED=1 && export ANSIBLE_FORCE_COLOR=1 && cd /vagrant/ansible && ansible-playbook -c local -i 192.168.56.25, main.yaml"

        # setup community
        communityvm.vm.provision :shell,
            :keep_color => true,
            :inline => "export PYTHONUNBUFFERED=1 && export ANSIBLE_FORCE_COLOR=1 && cd /vagrant/ansible && ansible-playbook -c local -i 192.168.56.25, community.yaml"

    end
end
