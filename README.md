# Lambda_Push_AWS_CLI
Use AWS CLI to push/deploy the lambda function in AWS Cloud after local testing. 


## Notes
- Config file (config.ini) is in the same directory
```ini
role_arn="your-own-lambda-role-arn"   
bucket_name="your-own-bucket-name"   
```
- Modify the shell script - PushToS3.sh
    - May need to modify the permission of the file for execution
```
$chmod 744 PushToS3.sh
```