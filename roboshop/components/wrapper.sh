#!/bin/bash
bash components/$1.sh

if  [ $? -ne 0 ] ; then
   echo "\e[32m example usgae : \e[0m bash wrapper.sh componentname"
   exit 20
fi 