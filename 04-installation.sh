#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root privilege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Mysql installation is Failed"
else
    echo "MySQL installation is success"
fi