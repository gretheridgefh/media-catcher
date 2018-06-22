#!/bin/bash

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce


# sudo vi /etc/systemd/system/docker.service



sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


sudo yum install -y git
git config --global user.name "Gavin Etheridge"
git config --global user.mail "gavin.etheridge@fasthosts.com"
cd ~
git clone https://github.com/gretheridgefh/media-catcher

sudo mv ./gcsfuse.repo /etc/yum.repos.d/gcsfuse.repo
sudo yum update
sudo yum install -y gcsfuse
mkdir ~/gcsmount
gcsfuse bktgre ~/gcsmount

gsutil config -b
