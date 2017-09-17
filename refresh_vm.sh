#!/bin/bash
#Destroy vagrant box, create new one & put ssh key.
printf "destroying vagrant VM...\n"
sh -c 'vagrant destroy -f'
ssh-keygen -R '[127.0.0.1]:2222'
ssh-keygen -R '[localhost]:2222'
rm -rf $HOME/.ssh/known_hosts.old
rm -rf zfs_disk.vdi
printf "creating vagrant VM...\n"
sh -c 'vagrant up'
ssh-keyscan -p2222 -t rsa 127.0.0.1 >> $HOME/.ssh/known_hosts
ssh-keyscan -p2222 -t rsa localhost >> $HOME/.ssh/known_hosts
ansible-playbook -i inv play.yml --limit vm1.getcloud.io
