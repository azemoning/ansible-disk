FROM ubuntu:18.04
RUN apt update && apt install software-properties-common -y && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt install git ansible openssh-server -y && \
    sed -i 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg && \
    git clone https://gitlab.com/azemoning/ansible-disk /root/ansible-disk/
WORKDIR /root/ansible-disk/
RUN chmod +x *.sh && \
    cp ansiblecron /etc/cron.d/ && chmod 0644 /etc/cron.d/ansiblecron && \
    touch /var/log/ansible_disk.log