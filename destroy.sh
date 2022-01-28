#!/bin/sh -l
git clone https://$INPUT_ORG_NAME:$TOKEN_GITHUB@github.com/$INPUT_ORG_NAME/$INPUT_REPO_NAME
cd $INPUT_REPO_NAME/terraform
terraform init && terraform state replace-provider registry.terraform.io/-/aws registry.terraform.io/hashicorp/aws -auto-approve
terraform init && terraform destroy -auto-approve
