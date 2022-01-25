#!/bin/sh -l
git clone https://github.com/${{ inputs.org_name }}/${{ inputs.repo_name }}
cd ${{ inputs.repo_name }}/terraform
terraform init && terraform state replace-provider registry.terraform.io/-/aws registry.terraform.io/hashicorp/aws -auto-approve
terraform init && terraform destroy -auto-approve
