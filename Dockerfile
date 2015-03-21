## Base image to use
FROM resin/rpi-raspbian:jessie-2015-02-08

## Maintainer info
MAINTAINER siuying <https://github.com/siuying>

## Install prerequisites
RUN apt-get update && \
  apt-get install -y python git-core && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

## Install Couchpotato
RUN cd /opt && \
  git clone https://github.com/RuudBurger/CouchPotatoServer.git

## Expose port
EXPOSE 5050

## Set working directory
WORKDIR /opt

# Set volume
VOLUME /movies

## Run Couchpotato
ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py"]
