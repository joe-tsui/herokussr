FROM alpine:edge


RUN apk update \
    && apk add python libsodium unzip wget \
    && rm -rf /var/cache/apk/*

RUN mkdir /ssr \
    && cd /ssr \
    && wget --no-check-certificate https://github.com/joe-tsui/ssr-docker/raw/master/shadowsocksr-manyuser.zip -O /tmp/manyuser.zip \
    && unzip -d /tmp /tmp/manyuser.zip \
    && mv /tmp/shadowsocksr-manyuser/shadowsocks /ssr/shadowsocks \
    && rm -rf /tmp/*


COPY config.json /config.json
COPY dns.conf /ssr/shadowsocks/dns.conf
COPY r.sh /ssr/shadowsocks/r.sh
RUN chmod 777 /ssr/shadowsocks/r.sh

USER root

WORKDIR /ssr/shadowsocks

CMD /ssr/shadowsocks/r.sh
