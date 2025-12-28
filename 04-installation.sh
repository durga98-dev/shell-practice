#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root privilege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Mysql installation is Failed"
    exit 1
else
    echo "MySQL installation is success"
fi