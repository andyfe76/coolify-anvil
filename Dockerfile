#FROM python:3.9.15-alpine3.16
FROM debian:latest

# RUN apk update && apk add openjdk8 libpq-dev gcc musl-dev

RUN apt-get update && apt-get install -y openjdk-11-jdk libpq-dev python3 python3-venv python3-pip build-essential python3-dev


RUN useradd -s /bin/bash -m  anvil
RUN mkdir -p /app
COPY AnvilDocker app
RUN chown anvil:anvil -R /app
USER anvil

RUN python3 -m pip install --upgrade pip
RUN pip3 install anvil-app-server anvil-uplink

WORKDIR /app
RUN mkdir -p data

# RUN /home/anvil/.local/bin/anvil-app-server --data-dir /app/data --app /app/

CMD ["/home/anvil/.local/bin/anvil-app-server", "--data-dir", "/app/data", "--disable-tls", "--app", "/app/"]

# COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

# ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

# VOLUME ["/data"]

# CMD ["minio", "server", "/data", "--address", ":3005", "--console-address", ":3006"]
