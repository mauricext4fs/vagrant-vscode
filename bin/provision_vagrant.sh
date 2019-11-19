#!/bin/bash
rm -fR /home/vagrant/.vscode-server
sudo su vagrant -c 'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'

