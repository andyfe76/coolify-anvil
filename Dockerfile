#FROM python:3.9.15-alpine3.16
FROM debian:latest

# RUN apk update && apk add openjdk8 libpq-dev gcc musl-dev

RUN apt-get update && apt-get install -y openjdk-11-jdk libpq-dev python3 python3-venv python3-pip build-essential python3-dev

RUN python3 -m pip install --upgrade pip
RUN pip3 install wheel anvil-app-server anvil-uplink
# COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

# ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

# VOLUME ["/data"]

# CMD ["minio", "server", "/data", "--address", ":3005", "--console-address", ":3006"]
