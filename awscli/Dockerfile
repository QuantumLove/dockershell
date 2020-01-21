FROM alpine:3.10
RUN apk add --no-cache \
        bash=5.0.0-r0 \
        docker=18.09.8-r0 \
        groff=1.22.4-r0 \
        jq=1.6-r0 \
        python3=3.7.5-r1
RUN apk add --no-cache --virtual build-dependencies \
        gcc \
        musl-dev \
        py3-pip \
        python3-dev \
 && pip3 install --no-cache-dir \
        aws-sam-cli==0.21.0 \
        awscli==1.16.234 \
 && apk del build-dependencies

RUN adduser -D aws

WORKDIR /aws
USER aws
ENTRYPOINT ["aws"]
CMD ["help"]