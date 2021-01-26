FROM python:3.9-slim

ENV VERSION_NOVNC 1.2.0
ENV VERSION_WEBSOCKIFY 0.9.0

RUN apt-get update \
    && apt-get install -y git procps --no-install-recommends \
    && apt-get clean \
    && pip install --no-cache-dir numpy \
    && mkdir /novnc \
    && git clone --depth 1 --branch v${VERSION_NOVNC} https://github.com/novnc/noVNC.git /novnc \
    && git clone --depth 1 --branch v${VERSION_WEBSOCKIFY} https://github.com/novnc/websockify.git /novnc/utils/websockify \
    && cp /novnc/vnc.html /novnc/index.html

WORKDIR /novnc

EXPOSE 6080

ENTRYPOINT ["./utils/launch.sh"]
