#!/bin/sh -l
git clone https://$INPUT_ORG_NAME:$TOKEN_GITHUB@github.com/iamops/terraform-deploy-destroy.git
cd $INPUT_REPO_NAME/terraform
terraform init && terraform state replace-provider registry.terraform.io/-/aws registry.terraform.io/hashicorp/aws -auto-approve
terraform init && terraform destroy -auto-approve
