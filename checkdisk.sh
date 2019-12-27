#!/bin/bash

##disk space variable initiation
$diskSpace = `python3 checkdisk.py`

## checking available disk space
echo -e " "
echo -e "Checking available disk space"
sleep 2

## if available disk space is under 20 percent
if python3 checkdisk.py < 20; then
    echo -e " "
    echo -e "available disk space = $diskSpace"
    sleep 1
    echo -e "performing docker prune on docker host"
    ansible-playbook docker-prune-playbook.yml

## if available disk space is above 20 percent
else
    echo -e " "
    echo -e "available disk space = $diskSpace"
fi