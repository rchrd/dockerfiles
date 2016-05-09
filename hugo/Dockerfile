FROM alpine

ENV VERSION 0.15

RUN apk add --update openssl py-pygments py-setuptools && \
    rm -rf /var/cache/apk/*

RUN wget https://github.com/spf13/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux_amd64.tar.gz && \
    tar -xzf hugo_${VERSION}_linux_amd64.tar.gz && \
    cd hugo_${VERSION}_linux_amd64 && \
    mv hugo_${VERSION}_linux_amd64 /hugo && \
    cd / && \
    rm -rf hugo_${VERSION}*

ENTRYPOINT ["/hugo"]
