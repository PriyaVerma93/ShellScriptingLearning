#!/bin/bash

component=catalogue
LOGFILE="/tmp/${component}.log"
APPUSER="roboshop"
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
echo -n "extracting the ${component}"
cd /home/roboshop
unzip -o /tmp/catalogue.zip  &>>LOGFILE 
stat $?

echo -n "configuring the ${component} permissions:"
mv /home/${APPUSER}/${component}-main /home/${APPUSER}/${component}
chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${component}
chmod -R 770 /home/${APPUSER}/${component}
stat $?

echo -n "generating artifcats"
cd /home/${APPUSER}/${component}
npm install &>>LOGFILE
stat $?

echo -n "updating syatemservice file"
cd /home/${APPUSER}/${component}
sed -i -e 's/MONGO_DNSNAME/mongod.roboshop.internal/' systemd.service
mv /home/${APPUSER}/${component}/systemd.service /etc/systemd/system/${component}.service
stat $?
echo -n "Restarting ${component}"
 systemctl enable ${component} &>> $LOGFILE
 systemctl daemon-reload &>> $LOGFILE
 systemctl restart ${component} &>> $LOGFILE
stat $?











   
