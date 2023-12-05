#!/bin/bash
DATE=$(date +%F)
echo "Today date is $DATE"

No_Of_Sessions=$(who|wc -l)
echo -e  "\e[32m No of users login: $No_Of_Sessions\e[0m"