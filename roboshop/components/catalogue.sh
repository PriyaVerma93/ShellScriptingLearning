#!/bin/bash

component=catalogue
LOGFILE="/tmp/${component}.log"
APPUSER="Roboshop"
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

#echo -e "\e[33mConfiguring ${component}Repo\e[0m"
#curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>>LOGFILE 
#stat $?

echo -n ****"Installing ${component} Service"******
yum install nodejs -y  &>>LOGFILE 
stat $?

id=$APPUSER   &>>LOGFILE 
echo -e "\e[32mCreating $APPUSER\e[0m"
if [ $? -ne 0 ] ; then
   useradd $APPUSER
   stat $?
else
   echo -e "\e[33mskipping\e[0m"
fi

echo -n "downloading the ${component}:"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"  &>>LOGFILE 
stat $?


   
