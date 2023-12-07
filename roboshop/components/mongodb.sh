#!/bin/bash

component=mongo
LOGFILE="/tmp/${component}.log"
repo="https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo"
schema="https://github.com/stans-robot-project/mongodb/archive/main.zip""
uid=$(id -u)
if  [ $uid -ne 0 ] ; then
   echo -e "\e[32mThis script is expected to executed by root user\e[0m"
   exit 20
fi 

stat() { 
if  [ $? -eq 0 ] ; then
   echo -e "\e[33mSuccess\e[0m"
else
   echo -e "\e[33mFailuree[0m"
fi
}

echo -e ****************"\e[32m confguring ${component} \e[0m"******
echo -n "Configuring Repo:"
curl -s -o /etc/yum.repos.d/mongodb.repo $repo
stat $?

echo -n "Installing service ${component}"
yum install -y mongodb-org &>>LOGFILE
stat $?

echo -n "Enabling ${component} visibility"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?

echo -n "Restarting ${component}"
systemctl enable mongod &>> $LOGFILE
systemctl daemon-reload &>> $LOGFILE
systemctl restart mongod &>> $LOGFILE
stat $?

echo -n "Downloading ${component} Schema"
curl -s -L -o /tmp/mongodb.zip $schema
stat$?

echo -n "Extracting ${component} : "
unzip -o /tmp/${component}.zip  &>> $LOGFILE
stat$?

echo -n  "Injecting schema:" 
cd /tmp/mongodb-main
mongo < catalogue.js
mongo < users.js
stat $?







