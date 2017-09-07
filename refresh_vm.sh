#!/bin/bash

printf "destroying vagrant VM...\n"
sh -c 'vagrant destroy -f'
ssh-keygen -R [127.0.0.1]:2222
rm -rf $HOME/.ssh/known_hosts.old
printf "creating vagrant VM...\n"
sh -c 'vagrant up'
ssh-keyscan -p2222 -t rsa 127.0.0.1 >> $HOME/.ssh/known_hosts
ansible-playbook -i inv play.yml --limit vm1.getcloud.io