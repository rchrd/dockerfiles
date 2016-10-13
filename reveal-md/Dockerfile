FROM alpine:3.4

RUN apk add --no-cache nodejs

RUN npm install -g reveal-md

RUN mkdir -p /presentations
WORKDIR /presentations

EXPOSE 8000

CMD ["reveal-md", "--port", "8000", "--disableAutoOpen"]
