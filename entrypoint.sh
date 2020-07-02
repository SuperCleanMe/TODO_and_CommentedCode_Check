#!/bin/sh -l

commented_code=$(egrep -rn  "# " *.py > a && egrep -rn "#" *.py > b && diff -c a b | grep  "+" && rm a && rm b)
#echo $? # 2 is no .py # 1 is no commented code 0 is commented code

case $? in
    1) echo "No commented out code found" && exit 0 ;;
    2) echo "No .py files to check in project" && exit 0 ;;
    0) echo $commented_code && exit 1 ;;
esac
    
