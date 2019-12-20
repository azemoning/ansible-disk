FROM azemoning/ansible-ubuntu:latest
CMD cron && :>> /var/log/ansible_disk.log && tail -f /var/log/ansible_disk.log