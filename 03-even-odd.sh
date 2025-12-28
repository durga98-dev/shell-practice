#!/bin/bash

NUMBER=$1

RMDR=$((NUMBER % 2))

if [ ${RMDR} -eq 0 ]; then
    echo "Given number "${NUMBER}" is even
else 
    echo "Given number "${NUMBER}" is odd
fi