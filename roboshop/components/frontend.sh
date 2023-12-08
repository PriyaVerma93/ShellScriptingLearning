#!/bin/bash

component=frontend
LOGFILE="/tmp/$(component).log"
uid=$(id -u)
if  [ $uid -ne 0 ] ; then
   echo -e "\e[32mThis script is expected to executed by root user\e[0m"
   exit 20
fi 

stat() { 
if  [ $? -eq 0 ] ; then
   echo -e "\e[34mSuccess\e[0m"
else
   echo -e "\e[35mFailuree[0m"
fi
}

echo -e ****************"\e[32m confguring frontend \e[0m"******
echo -n "***Installing Nginx***"
yum install nginx -y &>> $LOGFILE
stat $?

echo -n "Downloading the ${component}:"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
stat $?

echo -n "cleanup of ${component}"
cd /usr/share/nginx/html
rm -rf * &>> /tmp/frontend.log
stat $?

echo -n "Extracting the ${component}"
unzip /tmp/frontend.zip   &>> $LOGFILE
stat $?

echo -n "configuring ${component}"
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "updating reverse proxy"
sed "/catalogue/s/localhost/catalogue.roboshop.internal/" /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Restarting ${component}"
 systemctl enable nginx &>> $LOGFILE
 systemctl daemon-reload &>> $LOGFILE
 systemctl restart nginx &>> $LOGFILE
stat $?

