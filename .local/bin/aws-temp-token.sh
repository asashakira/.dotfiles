#!/bin/bash -e

# ./aws-temp-token.sh token-code
TOKEN_CODE=$1

MFA_DEVICE_ARN=arn:aws:iam::157507247180:mfa/akira.itai
AWS_PROFILE=mfa
AWS_REGION=ap-northeast-1
DURATION=129600

# credentials
CREDENTIALS=$(aws sts get-session-token --serial-number ${MFA_DEVICE_ARN} --duration-seconds ${DURATION} --token-code ${TOKEN_CODE} | jq -r '.Credentials')

# Display Expiration
echo "Expiration: "$(echo $CREDENTIALS | jq -r '.Expiration')

# set to mfa profile
aws configure set aws_access_key_id $(echo $CREDENTIALS | jq -r '.AccessKeyId') --profile $AWS_PROFILE
aws configure set aws_secret_access_key $(echo $CREDENTIALS | jq -r '.SecretAccessKey') --profile $AWS_PROFILE
aws configure set aws_session_token $(echo $CREDENTIALS | jq -r '.SessionToken') --profile $AWS_PROFILE

exit 0
