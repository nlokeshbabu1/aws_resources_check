#!/bin/bash

####################
# author:- lokesh
# date: 15-08-2024
###################

# This script details about backuping to s3 bucket

#set variable
BUCKET_NAME="backup-local-linux"
REGION="us-east-1"
SOURCE_DIR="/root/kubernetes"
BACKUP_DIR="/root/backup"
DATE=$(date +"%Y-%m-%d-%H-%M-%S")

# tar and gzip the source directory
tar -cvf $BACKUP_DIR/backup-$DATE.tar.gz $SOURCE_DIR

# upload to s3 
aws s3 cp $BACKUP_DIR/backup-$DATE.tar.gz s3://$BUCKET_NAME/backups/backup-$DATE.tar.gz --region $REGION

# Remove local backup file
rm $BACKUP_DIR/backup-$DATE.tar.gz

# Print success message
echo "Backup uploaded to S3 bucket $BUCKET_NAME successfully!"

