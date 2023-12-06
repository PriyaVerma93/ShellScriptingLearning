#!/bin/bash

#if condition

echo "demo on if conditions"
ACTION= $1

if [ "$ACTION" == "start" ] ; then
  echo "start shipping service"
  exit 0
fi