#!/bin/bash

echo " printing script name : $0"
echo " print first argument : $1"
echo " print seconf argument : $2"
echo $#
echo $?
echo $*
echo $@


#quote

echo $?
echo "$?"
echo '$?'
