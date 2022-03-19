FROM debian:stable-slim

# https://github.com/borgbackup/borg/releases
ENV VERSION_BORG=1.2.0
# https://github.com/rclone/rclone/releases
ENV VERSION_RCLONE=1.58.0

RUN apt-get -y update \
    && apt-get -y install --no-install-recommends busybox-static ca-certificates \
    && apt-get -y clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/busybox --install

RUN wget https://github.com/borgbackup/borg/releases/download/${VERSION_BORG}/borg-linux64 --output-document /usr/local/bin/borg \
    && chmod 755 /usr/local/bin/borg

RUN wget https://downloads.rclone.org/v${VERSION_RCLONE}/rclone-v${VERSION_RCLONE}-linux-amd64.zip --output-document /tmp/rclone.zip \
    && unzip /tmp/rclone.zip -d /tmp \
    && cp /tmp/rclone-v${VERSION_RCLONE}-linux-amd64/rclone /usr/local/bin/rclone \
    && chmod 755 /usr/local/bin/rclone \
    && rm -rf /tmp/rclone*
