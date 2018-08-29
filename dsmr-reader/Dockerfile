FROM python:3.7-alpine3.7

ENV DSMR_READER_VERSION v1.23.1

ENV DSMR_USER     admin
ENV DSMR_EMAIL    root@localhost
ENV DSMR_PASSWORD admin

ENV DB_HOST dsmrdb
ENV DB_USER dsmrreader
ENV DB_PASS dsmrreader
ENV DB_NAME dsmrreader

RUN apk add --no-cache \
      curl \
      nginx \
      postgresql-client \
      supervisor

RUN curl --location https://github.com/dennissiemensma/dsmr-reader/archive/${DSMR_READER_VERSION}.tar.gz -o /tmp/dsmr.tar.gz && \
    tar -xzf /tmp/dsmr.tar.gz -C / && \
    mv /dsmr-reader* /dsmr && \
    rm -f /tmp/dsmr.tar.gz && \
    cp /dsmr/dsmrreader/provisioning/django/postgresql.py /dsmr/dsmrreader/settings.py

RUN apk add --virtual .build-deps gcc musl-dev postgresql-dev && \
    pip3 install --upgrade pip && \
    pip3 install six --no-cache && \
    pip3 install -r /dsmr/dsmrreader/provisioning/requirements/base.txt --no-cache-dir && \
    pip3 install -r /dsmr/dsmrreader/provisioning/requirements/postgresql.txt --no-cache-dir && \
    apk --purge del .build-deps

RUN mkdir -p /run/nginx/ && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    rm -f /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/www/dsmrreader/static && \
    cp /dsmr/dsmrreader/provisioning/nginx/dsmr-webinterface /etc/nginx/conf.d/dsmr-webinterface.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

WORKDIR /dsmr

CMD ["/entrypoint.sh"]
