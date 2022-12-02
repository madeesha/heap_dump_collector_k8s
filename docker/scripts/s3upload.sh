#!/bin/bash

for file in /app/log/*.hprof; do
  # get s3 bucket name from env
  zip  $file.zip $file
  aws s3 cp $file.zip s3://$S3_BUCKET_NAME/
  rm $file*
done
