#!/bin/bash

component=catalogue
LOGFILE="/tmp/${component}.log"
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

echo -e ****************"\e[32m confguring ${component} \e[0m"******