#the rsync version available for python:3.11-rc-alpine is currently broken!
FROM python:3.11-rc-slim

LABEL maintainer="martin.boettcher@greenbytes.de"
LABEL name="Python tool for analysing DNS RFC security issues"
LABEL description="Python based tool for analyzing DNS RFC security issues"
LABEL version="0.0.37" release="37"

RUN apt-get update; apt-get install -y rsync
# rc-alpine version: RUN apk add rsync

WORKDIR /
RUN mkdir default-config
COPY program/* /
COPY default-config/* default-config

CMD ["python3", "-u", "main.py"]