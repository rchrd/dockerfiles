FROM alpine

ENV VERSION 0.24.1

RUN apk add --no-cache openssl py-pygments py-setuptools
RUN wget https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz \
    && tar -xzf hugo_${VERSION}_Linux-64bit.tar.gz -C / \
    && mv /hugo_${VERSION}_linux_amd64/hugo_${VERSION}_linux_amd64 /hugo \
    && rm -rf hugo_*

ENTRYPOINT ["/hugo"]
