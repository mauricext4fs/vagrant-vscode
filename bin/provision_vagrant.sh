#!/bin/bash
#git clone git@gitlab.ninezh.cc:cig-exchange/cig-exchange-root.git
#sudo su vagrant -c 'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
chmod +x /home/vagrant/add_sshkey.sh
sudo su vagrant -c 'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
sudo echo "nameserver 192.168.50.4" > /etc/resolv.conf
sudo echo "192.168.159.11	me" >> /etc/hosts
sudo echo "192.168.159.11	cigdev-vagrant-cig-local.ninezh.cc" >> /etc/hosts
sudo echo "SELINUX=permisive" > /etc/selinux/config
sudo echo "SELINUXTYPE=targeted" >> /etc/selinux/config
sudo echo "cd cig/root" >> /home/vagrant/.bash_profile
sudo chmod go+rx /home/vagrant

# Upgrade yarn to latest
sudo curl --compressed -o- -L https://yarnpkg.com/install.sh | bash


# Install PostgreSQL
sudo yum update && yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql12 postgresql12-server
sudo /usr/pgsql-12/bin/postgresql-12-setup initdb
sudo systemctl enable postgresql-12
sudo systemctl start postgresql-12


# Install GoLang
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
rm go1.13.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile

# Install Redis
sudo yum install redis -y
sudo systemctl enable redis
echo "bind 0.0.0.0" > /etc/redis.conf
echo "protected-mode no" >> /etc/redis.conf
sudo systemctl enable redis
sudo systemctl start redis

# Install nodejs, yarn and dredd
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo yum install -y  yarn
sudo yarn global add dredd

# Add bind volume for Nginx
echo "/home/vagrant/cig/root/etc/nginx/public_html   /var/www/html     none    bind                      0       0" >> /etc/fstab
sudo yum install -y nginx
if [ -f '/etc/nginx/conf.d/default.conf' ]; then
        sudo rm /etc/nginx/conf.d/default.conf
fi
cd /etc/nginx/conf.d/ &&  sudo ln -s /home/vagrant/cig/root/etc/nginx/vagrant-cig-local.ninezh.cc.conf default.conf
sudo systemctl enable nginx
sudo systemctl start nginx


