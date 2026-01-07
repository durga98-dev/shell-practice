#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/home/ec2-user/applogs"

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R ERROR:: $SOURCE_DIR doesn't exist $N"
    exit 1;
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime -14)