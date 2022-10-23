FROM python:3.9.15-alpine3.16

RUN apk update && apk add apt-get

#RUN apt-get update && apt-get install openjdk-8-jdk libpq-dev

RUN python3 --version
# COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

# ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

# VOLUME ["/data"]

# CMD ["minio", "server", "/data", "--address", ":3005", "--console-address", ":3006"]
