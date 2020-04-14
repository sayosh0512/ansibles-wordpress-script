#!/bin/bash
local ip=$1
ssh_key_configuration() {
local pip = $1
azurepass=P@ssw0rd@1202
ssh-keygen
ssh-copy-id azureadmin@pip password azurepass
#40.117.99.34
}

install_ansible() {
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
}

configure_ansible() {
local ctrlpubip= $1
#local ctrlpubip=192.168.0.1
sudo chmod 777 /etc/ansible/hosts
sudo echo -e "[webservers]\n${ctrlpubip}" >>/etc/ansible/hosts
}

wordpress_install() {
cd /home/azureadmin
sudo git clone https://github.com/sayosh0512/wordpressplaybook.git
ansible-playbook playbook.yml -i /etc/ansible/hosts -u azureadmin

}

ssh_key_configuration ip >> /tmp/var.txt
wordpress_install >> /tmp/var.txt
install_ansible >> /tmp/var.txt
configure_ansible ip >> /tmp/var.txt
