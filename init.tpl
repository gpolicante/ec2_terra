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


runcmd:
 - [ sh, -c, "echo batata > /tmp/batata" ]
 - [ sh, -c, "git clone ${playbook_link} /tmp/playbookbootstrap " ]
 - [ sh, -c, "ansible-playbook -e TOKEN=${token_bitly}  /tmp/playbookbootstrap/playbook.yaml "  ]
