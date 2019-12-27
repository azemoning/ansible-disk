#!/bin/bash

##disk space variable initiation
DISKSPACE="$(python3 checkdisk.py 2>&1)"

## checking available disk space
echo -e " "
echo -e "Checking available disk space"
sleep 2

## if available disk space is under 20 percent
if (($DISKSPACE < 20)); then
    echo -e "available disk space = $DISKSPACE"
    sleep 1
    echo -e "performing docker prune on docker host"
    ansible-playbook docker-prune-playbook.yml

## if available disk space is above 20 percent
else
    echo -e " "
    echo -e "available disk space = $DISKSPACE"
fi