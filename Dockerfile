FROM debian:11-slim

ARG LUFI_VERSION=0.05.21

USER root

RUN apt update \
	&& apt install -y \
    wget \
    unzip \
    cron \
	build-essential \
	libssl-dev \
    zlib1g-dev \
	libio-socket-ssl-perl \
	libmojo-pg-perl \
	liblwp-protocol-https-perl \
	&& apt-get clean -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log,tmp}/*

RUN cpan Carton
WORKDIR /lufi


RUN wget https://framagit.org/fiat-tux/hat-softwares/lufi/-/archive/${LUFI_VERSION}/lufi-${LUFI_VERSION}.zip \
    && unzip lufi-${LUFI_VERSION}.zip -d /tmp \
    && mv /tmp/lufi-${LUFI_VERSION}/* /lufi \
    && rm -rf /tmp/* lufi-${LUFI_VERSION}.zip


COPY lufi.conf /lufi/lufi.conf
COPY docker-entrypoint.sh /lufi/docker-entrypoint.sh
RUN chmod a+x /lufi/docker-entrypoint.sh


RUN carton install --deployment --without=test --without=mysql \
    && rm -rf local/cache/* local/man/*


EXPOSE 8081
ENTRYPOINT ["/lufi/docker-entrypoint.sh"]