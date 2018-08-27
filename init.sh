#!/usr/bin/env bash

aws s3api create-bucket --acl private --bucket terraform-creanga-artifacts-bucket
aws s3api put-bucket-versioning --bucket terraform-creanga-artifacts-bucket --versioning-configuration Status=Enabled

terraform init
