#!/bin/bash

echo -e "$hr\nWHOAMI\n$hr"
whoami
echo $HOME
id

echo -e "\n$hr\nHOME PROFILES\n$hr"
ls -al $HOME

echo -e "$hr\nSSH FILES\n$hr"
ls -lL /root/.ssh

echo -e "\n$hr\nENVIRONTMENT\n$hr"
HR=$hr && unset hr
HRD=$hrd && unset hrd
printenv | sort
export hr=$HR
export hrd=$HRD

[[ ! -f $HOME/.docker/config.json ]] && exit 0

echo -e "\n$hr\nDOCKER VERSION\n$hr"
docker version

echo -e "\n$hr\nDOCKER INFO\n$hr"
docker info

echo -e "$hr\nIMAGE BUILDERS\n$hr"
docker images --all | sort

echo -e "\n$hr\nCURRENTLY RUNNING\n$hr"
docker ps
