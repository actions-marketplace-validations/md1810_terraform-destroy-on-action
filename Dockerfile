FROM ubuntu:18.04

ENV TERRAFORM_VERSION=0.12.16

COPY destroy.sh /destroy.sh

RUN apt-get update && \
    apt-get install curl jq python bash ca-certificates git ssh openssh-server openssl unzip wget -y && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
    
RUN chmod +x /destroy.sh

WORKDIR /

ENTRYPOINT ["/destroy.sh"]
