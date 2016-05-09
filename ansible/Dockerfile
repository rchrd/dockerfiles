FROM alpine

ENV ANSIBLE_VERSION 2.0.2.0
ENV ANSIBLE_CONFIG /ansible.cfg

RUN apk add --update python py-pip py-crypto openssh-client sshpass gcc python-dev musl-dev libffi-dev openssl-dev && \
    rm -rf /var/cache/apk/*

RUN pip install --upgrade pip && \
    pip install ansible==${ANSIBLE_VERSION}

ADD ansible.cfg /ansible.cfg

ADD run.sh /run.sh

RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
