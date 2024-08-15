#!/bin/bash

#######################################################
#This script list the resources in the aws
# Author: lokesh
# date: 15-08-2024
# Script to automate the listing of the resources in the aws account

#EC2
#S3
#VPC
#IAM
#Route 53
#EBS
#EFS
#DyanmoDB

#This script with prompt the user to enter the aws region and the services for the resources need to be listed
# Usage: ./aws_resource_list.sh  <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-1 ec2
#############################################################################

# Check the requried number of arguments are passed
if [ $# -ne 2 ] ; then   # $# mean # mean number not equal to 2 
   echo "Usage: ./aws_resource_list.sh  <aws_region> <aws_service>"
   echo "Example: ./aws_resource_list.sh us-east-1 ec2"
   exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$2

# check the aws cli is installed
#&> is used to redirect both stdout and stderr.
#/dev/null is a special file in Unix-like systems that discards all the data written to it. Essentially, it "silently" ignores the output.
if ! command -v aws &> /dev/null; then 
   echo "AWS cli is not installed . Please install the aws cli and try again"
   exit 1
fi

# check the aws cli is configured
if [ ! -d ~/.aws ]; then
   echo "AWS cli is not configured . Please configure the aws cli"
   exit 1
fi

# list the resources in the aws account
case $aws_service in 
    ec2)
       echo "Listing the EC2 instance in $aws_region"
       aws ec2 describe-instances --region $aws_region
       ;;
    vpc)
       echo "listing the vpc in $aws_region"
       aws ec2 describe-vpcs --region $aws_region
       ;;
    S3)
       echo "listing the s3 in $aws_region"
       aws s3 ls
       ;;
    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;    
esac
