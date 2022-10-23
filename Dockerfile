FROM python:3.9.15-alpine3.16

RUN apk update && apk add openjdk8 libpq-dev

#RUN apt-get update && apt-get install openjdk-8-jdk libpq-dev

RUN pip3 install anvil-app-server anvil-uplink
# COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

# ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

# VOLUME ["/data"]

# CMD ["minio", "server", "/data", "--address", ":3005", "--console-address", ":3006"]
