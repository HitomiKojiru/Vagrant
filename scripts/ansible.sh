#!/bin/bash

# Install Ansible repository.
apt-add-repository ppa:ansible/ansible
apt-get -y update && apt-get -y upgrade
apt-get -y install software-properties-common

# Install Ansible.
apt-get -y install ansible

#install pip
apt-get -y install python-pip python-dev build-essential

#install boto
sudo pip install boto