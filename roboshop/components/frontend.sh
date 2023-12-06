#!/bin/bash

component=$1
uid=$(id -u)
if  [ $uid -ne 0 ] ; then
   echo -e "\e[32mThis script is expected to executed by root user\e[0m"
   exit 20
fi 

echo -e ****************"\e[32m confguring frontend \e[0m"******
echo -n "***Installing Nginx***"
yum install nginx -y &>> /tmp/frontend.log
if  [ $? = 0 ] ; then
   echo -e "\e[34mSuccess\e[0m"
else
   echo -e "\e[35mFailuree[0m"
fi 
echo -n "Downloading the Component $1 :"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
if  [ $? = 0 ] ; then
   echo -e "\e[34m component downloaded successfully \e[0m"
else
   echo -e "\e[35m Downloading Failuree [0m"
fi 
