#!/bin/bash

echo "Public Ip is : ${1}" >> /tmp/var.txt
ssh_key_configuration() {

azurepass=P@ssw0rd@1202
ssh-keygen /home/azureadmin/.ssh/id_rsa \n \n 
ssh-copy-id azureadmin@${1} password azurepass yes\n
#40.117.99.34
}

install_ansible() {
echo "Public Ip is : ${1}" >> /tmp/var.txt
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

}

configure_ansible() {
echo "Configure ansible Ip is : ${1}" >> /tmp/var.txt
#local ctrlpubip= $1
#local ctrlpubip=192.168.0.1
sudo chmod 777 /etc/ansible/hosts
sudo echo -e "[webservers]\n${1}" >>/etc/ansible/hosts
}

wordpress_install() {
cd /home/azureadmin
sudo git clone https://github.com/sayosh0512/wordpressplaybook.git
ansible-playbook /home/azureadmin/wordpressplaybook/playbook.yml -i /etc/ansible/hosts -u azureadmin

}


ssh_key_configuration >> /tmp/var.txt
install_ansible ${1} >> /tmp/var.txt 
configure_ansible ${1} >> /tmp/var.txt
wordpress_install >> /tmp/var.txt

