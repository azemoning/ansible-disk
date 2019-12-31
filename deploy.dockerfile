FROM azemoning/ansible-disk:latest
ENV ANSIBLE_HOST='host'
ENV ANSIBLE_USER='host-user'
ENV ANSIBLE_PASSWORD='user-password'
RUN echo '[dockerhost]' >> /etc/ansible/hosts && \ 
    echo $ANSIBLE_HOST ansible_user=$ANSIBLE_USER ansible_password=$ANSIBLE_PASSWORD >> /etc/ansible/hosts && \
    env > env.env
CMD cron && :>> /var/log/ansible_disk.log && tail -f /var/log/ansible_disk.log