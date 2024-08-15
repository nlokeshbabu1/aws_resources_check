#!/bin/bash

####################
# author:- lokesh
# date: 15-08-2024
###################

# Check the nginx is install
if ! command nginx -v &> /dev/shell; then
     #Installing nginx
     yum update 
     yum install -y nginx
else 
  #nginx is already installed
  echo "nginx is already is installed, skipping ....."
fi