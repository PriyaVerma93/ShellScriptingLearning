#!/bin/bash

#if condition
ACTION= $1

if [ "$ACTION" == "start" ] ; then
  echo "start shipping service"
  exit 0
fi