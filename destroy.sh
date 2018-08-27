#!/usr/bin/env bash

terraform destroy
#aws s3 rb s3://$TF_VAR_terraform_s3bucket --force