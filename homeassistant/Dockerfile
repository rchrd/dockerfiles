FROM arm32v6/alpine:3.6

ENV TZ Europe/Amsterdam

RUN apk add --no-cache \
      python3 \
      python3-dev \
      musl-dev \
      linux-headers \
      openssl \
      py3-certifi \
      ca-certificates \
      libressl-dev \
      libxslt-dev \
      libxml2-dev \
      py3-lxml \
      gcc && \
    pip3 install homeassistant==0.49.1 && \
    mkdir -p /config

VOLUME /config

EXPOSE 8123

CMD ["hass", "-c", "/config"]
