FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    pkg-config \
    fakeroot \
    wget \
    && echo "deb-src http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get build-dep \
    postgresql-9.5 \
    postgresql-common \
    postgresql-client-common \
    pgdg-keyring

RUN mkdir /builds \
    && useradd compile \
    && mkdir /home/compile \
    && chown compile:compile /home/compile \
    && chown compile:compile /builds

USER compile
WORKDIR /builds
RUN apt-get source --compile postgresql-9.5
RUN apt-get source --compile postgresql-common
RUN apt-get source --compile postgresql-client-common
RUN apt-get source --compile pgdg-keyring
