FROM ubuntu:18.04

# Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
       bash-completion \
       ca-certificates \
       curl \ 
       groff \
       jq \
       less \
       nano \
       python3 \
       gcc \
       gawk \
       musl-dev \
       uuid-runtime \
       python3-pip \
       python3-dev \
       python3-setuptools

# Should be extracted into a separate container and added to bash.rc and run from there
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash \
       && apt install -y --no-install-recommends nodejs

# CLI and BASH should be in different containers. Bash should spawn CLI container
# AWS CLI and SAM
RUN pip3 install --no-cache-dir \
       aws-sam-cli==0.21.0 \
       awscli==1.16.234


RUN echo ". /etc/bash_completion" >> ~/.bashrc \
    && rm -rf /var/lib/apt/lists/*

RUN adduser aws

WORKDIR /aws
USER aws
ENTRYPOINT ["aws"]
CMD ["help"]