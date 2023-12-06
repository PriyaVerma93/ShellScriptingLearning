#!/bin/bash

#if condition

echo "demo on if conditions"
ACTION=$1
if [ "$ACTION" == "start" ] ; then
  echo "start shipping service"
  exit 0
elif [ "$ACTION" == "stop" ] ; then
  echo "stopping shipping service"
  exit 1
else
  echo " valid option is start and stop only"
  exit 2
fi