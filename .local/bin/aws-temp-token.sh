#!/usr/bin/env bash

set -eu

ENV="prod" # <-- SET HERE
MFA_DEVICE_ARN=arn:aws:iam::157507247180:mfa/akira.itai # <-- SET HERE
AWS_PROFILE=mfa
DURATION=129600

if ! command -v aws &>/dev/null; then
  echo "REQUIRE: aws" >&2
  exit 1
fi

if [[ $# != 1 ]]; then
  echo "USAGE: $0 <token-code>" >&2
  exit 1
fi

TOKEN_CODE=$1

if [[ "$TOKEN_CODE" == "" ]]; then
  echo "Error: token-code is empty." >&2
  exit 1
fi

CREDENTIALS=$(
  aws sts get-session-token \
    --serial-number "$MFA_DEVICE_ARN" \
    --duration-seconds $DURATION \
    --token-code "$TOKEN_CODE" \
)

if [[ "$CREDENTIALS" == "" ]]; then
  echo "Error: fetched credencial is empty." >&2
  exit 1
fi

echo "SUCCESS!"
echo "$CREDENTIALS" | awk -F ': ' '/Expiration/{print "Expires at: "$2}'
aws configure set aws_access_key_id $(echo "$CREDENTIALS" | awk -F '[:"]' '/AccessKeyId/{print $(NF-1)}') --profile $AWS_PROFILE
aws configure set aws_secret_access_key $(echo "$CREDENTIALS" | awk -F '[:"]' '/SecretAccessKey/{print $(NF-1)}') --profile $AWS_PROFILE
aws configure set aws_session_token $(echo "$CREDENTIALS" | awk -F '[:"]' '/SessionToken/{print $(NF-1)}') --profile $AWS_PROFILE
