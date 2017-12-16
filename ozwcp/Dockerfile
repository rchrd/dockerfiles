FROM alpine:3.7 as builder

RUN apk add --no-cache \
      gnutls \
      gnutls-dev \
      libmicrohttpd \
      libmicrohttpd-dev \
      gcc \
      git \
      make \
      g++ \
      linux-headers \
      libusb \
      libusb-dev \
      eudev \
      eudev-dev \
      coreutils

RUN mkdir /install

RUN git clone https://github.com/OpenZWave/open-zwave.git /install/open-zwave && \
    cd /install/open-zwave && \
    make

RUN git clone https://github.com/OpenZWave/open-zwave-control-panel.git /install/open-zwave-control-panel && \
    cd /install/open-zwave-control-panel && \
    sed -i 's/#GNUTLS := -lgnutls/GNUTLS := -lgnutls/' Makefile && \
    sed -i 's/#LIBUSB := -ludev/LIBUSB := -ludev/' Makefile && \
    sed -i 's/#LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) -lresolv/LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) -lresolv/' Makefile && \
    sed -i 's/LIBUSB := -framework IOKit -framework CoreFoundation/#LIBUSB := -framework IOKit -framework CoreFoundation/' Makefile && \
    sed -i 's/LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) $(ARCH) -lresolv/#LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) $(ARCH) -lresolv/' Makefile && \
    make && \
    ln -sd ../open-zwave/config



FROM alpine:3.7

RUN apk add --no-cache \
      gnutls \
      gnutls-dev \
      libmicrohttpd \
      libusb \
      eudev

COPY --from=builder /install /install

EXPOSE 8090

WORKDIR /install/open-zwave-control-panel

ENTRYPOINT ["./ozwcp"]
