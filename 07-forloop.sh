!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
LOG_FILE_NAME= echo $0 | cut -d "." -f1
LOG_FILE= $LOG_FOLDER/$LOG_FILE_NAME.log

if [ $USERID -ne 0 ]; then
    echo -e "$R ERROR:: Run the script with root privilege $N"
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

#$@ - All arguments

for package in $@; then
do
    #checking if package is already installed or not
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "Package $package already installed" ...$Y Skipping....$N"
    fi
done

