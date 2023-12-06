#!/bin/bash

#if condition

echo "demo on if conditions"
ACTION=$1
if [ "$ACTION" == "start" ] ; then
  echo "start shipping service"
  exit 0
else
  echo " valid option sis start only"
  exit 1
fi