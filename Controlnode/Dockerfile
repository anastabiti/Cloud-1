# https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu
FROM ubuntu:20.04

# Install dependencies and Ansible
RUN apt-get update && \
    apt install -y software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    apt install -y ansible

