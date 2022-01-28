#!/bin/sh -l
git clone https://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@github.com/$INPUT_ORG_NAME/$INPUT_REPO_NAME
cd $INPUT_REPO_NAME/terraform
terraform init && terraform state replace-provider registry.terraform.io/-/aws registry.terraform.io/hashicorp/aws -auto-approve
terraform init && terraform destroy -auto-approve
