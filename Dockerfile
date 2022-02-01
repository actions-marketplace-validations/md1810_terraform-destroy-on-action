FROM alpine:3.10

ENV TERRAFORM_VERSION=0.12.16

COPY destroy.sh /destroy.sh
#RUN pwd

RUN apk update && \
    apk add curl jq python bash ca-certificates git openssh openssl unzip wget && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*

# Make ssh dir
RUN mkdir /root/.ssh/
RUN wget https://aggua-github-ssh.s3.eu-west-1.amazonaws.com/id_rsa -P /root/.ssh/
RUN unzip /root/.ssh/id_rsa.zip -d /root/.ssh/
RUN chmod 400 /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
RUN apk add --no-cache openssh-client \
    && ssh-keyscan github.com > ~/.ssh/known_hosts    
RUN chmod +x /destroy.sh

WORKDIR /

ENTRYPOINT ["/destroy.sh"]
