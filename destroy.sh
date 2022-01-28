#!/bin/sh -l

git clone git@github.com:$INPUT_ORG_NAME/$INPUT_REPO_NAME.git
cd $INPUT_REPO_NAME/terraform
terraform init && terraform state replace-provider registry.terraform.io/-/aws registry.terraform.io/hashicorp/aws -auto-approve
terraform init && terraform destroy -auto-approve
