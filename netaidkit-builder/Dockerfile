FROM debian:8

RUN apt-get update \
    && apt-get install -y \
      wget \
      git-core \
      build-essential \
      libssl-dev \
      libncurses5-dev \
      unzip \
      subversion \
      gawk \
      python \
      python-passlib \
      jq \
    && apt-get clean

WORKDIR /root

RUN git clone https://github.com/radicallyopensecurity/netaidkit

WORKDIR /root/netaidkit

CMD make image && mv /root/netaidkit/openwrt/bin/* /netaidkit-bin/
