FROM alpine

ENV VERSION 0.18.1

RUN apk add --no-cache openssl py-pygments py-setuptools

RUN wget https://github.com/spf13/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz \
    && tar -xzf hugo_${VERSION}_Linux-64bit.tar.gz -C / \
    && rm -rf hugo_*

ENTRYPOINT ["/hugo"]
