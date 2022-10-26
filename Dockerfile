#FROM python:3.9.15-alpine3.16
FROM debian:latest

# RUN apk update && apk add openjdk8 libpq-dev gcc musl-dev

RUN apt-get update && apt-get install -y openjdk-11-jdk libpq-dev python3 python3-venv python3-pip build-essential python3-dev procps


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

#working
#CMD ["/home/anvil/.local/bin/anvil-app-server", "--data-dir", "/app/data", "--uplink-key", "1qaz2wsx3edc", "--port", "443", "--origin", "https://172.16.16.4", "--disable-tls", "--app", "/app/"]
#CMD ["/home/anvil/.local/bin/anvil-app-server", "--data-dir", "/app/data", "--uplink-key", "1qaz2wsx3edc", "--ip", "0.0.0.0", "--port", "443", "--origin", "https://localhost", "--disable-tls", "--forward-headers-insecure", "--add-hsts-headers", "--app", "/app/"]
#CMD ["/home/anvil/.local/bin/anvil-app-server", "--data-dir", "/app/data", "--uplink-key", "1qaz2wsx3edc", "--port", "443", "--origin", "https://172.16.16.4", "--disable-tls", "--app", "/app/"]
#CMD ["/home/anvil/.local/bin/anvil-app-server", "--data-dir", "/app/data", "--uplink-key", "1qaz2wsx3edc", "--port", "443", "--disable-tls", "--app", "/app/"]

CMD ["/home/anvil/.local/bin/anvil-app-server", "--data-dir", "/app/data", "--uplink-key", "server_WUMI36BBIX2S4HTDRZR3MZS4-WG5XD5QBYR4LD4KH",  "--origin", "", "--port", "80",  "--app", "/app/"]

# COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

# ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

# VOLUME ["/data"]

# CMD ["minio", "server", "/data", "--address", ":3005", "--console-address", ":3006"]
