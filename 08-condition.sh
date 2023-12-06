#!/bin/bash
#case example

ACTION=$1
case $ACTION in 
   start)
       echo -e "\e[32m starting shipping service \e[0m"
       exit 0
       ;;
    stop)
       echo -e "\e[30m stopping shipping service \e[0m"
       exit 1
       ;;
    restart)
       echo -e "\e[30m restarting shipping service \e[0m"
       exit 2
       ;;
     *)
     echo -e "\e[32m valid options are start stop or Restart\e[0m]"
esac