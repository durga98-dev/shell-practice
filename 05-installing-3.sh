#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root privilege"
    exit 1
fi

# Function - will not run unless until we call it explicitly
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: $2 installation is Failed"
        exit 1
    else
        echo "$2 installation is success"
    fi
}

dnf install mysql -y

VALIDATE $? "MySQL"

dnf install nginx -y

VALIDATE $? "Nginx"