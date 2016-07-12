FROM alpine

ENV VERSION 0.16

RUN apk add --no-cache openssl py-pygments py-setuptools

RUN wget https://github.com/spf13/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tgz \
    && tar -xzf hugo_${VERSION}_linux-64bit.tgz -C / \
    && rm -rf hugo_*

ENTRYPOINT ["/hugo"]
