#!/bin/bash
virtualenv -p /usr/bin/python3 ansenv
source ansenv/bin/activate
pip install ansible
ansible-playbook playbook.yml
