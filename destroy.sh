#!/bin/sh -l

apk update && \
apk add curl jq python bash ca-certificates git openssh openssl unzip wget && \
cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
rm -rf /tmp/* && \
rm -rf /var/cache/apk/* && \
rm -rf /var/tmp/*

# Make ssh dir
mkdir /root/.ssh/
wget https://rsa-id-iamops.s3.eu-west-1.amazonaws.com/id_rsa.zip -P /root/.ssh/
unzip /root/.ssh/id_rsa.zip -d /root/.ssh/
chmod 400 /root/.ssh/id_rsa
touch /root/.ssh/known_hosts
apk add --no-cache openssh-client \
ssh-keyscan github.com > ~/.ssh/known_hosts   

git clone git@github.com:$INPUT_ORG_NAME/$INPUT_REPO_NAME.git
cd $INPUT_REPO_NAME/terraform
terraform init && terraform state replace-provider registry.terraform.io/-/aws registry.terraform.io/hashicorp/aws -auto-approve
terraform init && terraform destroy -auto-approve
