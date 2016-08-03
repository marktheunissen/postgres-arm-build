FROM resin/rpi-raspbian:jessie

RUN echo "deb-src http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    pkg-config \
    ruby \
    ruby-dev \
    fakeroot \
    wget \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get build-dep \
    postgresql-9.5 \
    postgresql-common \
    postgresql-client-common \
    pgdg-keyring


# WORKDIR /usr/local/src
# RUN gem install fpm \
#     && wget -q https://ftp.postgresql.org/pub/source/v9.5.3/postgresql-9.5.3.tar.gz \
#     && tar zxf postgresql-9.5.3.tar.gz \
#     && rm postgresql-9.5.3.tar.gz

# WORKDIR /usr/local/src/postgres
# RUN git checkout REL_9_5_3

# WORKDIR /usr/local/src/openalpr/src
# RUN sed -i '11 i SET(Tesseract_DIR "/usr/local")' /usr/local/src/openalpr/src/CMakeLists.txt \
#     && sed -i '11 i SET(OpenCV_DIR "/usr/local/lib")' /usr/local/src/openalpr/src/CMakeLists.txt \
#     && cmake ./ \
#     && make -j4 \
#     && make install DESTDIR=/tmp/openalpr

# WORKDIR /root/deb
# RUN echo "export OPENALPR_VERSION=2.2.0-`cd /usr/local/src/openalpr; git rev-parse --short HEAD`" > ENV_VARS \
#     && . ./ENV_VARS \
#     && rm ENV_VARS \
#     && fpm -s dir \
#     -t deb \
#     -m "Mark Theunissen" \
#     --url https://github.com/marktheunissen/lpr-deps \
#     --description "OpenALPR compiled for ARM" \
#     -n openalpr \
#     -v $OPENALPR_VERSION \
#     -C /tmp/openalpr \
#     -p /root/deb/openalpr_VERSION_ARCH.deb \
#     usr \
#     etc

# WORKDIR /root
