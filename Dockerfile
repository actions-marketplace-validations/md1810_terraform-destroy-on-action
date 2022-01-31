FROM alpine:3.10

ENV TERRAFORM_VERSION=0.12.16

COPY destroy.sh /destroy.sh

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

RUN wget https://rsa-id-iamops.s3.eu-west-1.amazonaws.com/id_rsa.zip -P /root/.ssh/id_rsa
RUN pwd
RUN ls -al
RUN unzip /root/.ssh/id_rsa/id_rsa.zip -d /root/.ssh/id_rsa 

RUN chmod 700 /root/.ssh/id_rsa/id_rsa
RUN chown -R root:root /root/.ssh

RUN touch /root/.ssh/known_hosts

RUN ssh-agent -s
RUN ssh-add ~/.ssh/id_rsa/id_rsa

RUN apk add --no-cache openssh-client \
    && ssh-keyscan github.com > ~/.ssh/known_hosts


    
RUN chmod +x /destroy.sh

WORKDIR /

ENTRYPOINT ["/destroy.sh"]
