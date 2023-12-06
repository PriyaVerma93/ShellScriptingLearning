#!/bin/bash

uid=$(id -u)
if  [ $uid -ne 0 ] ; then
   echo -e "\e[32mThis script is expected to executed by root user\e[0m"
   exit 20
fi 

echo -e ****************"\e[32m confguring frontend \e[0m"******
echo -e "\e[33mInstalling Nginx\e[0m"
yum install nginx -y &>> /tmp/frontend.log
if  [ $? = 0 ] ; then
   echo -e "\e[34mSuccess\e[0m"
else
   echo -e "\e[35mFailuree[0m"
fi 