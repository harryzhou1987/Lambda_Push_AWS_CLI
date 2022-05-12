#!/bin/sh

# Source the config file
. ./config.ini

# Variables
region="ap-southeast-2"
lambda_name="Printout-Event-Function"  
zip_file="lambda_handler.zip"
handler="lambda_function"
files="lambda_function.py"
role_arn="$role_arn"   # Sensitive config stored in config file but is not pushed to Github
bucket_name="$bucket_name"    # Sensitive config stored in config file but is not pushed to Github
key_name="lambda/${lambda_name}/${zip_file}"

# Zip Folders and Files
chmod 755 ${files}
zip -r "${zip_file}" sample_lib ${files}

# Copy the zip file in S3 bucket
/usr/local/bin/aws s3 cp ${zip_file} s3://${bucket_name}/${key_name}

# /usr/local/bin/aws lambda get-function \
#     --function-name  "${lambda_name}"


# /usr/local/bin/aws lambda update-function-code \
#    --function-name "${lambda_name}"  \
#    --zip-file "fileb://${zip_file}" \
#    --publish

/usr/local/bin/aws lambda create-function \
   --region "${region}" \
   --function-name "${lambda_name}"  \
   --zip-file "fileb://${zip_file}" \
   --role "${role_arn}" \
   --handler "${handler}.lambda_handler" \
   --runtime python3.9 \
   --timeout 3 \
   --memory-size 128 


