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

 - [ sh, -c, "git clone ${playbook_link} /tmp/playbookbootstrap " ]
 - [ sh, -c, "echo TOKEN_BITLY: ${token_bitly} >  /tmp/playbookbootstrap/variables.yaml   "]
 - [ sh, -c, "ansible-playbook  /tmp/playbookbootstrap/playbook.yaml "  ]
