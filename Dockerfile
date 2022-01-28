FROM alpine:3.10

ENV TERRAFORM_VERSION=0.12.16

COPY destroy.sh /destroy.sh

# Make ssh dir
RUN mkdir /root/.ssh/

ADD id_rsa /root/.ssh/id_rsa

RUN chmod 700 /root/.ssh/id_rsa
RUN chown -R root:root /root/.ssh

RUN touch /root/.ssh/known_hosts


RUN apk update && \
    apk add curl jq python bash ca-certificates git openssh openssl unzip wget && \
    cd /tmp && \
    RUN apk add --no-cache openssh-client \
    && ssh-keyscan github.com > ~/.ssh/known_hosts
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
    
RUN chmod +x /destroy.sh

WORKDIR /

ENTRYPOINT ["/destroy.sh"]
