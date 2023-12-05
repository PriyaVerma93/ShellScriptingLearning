#!/bin/bash
DATE=$(date +%F)
echo "Today date is $DATE"

No_Of_Sessions=$(who|wc -l)
echo "No of users login: $(No_Of_Sessions)"