#!/bin/bash
set -e
aws ssm get-parameters-by-path --path "/starttech/backend" --with-decryption \
  --query "Parameters[*]" --output json | jq -r '.[] | "\(.Name | split("/")[-1])=\(.Value)"' > /opt/starttech/.env
chmod 600 /opt/starttech/.env
