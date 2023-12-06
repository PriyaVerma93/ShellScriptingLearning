#!/bin/bash
bash components/$1.sh

if  [ $? -ne 0 ] ; then
   echo -e "\e[32m example usgae : bash wrapper.sh componentname \e[0m"
   exit 20
fi 