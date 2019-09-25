#!/bin/bash
#git clone git@gitlab.ninezh.cc:cig-exchange/cig-exchange-root.git
#sudo su vagrant -c 'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
chmod +x /home/vagrant/add_sshkey.sh
sudo su vagrant -c 'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
echo "nameserver 192.168.50.4" > /etc/resolv.conf
