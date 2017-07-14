FROM hashicorp/terraform:latest

RUN apk add --no-cache -U \
    py-pip \
    python-dev \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    ca-certificates \
    sudo \
    openssl

RUN pip install \
    awscli \
    ansible \
    boto \
    boto3

RUN adduser -g "Terraform User" -D -s /usr/sbin/nologin terraform
USER terraform

CMD ["-version"]
