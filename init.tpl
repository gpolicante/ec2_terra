#cloud-config
repo_update: true
repo_upgrade: all

apt_sources: 
 - source: "ppa:ansible/ansible"

packages:
 - python-pip
 - vim
 - curl 
 - wget 
 - software-properties-common
 - ansible 



