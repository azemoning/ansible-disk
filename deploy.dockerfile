FROM azemoning/ansible-ubuntu:latest
ENV ANSIBLE_HOST='host'
ENV ANSIBLE_USER='host-user'
ENV ANSIBLE_PASSWORD='user-password'
RUN echo '${ANSIBLE_HOST} ansible_user=${ANSIBLE_USER} ansible_password=${ANSIBLE_PASSWORD}' >> /etc/ansible/hosts
CMD cron && :>> /var/log/ansible_disk.log && tail -f /var/log/ansible_disk.log