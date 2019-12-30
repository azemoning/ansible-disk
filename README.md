## Ansible Docker Host Disk Checker

Docker host disk checker with ansible on docker container.  

### Usage

To use the custom base image before deploying to docker host, you can rebuild the base image with the available Dockerfile on this repository and change the ***deploy.dockerfile*** base image to your own custom base image.

#### Prerequisite

Because this ansible playbook using SSH password authentication for connecting from docker container to docker host, then you must create special user from your docker host for ansible to connect and add the user to the docker group.

E.g.

Creating new user
```bash
sudo adduser youruser
```
Adding user to docker group
```bash
sudo usermod -aG docker youruser
```

#### Deploy

Before deploying the container into the docker host, you must build the image from the ***deploy.dockerfile*** file, then you can deploy the image with ```docker run``` or using ```docker-compose up``` or using orchestration like ```docker swarm```.

Make sure you set the environment variables from ***deploy.dockerfile*** files with your docker host user credentials.  

E.g.
```dockerfile
ENV ANSIBLE_HOST='1.2.3.4'
ENV ANSIBLE_USER='foo'
ENV ANSIBLE_PASSWORD='bar'
```

#### Configuring the disk space condition

By default the disk condition is set to ```< 20```

You can set the condition by editing the ***checkdisk.sh*** file

E.g.

```bash
if (($DISKSPACE < 10)); then
    ...
    ...

```

#### Configuring ansible playbook

If you want to change what the ansible playbook do if the disk space condition fulfilled, you can write your own ansible playbook and rebuild the base image for the ***deploy.dockerfile***.

#### Configuring cron schedule
To configure cron schedule, please refer to the official cron formatting.  
Or you can go to https://crontab.guru/ to get a quick start about cron schedule expressions. 

**Do not remove the empty line at the end of the cron file! It is required to run the cron job.**  
If there is no empty line at the file, please add by yourself.
