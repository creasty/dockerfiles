FROM python:alpine

RUN apk add --no-cache -U \
    groff \
    less \
    mailcap

RUN pip install awscli

ENTRYPOINT ["aws"]
