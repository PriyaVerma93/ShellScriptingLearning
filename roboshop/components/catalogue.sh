#!/bin/bash

component=catalogue
LOGFILE="/tmp/${component}.log"
repo="https://rpm.nodesource.com/pub_16.x/nodistro/repo/nodesource-release-nodistro-1.noarch.rpm"
uid=$(id -u)
if  [ $uid -ne 0 ] ; then
   echo -e "\e[32mThis script is expected to executed by root user\e[0m"
   exit 20
fi 

stat() { 
if  [ $1 -eq 0 ] ; then
   echo -e "\e[33mSuccess\e[0m"
else
   echo -e "\e[33mFailuree[0m"
fi
}

echo -e "\e[32mconfguring ${component}\e[0m"
echo -n "Installing Repo"
yum install repo &>>LOGFILE
stat $?

echo -n ****"Installing ${component} Service"******
yum install nodejs -y  &>>LOGFILE 
stat $?